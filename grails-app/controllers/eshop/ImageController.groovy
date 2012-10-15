package eshop

class ImageController {
    def imageService

    def index() {
        def product = Product.get(params.id)
        def img = product.images.find {it.name == params.name}
        if (img) {
            def content
            if(params.wh){
                content=imageService.getImage(img,params.wh,params.id)
            }else{
                content = img.fileContent
            }
            response.contentType = 'image/png'
            response.outputStream << content
            response.outputStream.flush()
        }
    }
}
