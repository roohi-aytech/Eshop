package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class BrandController {
    def mongoService

    def form() {
        def brand
        if (params.id)
            brand = Brand.findById(params.id)
        else
            brand = new Brand()

        render(template: "/brand/form", model: [brandInstance: brand])
    }

    def save() {
        def brand
        if (params.id) {
            brand = Brand.get(params.id)
            def logo = brand.logo
            brand.properties = params
            if (!brand.logo)
                brand.logo = logo
        } else
            brand = new Brand(params)
        if (params.imageDeleted) {
            brand.logo = null
        }
        if (brand.validate()) {
            brand.save(flush: true)
            Product.findAllByBrand(brand).each {
                it.isSynchronized = false
                it.save()
            }

            render brand as JSON
        } else {
            render(template: "/brand/form", model: [brandInstance: brand])
        }
    }

    def delete() {
        def brand = Brand.get(params.id)
        if (brand) {
            Product.findAllByBrand(brand).each {
                it.brand = null
                it.save()
            }
            brand.delete()
        }
        render 0
    }

    def list() {

    }

    def index() {
        redirect(action: "list")
    }

    def getLogo() {
        def brand = Brand.get(params.id)
        if (brand && brand.logo) {
            response.addHeader("content-disposition", "attachment;filename=$brand.name")
//        response.contentType = "image/jpeg"
            response.contentLength = brand.logo.length
            response.outputStream << brand.logo
        } else {
            response.contentLength = 0
            response.outputStream << []
        }

    }

}
