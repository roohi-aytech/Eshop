package eshop

import org.springframework.transaction.annotation.Transactional

class ProductService {

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
}
