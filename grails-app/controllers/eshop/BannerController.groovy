package eshop

import grails.converters.JSON

class BannerController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def bannerInstance
        if (params.id)
            bannerInstance = Banner.get(params.id)
        else
            bannerInstance = new Banner()
        render(template: "form", model: [bannerInstance: bannerInstance])
    }

    def list() {
    }

    def save() {
        Banner bannerInstance
        if (params.id) {
            bannerInstance = Banner.get(params.id)
            bannerInstance.properties = params
        } else {
            bannerInstance = new Banner(params)
        }

        bannerInstance.gridSortIndex = bannerInstance.position == 'left' ? 90 + bannerInstance.sortIndex : bannerInstance.sortIndex

        if (bannerInstance.validate() && bannerInstance.save()) {

            def banner = Banner.findByIdNotEqualAndPositionAndSortIndex(bannerInstance.id, bannerInstance.position, bannerInstance.sortIndex)
            while(banner){
                banner.sortIndex++
                banner.gridSortIndex = banner.position == 'left' ? 90 + banner.sortIndex : banner.sortIndex
                banner.save()
                banner = Banner.findByIdNotEqualAndPositionAndSortIndex(banner.id, banner.position, banner.sortIndex)
            }

            render bannerInstance as JSON
        } else
            render(template: "form", model: [bannerInstance: bannerInstance])
    }

    def delete() {
        def bannerInstance = Banner.get(params.id)
        bannerInstance.deleted = true
        bannerInstance.save()
        render 0
    }

    def getImage() {
        def banner = Banner.get(params.id)
        if (banner) {
            response.addHeader("content-disposition", "attachment;")
            response.contentLength = banner.image.length
            response.outputStream << banner.image

        } else {
            response.contentLength = 0
            response.outputStream << []
        }

    }
}
