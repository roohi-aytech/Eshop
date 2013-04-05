package eshop

import eshop.discout.Discount

class ImageController {
    def imageService
    def fileService

    def get() {
        def path = params.path
        def content = fileService.getFileContent(path)
        response.contentType = 'image/png'
        response.outputStream << content
        response.outputStream.flush()
    }

    def index() {
        if (!params.type)
            params.type = 'product'
        def content

        switch (params.type) {
            case 'product':
                def product = Product.get(params.id)
                if (product) {
                    content = getProdcutImage(product)
                }
                break;
            case 'discount':
                def discount = Discount.get(params.id)
                if (discount) {
                    content = getDiscountImage(discount)
                }
                break;
        }

        if (content) {
            response.contentType = 'image/png'
            response.outputStream << content
            response.outputStream.flush()
        }

    }

    byte[] getProdcutImage(Product product) {
        def img
        if (params.name)
            img = product.images.find { it.name == params.name }
        else if (product.mainImage)
            img = product.mainImage
        else
            img = product.images.find()
        if (!img) {
            img = new Content(name: "no-image.png", contentType: "", fileContent: new File("no-image.png").bytes)
            params.wh = ""
        }

        def content
        if (img) {
            if (params.wh) {
                content = imageService.getImage(img, params.wh, fileService.filePath(product))
            } else {
                content = img.fileContent
            }

        }
        content
    }

    byte[] getDiscountImage(Discount discount) {
        discount.image
    }
}
