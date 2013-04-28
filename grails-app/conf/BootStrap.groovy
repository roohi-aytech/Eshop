import grails.util.GrailsUtil
import eshop.*

import static eshop.RoleHelper.*
import grails.converters.JSON

class BootStrap {

    def grailsApplication

    def saveIt = {
        if (!it.save()) {
            it.errors.allErrors.each {error ->
                println "${error}"
            }
        }
    }

    def roles = [ROLE_USER, ROLE_USER_ADMIN, ROLE_PRODUCT_ADMIN, ROLE_PRODUCT_TYPE_ADMIN, ROLE_PRICE_ADMIN, ROLE_CUSTOMER]

    def init = { servletContext ->

        JSON.registerObjectMarshaller(VariationGroup) {
            def returnArray = [:]
            returnArray['name'] = it.name
            returnArray['representationType'] = it.representationType
            returnArray['variationValues'] = it.variationValues
            return returnArray
        }


        roles.each {
            def authority = it
            def role = Role.findByAuthority(authority) ?: new Role(authority: authority).save(failOnError: true)
        }
        def adminRole = Role.findByAuthority(RoleHelper.ROLE_USER_ADMIN)

        def adminUser = User.findByUsername('admin') ?: new User(
                username: 'admin',
                password: 'admin',
                firstName: 'admin',
                lastName: 'admin',
                email: 'admin@test.com',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create adminUser, adminRole
        }

        def attrs = Attribute.findAllByAttributeValueIsNotNull()
        attrs.each { attr ->
            def val = attr.attributeType.values.find {it.value == attr.attributeValue}
            if (!val) {
                val = new AttributeValue(value: attr.attributeValue).save()
                if(attr.attributeValue!='N/A')
                {
                    attr.attributeType.addToValues(val)
                    attr.attributeType.save()
                }
            }
            attr.value = val
            attr.attributeValue = null
            attr.save()

        }
        AttributeValue.findAllByValueLike('%\\n%').each {
            it.value=it.value.replace("\\n","\n")
            it.save()
        }

//        def province = new Province(title: "Tehran")
//        def city = new City(title: "Tehran", province: province)
//        province.addToCities(city)
//        province.save()


        if (GrailsUtil.environment == "development") {
            def validationTagLib = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ValidationTagLib')
            Closure messageClosure = { vals ->
                //println "${attrs.code}"
                def messagesFile = grailsApplication.config.eshop.messages.file
//                println vals.code
                messagesFile.append("${vals.code}\n")

                messageImpl(vals)
            }
            messageClosure.setResolveStrategy(Closure.DELEGATE_ONLY)
            messageClosure.setDelegate(validationTagLib)
            validationTagLib.message = messageClosure

//            def at1 = new AttributeType(name: "a1", attributeType: "String")
//            def at2 = new AttributeType(name: "a2", attributeType: "String")

//            def pt1 = new ProductType(name: "pt1", description: "")
//            pt1.addToAttributeTypes(at1)
//            pt1.rootProductType = pt1
//            saveIt pt1
//
//            def pt2 = new ProductType(name: "pt2", description: "")
//            pt2.addToAttributeTypes(at2)
//            pt2.rootProductType = pt2
//            saveIt pt2

//            def pr1 = new Product(name: "pr1", description: "pr1")
//            pr1.addToProductTypes(pt1)
//            saveIt pr1
//
//            def pr2 = new Product(name: "pr2", description: "pr2")
//            pr2.addToProductTypes(pt2)
//            saveIt pr2
//
//            def pr3 = new Product(name: "pr3", description: "pr3")
//            pr3.addToProductTypes(pt1)
//            pr3.addToProductTypes(pt2)
//            saveIt pr3
        }
    }

    def destroy = {
    }
}
