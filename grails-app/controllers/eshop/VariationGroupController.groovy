package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import grails.converters.JSON

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class VariationGroupController {
    def imageService
    def fileService
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
    }

    def form() {
        def variationGroup
        if (params.id)
            variationGroup = VariationGroup.findById(params.id)
        else
            variationGroup = new VariationGroup()

        render(template: "form", model: [variationGroupInstance: variationGroup])
    }

    @Secured([RoleHelper.ROLE_PRODUCT_ADMIN, RoleHelper.ROLE_PRODUCT_TYPE_ADMIN, RoleHelper.ROLE_PRODUCT_ADD, RoleHelper.ROLE_PRODUCT_ADD_EDIT])
    def variationForm() {
        def variation
        if (params.id)
            variation = Variation.findById(params.id)
        else
            variation = new Variation()
        def baseProduct = BaseProduct.get(params.baseProductId)
        def parentProductTypes = []
        if (baseProduct instanceof Product) {
            def pt = baseProduct.productTypes.find()
            while (pt) {
                parentProductTypes << pt
                pt = pt.parentProduct
            }
        } else if (baseProduct instanceof ProductType) {
            def pt = baseProduct
            while (pt) {
                parentProductTypes << pt
                pt = pt.parentProduct
            }
        }
        render(template: "variation_form", model: [variationInstance: variation, baseProductId: params.baseProductId, parentProductTypes: parentProductTypes])
    }

    def variationGroups() {
        def baseProduct = BaseProduct.get(params.baseProductId)
        def parentProductTypes = []
        if (baseProduct instanceof Product) {
            def pt = baseProduct.productTypes.find()
            while (pt) {
                parentProductTypes << pt
                pt = pt.parentProduct
            }
        } else if (baseProduct instanceof ProductType) {
            def pt = baseProduct
            while (pt) {
                parentProductTypes << pt
                pt = pt.parentProduct
            }
        }
        render VariationGroup.findAllByProductTypeIsNullOrProductTypeInList(parentProductTypes).sort {
            it.name
        }.collect { [id: it.id, name: it.name] } as JSON
    }

    @Secured([RoleHelper.ROLE_PRODUCT_ADMIN, RoleHelper.ROLE_PRODUCT_TYPE_ADMIN, RoleHelper.ROLE_PRODUCT_ADD, RoleHelper.ROLE_PRODUCT_ADD_EDIT])
    def variationValueForm() {
        def variationValue
        if (params.id)
            variationValue = VariationValue.findById(params.id)
        else
            variationValue = new VariationValue(params)
        render(template: "variation_value_add", model: [variationValueInstance: variationValue])
    }

    @Secured([RoleHelper.ROLE_PRODUCT_ADMIN, RoleHelper.ROLE_PRODUCT_TYPE_ADMIN, RoleHelper.ROLE_PRODUCT_ADD, RoleHelper.ROLE_PRODUCT_ADD_EDIT])
    def saveVariationValue() {
        def variationValue
        if (params.id) {
            variationValue = VariationValue.findById(params.id)
            variationValue.properties = params
        } else {
            variationValue = new VariationValue(params)
            variationValue.indx = 0
        }
        if (variationValue.save())
            render variationValue as JSON
        else {
            render(template: "variation_value_add", model: [variationValueInstance: variationValue])
        }
    }

    @Secured([RoleHelper.ROLE_PRODUCT_ADMIN, RoleHelper.ROLE_PRODUCT_TYPE_ADMIN, RoleHelper.ROLE_PRODUCT_ADD, RoleHelper.ROLE_PRODUCT_ADD_EDIT])
    def variationValues() {
        def variationGroup
        def variation
        def variationValues
        if (params.id)
            variationGroup = VariationGroup.findById(params.id)

        if (params.baseProductId && variationGroup) {
            def baseProduct = BaseProduct.get(params.baseProductId)
            variation = Variation.findByBaseProductAndVariationGroup(baseProduct, variationGroup)
            if (baseProduct instanceof ProductType) {
                if (baseProduct.parentProduct) {
                    def parentproductvariation = baseProduct.parentProduct.variations.find {
                        it.variationGroup == variationGroup
                    }
                    variationValues = parentproductvariation?.variationValues
                }
            }
            if (baseProduct instanceof Product) {
                if (variationGroup.productType) {
                    variationValues = variationGroup.variationValues
                } else {
                    def parentproductvariation = baseProduct?.productTypes.find { true }?.variations?.find {
                        it.variationGroup == variationGroup
                    }
                    variationValues = parentproductvariation?.variationValues

                    variation?.variationValues?.each {
                        if (!variationValues.contains(it))
                            variationValues.add(it)
                    }
                }
            }
        }

        if (!variationGroup)
            variationGroup = new VariationGroup()
        if (!variation)
            variation = new Variation()


        render(template: "variation_values", model: [variationGroupInstance: variationGroup, variationInstance: variation, variationValues: variationValues])
    }

    @Secured([RoleHelper.ROLE_PRODUCT_ADMIN, RoleHelper.ROLE_PRODUCT_TYPE_ADMIN, RoleHelper.ROLE_PRODUCT_ADD, RoleHelper.ROLE_PRODUCT_ADD_EDIT])
    def searchVariationValues() {
        def variationGroup = VariationGroup.get(params.variationGroupId)
        def values = VariationValue.findAllByVariationGroupAndValueIlike(variationGroup, "%${params.term}%")
        def map = values.collect {
            [id: it.id, label: it.toString(), value: it.toString()]
        }
        render map as JSON
    }

    def save() {
        def variationGroup
        if (params.id) {
            variationGroup = VariationGroup.get(params.id)
            variationGroup.properties = params
        } else
            variationGroup = new VariationGroup(params)
        bindComposites(variationGroup, params)
        variationGroup.save()
        render 0
    }

    def delete() {
        def variationGroup = VariationGroup.get(params.id)
        if (variationGroup)
            variationGroup.delete()
        render 0
    }

    def deleteVariation() {
        def variation = Variation.get(params.id)
        if (variation)
            variation.delete()
        render 0
    }

    @Secured([RoleHelper.ROLE_PRODUCT_ADMIN, RoleHelper.ROLE_PRODUCT_TYPE_ADMIN, RoleHelper.ROLE_PRODUCT_ADD, RoleHelper.ROLE_PRODUCT_ADD_EDIT])
    def saveVariation() {
        Variation variation
        if (params.id) {
            variation = Variation.get(params.id)
            variation.properties = params
        } else
            variation = new Variation(params)

        variation.variationValues = request.getParameterValues('variationValues').collect {
            VariationValue.findById(it.toLong())
        }
        variation.save()
        def baseProduct = variation.baseProduct
        def productType
        if (baseProduct instanceof Product)
            productType = baseProduct.productTypes.find { true }
        else if (baseProduct instanceof ProductType)
            productType = baseProduct.parentProduct
        while (productType) {
            def pvariation = productType.variations.find { it.variationGroup == variation.variationGroup }
            if (!pvariation)
                pvariation = new Variation(name: variation.variationGroup.name, baseProduct: productType, variationGroup: variation.variationGroup)
            variation.variationValues.each {
                if (!pvariation.variationValues || !pvariation.variationValues.contains(it))
                    pvariation.addToVariationValues(it)
            }
            pvariation.save()
            productType = productType.parentProduct
        }

        render 0
    }

    def correctVariationsOfProductTypes() {

        def variationsForDelete = Variation.findAllByBaseProductInList(ProductType.findAll())

        variationsForDelete.each {
            it.variationValues.clear()
            if (!it.save()) {
                render it.toString() + "<br/> "
                render it.errors.toString() + "<br/> "
            }
        }

        def variationsForCorrection = Variation.findAllByBaseProductInList(Product.findAll())
        variationsForCorrection.eachWithIndex { variation, index ->

            println index
            def baseProduct = variation.baseProduct
            def productType
            if (baseProduct instanceof Product)
                productType = baseProduct.productTypes.find { true }
            else if (baseProduct instanceof ProductType)
                productType = baseProduct.parentProduct
            while (productType) {
                def pvariation = productType.variations.find { it.variationGroup == variation.variationGroup }
                if (!pvariation)
                    pvariation = new Variation(name: variation.variationGroup.name, baseProduct: productType, variationGroup: variation.variationGroup)

                variation.variationValues.each {
                    if (!pvariation.variationValues || !pvariation.variationValues.contains(it))
                        pvariation.addToVariationValues(it)
                }
                pvariation.save()
                productType = productType.parentProduct

                render pvariation.toString()
            }
        }
        render "finished"

    }

    def variationImages() {
        render(template: 'variationImages', model: [variationGroup: VariationGroup.get(params.id)])
    }

    def variationImagesSave(){
        def variationGroup=VariationGroup.get(params.id)
        variationGroup?.variationValues.each {
            if(params['image_'+it.id]){
                def img=params['image_'+it.id]
                if(!it.image)
                    it.image=new Content(name:it.value,contentType:'image')
                it.image.fileContent=img.bytes

                it.image.save()
                it.save()
            }
        }
        render 0
    }
}
