package eshop

import org.springframework.transaction.annotation.Transactional
import org.springframework.web.context.request.RequestContextHolder

import javax.servlet.http.Cookie

class ProductService {

    def springSecurityService
    def priceService

    @Transactional()
    synchronized void addImageToProduct(productId, Set<Content> images) {
        synchronized (this) {
            def product = Product.lock(productId)
            product.images.addAll(images)
            product.merge(flush: true)
        }
    }

    @Transactional()
    synchronized boolean deleteProductImage(productId, imagename) {
        synchronized (this) {
            def product = Product.lock(productId)
            def image
            product.images.each {
                if (it.name == imagename) {
                    image = it
                }
            }
            if (image) {
                product.removeFromImages(image)
                product.merge(flush: true)
                return true
            }
            return false
        }
    }

    @Transactional()
    synchronized void addVideoToProduct(productId, Set<Content> images) {
        synchronized (this) {
            def product = Product.lock(productId)
            product.videos.addAll(images)
            product.merge(flush: true)
        }
    }

    @Transactional()
    synchronized boolean deleteProductVideo(productId, imagename) {
        synchronized (this) {
            def product = Product.lock(productId)
            def image
            product.videos.each {
                if (it.name == imagename) {
                    image = it
                }
            }
            if (image) {
                product.removeFromVideos(image)
                product.merge(flush: true)
                return true
            }
            return false
        }
    }

    def findRootProductTypes() {
        def result = ProductType.findAllByParentProductIsNullAndDeleted(false).collect { [id: it.id, name: it.name, urlName: it.urlName] }
        result.each { rootItem ->
            findChildProductTypes(rootItem)
        }
        result
    }

    def findChildProductTypes(parentProductType){
        parentProductType.children = ProductType.findAllByParentProductAndDeleted(ProductType.get(parentProductType.id), false).collect { [id: it.id, name: it.name, urlName: it.urlName] }
        ProductType.createCriteria().listDistinct {
            godFathers {
                eq('id', parentProductType.id)
            }
            eq('deleted', false)
        }.each {
            parentProductType.children << [id: it.id, name: it.name, urlName: it.urlName]
        }

        parentProductType.children.each{
            findChildProductTypes(it)
        }
    }

    def findLastVisitedProducts(lastVisitedProductsCookie) {
        def session = RequestContextHolder.currentRequestAttributes().getSession()
        def lastVisitedProducts
        synchronized (this.getClass()) {
            lastVisitedProducts = session.getAttribute('lastVisitedProducts')
            if (!lastVisitedProducts) {
                lastVisitedProducts = []
                String lastVisitedProductsStr = lastVisitedProductsCookie
                if (lastVisitedProductsStr)
                    lastVisitedProducts = lastVisitedProductsStr.split(",").toList()
            }
        }

        if (lastVisitedProducts) {
            return Product.createCriteria().list() {
                'in'('id', lastVisitedProducts.collect() { it.toLong() })
            }
        }
    }

    def findCustomerWishList() {
        if (!springSecurityService)
            return

        def user = springSecurityService.currentUser
        if (user && user instanceof Customer)
            return Customer.findByUsername(((Customer) user).username).wishList.collect {
                [id: it.id, title: it.toString(), price: priceService.calcProductPrice(it.id).showVal]
            }
    }
}
