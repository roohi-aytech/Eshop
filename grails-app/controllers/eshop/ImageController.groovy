package eshop

import eshop.accounting.Account
import eshop.delivery.DeliveryMethod
import grails.plugin.cache.Cacheable
import grails.util.Environment

import java.text.DateFormat
import java.text.SimpleDateFormat

class ImageController {
    def imageService
    def fileService

    def get() {
        def path = params.path
        def content = fileService.getFileContent(path)
        response.contentType = 'image/jpeg'
        response.outputStream << content
        response.outputStream.flush()
    }
//    @Cacheable(value='image')
    def index() {

//        if (Environment.current != Environment.DEVELOPMENT)
//            cache shared: true, validUntil: new Date() + 1
        if (params.id && params.id.toString().contains("{{")) { //angular parameter
            def seconds = 3600 * 24 * 365
            DateFormat httpDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);
            httpDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
            Calendar cal = new GregorianCalendar();
            cal.add(Calendar.SECOND, seconds);
            response.setHeader("Cache-Control", "PUBLIC, max-age=" + seconds + ", must-revalidate");
            response.setHeader("Expires", httpDateFormat.format(cal.getTime()));
            response.contentType = 'image/jpeg'
            response.setStatus(200)
            response.outputStream << new byte[0]
            response.outputStream.flush()
            return
        }
        if(params.id?.toString().startsWith('KR')) {
            params.id?.split('_')?.each {
                def ps = it.split('-')
                if (ps.size() > 1)
                    params[ps[0]] = ps[1]
            }
        }
        if (!params.type)
            params.type = 'product'
        def content = []

        switch (params.type) {
            case 'product':
                def product = Product.get(params.id)
//                if (!product)
//                    product = ProductModel.get(params.id)?.product
                if (product) {
                    content = getProdcutImage(product)
                }
                if (!content || content?.size() == 0) {
                    if (params.name)
                        content = product.images.find { it.name == params.name }?.fileContent
                    else if (product?.mainImage)
                        content = product?.mainImage?.fileContent
                    else
                        content = product?.images.find()?.fileContent
                }
                break;
            case 'productModel':
                def productModel = ProductModel.get(params.id)
                if (productModel) {
                    content = getProdcutModelImage(productModel)
                }
                if (!content || content?.size() == 0) {
                    if (params.name)
                        content = productModel.product.images.find { it.name == params.name }?.fileContent
                    else if (productModel.mainImage)
                        content = productModel.mainImage?.fileContent
                    else if (productModel.product.mainImage)
                        content = productModel.product.mainImage?.fileContent
                    else
                        content = productModel.product.images.find()?.fileContent
                }
                break;
            case 'productType':
                def productType = ProductType.get(params.id)
                if (productType) {
                    content = getProdcutTypeImage(productType)
                }
                if (!content || content?.size() == 0) {
                    if (productType?.image)
                        content = productType?.image
                }
                break;
            case 'productTypeMenu':
                def productType = ProductType.get(params.id)
                if (productType) {
                    switch (params.role) {
                        case 'e1':
                            def menuConfig = MenuConfig.findByProductType productType
                            content = menuConfig.extraMenuImage1
                            break
                        case 'e2':
                            def menuConfig = MenuConfig.findByProductType productType
                            content = menuConfig.extraMenuImage2
                            break
                        case 'e3':
                            def menuConfig = MenuConfig.findByProductType productType
                            content = menuConfig.extraMenuImage3
                            break
                        case 'e4':
                            def menuConfig = MenuConfig.findByProductType productType
                            content = menuConfig.extraMenuImage4
                            break
                        case 'e5':
                            def menuConfig = MenuConfig.findByProductType productType
                            content = menuConfig.extraMenuImage5
                            break
                        default:
                            content = productType.menuImage
                    }
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
            case 'variationValue':
                def variationValue = VariationValue.get(params.id)
                if (variationValue) {
                    content = variationValue?.image?.fileContent
                }
                break;
            case 'addedValue':
                def addedValue = AddedValue.get(params.id)
                if (addedValue) {
                    content = addedValue?.image?.fileContent
                }
                break;
            case 'addedValueType':
                def addedValue = AddedValueType.get(params.id)
                if (addedValue) {
                    content = addedValue?.image?.fileContent
                }
                break;
            case 'guarantee':
                def guarantee = Guarantee.get(params.id)
                if (guarantee) {
                    content = guarantee.logo
                }
                break;

            case 'specialSale':
                def specialSaleSlide = SpecialSaleSlide.get(params.id)
                if (specialSaleSlide) {
                    switch (params.role) {
                        case 'e1':
                            content = specialSaleSlide.extraImage1
                            break
                        case 'e2':
                            content = specialSaleSlide.extraImage2
                            break
                        case 'e3':
                            content = specialSaleSlide.extraImage3
                            break
                        default:
                            content = specialSaleSlide.image
                    }
                }
                break;
            case 'mainSlide':
                def slide = Slide.get(params.id)
                content = slide.image
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
            case 'article':
                def article = JournalArticle.get(params.id)
                content = article.image
                break;
        }
        if (content) {
            def seconds = 3600 * 24 * 7
            DateFormat httpDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);
            httpDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
            Calendar cal = new GregorianCalendar();
            cal.add(Calendar.SECOND, seconds);
            response.setHeader("Cache-Control", "PUBLIC, max-age=" + seconds + ", must-revalidate");
            response.setHeader("Expires", httpDateFormat.format(cal.getTime()));
            response.contentType = 'image/jpeg'
            response.setStatus(200)
            response.outputStream << content
            response.outputStream.flush()
//            render null
        } else {
            def seconds = 3600 * 24 * 7
            DateFormat httpDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);
            httpDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
            Calendar cal = new GregorianCalendar();
            cal.add(Calendar.SECOND, seconds);
            response.setHeader("Cache-Control", "PUBLIC, max-age=" + seconds + ", must-revalidate");
            response.setHeader("Expires", httpDateFormat.format(cal.getTime()));
            response.contentType = 'image/jpeg'
            response.setStatus(200)
            response.outputStream << new byte[1]
            response.outputStream.flush()
        }

    }
//    @Cacheable(value='pimage', key='#product.id.toString()')
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
                        request.getSession().getServletContext().getRealPath("/images/${grailsApplication.config.eShop.instance}-watermark.png"))

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
//    @Cacheable(value='pmimage', key='#productModel.id.toString()')
    byte[] getProdcutModelImage(ProductModel productModel) {
        def img
        if (params.name)
            img = productModel?.product?.images?.find { it.name == params.name }
        else if (productModel?.mainImage)
            img = productModel?.mainImage
        else
            img = productModel?.product?.images?.find { imageService.imageSpecificToModel(it, productModel) }
        if (!img) {
            if (productModel?.product?.mainImage)
                img = productModel?.product?.mainImage
            else
                img = productModel?.product?.images?.find { imageService.imageBelongsToModel(it, productModel) }
        }

        if (!img)
            img = productModel?.product?.images?.find()
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
                        fileService.filePath(productModel?.product),
                        request.getSession().getServletContext().getRealPath("/images/${grailsApplication.config.eShop.instance}-watermark.png"))

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
//    @Cacheable(value='ptimage', key='#productType.id.toString()')
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
//    @Cacheable(value='pttimage', key='#productTypeType.id.toString()')
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
