package eshop

import eshop.accounting.Account
import eshop.delivery.DeliveryMethod

import java.text.DateFormat
import java.text.SimpleDateFormat

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

        if (params.id && params.id.toString().contains("{{")) { //angular parameter
            render ""
            return
        }

        if (!params.type)
            params.type = 'product'
        def content

        switch (params.type) {
            case 'product':
                def product = Product.get(params.id)
//                if (!product)
//                    product = ProductModel.get(params.id)?.product
                if (product) {
                    content = getProdcutImage(product)
                }
                break;
            case 'productModel':
                def product = ProductModel.get(params.id)?.product
                if (product) {
                    content = getProdcutImage(product)
                }
                break;
            case 'productType':
                def productType = ProductType.get(params.id)
                if (productType) {
                    content = getProdcutTypeImage(productType)
                }
                break;
            case 'productTypeType':
                def productTypeType = ProductTypeType.get(params.id)
                if (productTypeType) {
                    content = getProdcutTypeTypeImage(productTypeType)
                }
                break;
            case 'brand':
                def brand = Brand.get(params.id)
                if (brand) {
                    content = brand.logo
                }
                break;
            case 'specialSale':
                def specialSaleSlide = SpecialSaleSlide.get(params.id)
                if (specialSaleSlide) {
                    switch (params.size) {
                        case '1280':
                            content = specialSaleSlide.image1280
                            break
                        case '1440':
                            content = specialSaleSlide.image1440
                            break
                        default:
                            content = specialSaleSlide.image1024
                    }
                }
                break;
            case 'mainSlide':
                def slide = Slide.get(params.id)
                if (slide) {
                    switch (params.size) {
                        case '1280':
                            content = slide.image1280
                            break
                        case '1440':
                            content = slide.image1440
                            break
                        default:
                            content = slide.image1024
                    }
                }
                break;
            case 'account':
                def account = Account.get(params.id)
                if (account) {
                    content = account.bankLogo
                }
                break;
            case 'banner':
                def banner = Banner.get(params.id)
                if (banner) {
                   content = banner.image
                }
                break;
            case 'deliveryMethod':
                def deliveryMethod = DeliveryMethod.get(params.id)
                if (deliveryMethod) {
                    content = deliveryMethod.logo
                }
                break;
        }

        if (content) {
            def seconds=3600*24
            DateFormat httpDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);
            httpDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
            Calendar cal = new GregorianCalendar();
            cal.roll(Calendar.SECOND, seconds);
            response.setHeader("Cache-Control", "PUBLIC, max-age=" + seconds + ", must-revalidate");
            response.setHeader("Expires", httpDateFormat.format(cal.getTime()));
            response.contentType = 'image/png'
            response.outputStream << content
            response.outputStream.flush()
        } else
            render ""

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
            img = new Content(name: "no-image.png", contentType: "", fileContent: this.class.getResource("/no-image.png").bytes)
            params.wh = ""
        }

        def content
        if (img) {
            if (params.wh) {
//                if (params.wh == "max")
                    content = imageService.getImage(
                            img,
                            params.wh,
                            fileService.filePath(product),
                            request.getSession().getServletContext().getRealPath("/images/watermark.png"))

//                else
//                    content = imageService.getImage(img, params.wh, fileService.filePath(product))
            } else {
                content = img.fileContent
            }

        }
        if (content instanceof Content)
            return content.fileContent

        content
    }

    byte[] getProdcutTypeImage(ProductType productType) {
//        def img = productType.image
//        if (!img) {
//            img = this.class.getResource("/no-image.png").bytes
//            params.wh = ""
//        }
//
        def content
//        if (img) {
            if (params.wh) {
                content = imageService.getImage(params.wh, fileService.filePath(productType))
            }
//            else {
//                content = img
//            }
//
//        }
        content
    }

    byte[] getProdcutTypeTypeImage(ProductTypeType productTypeType) {
        def img = productTypeType.image
        if (!img) {
            img = this.class.getResource("/no-image.png").bytes
            params.wh = ""
        }

        def content
        if (img) {
            if (params.wh) {
                content = imageService.getImage(params.wh, fileService.filePath(productTypeType))
            } else {
                content = img
            }

        }
        content
    }
}
