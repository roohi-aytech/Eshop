package eshop

import grails.plugin.jxl.builder.ExcelBuilder

@Mixin(ExcelBuilder)
class ExcelService {

    def productService

    def generatePriceList(Long[] productTypeList, Long[] productTypeTypeList, Long[] brandList, Long[] guaranteeList, String[] statusList) {

        def productModels = ProductModel.createCriteria().list {
            if (guaranteeList && guaranteeList.size() > 0) {
                guarantee {
                    'in'('id', guaranteeList)
                }
            }
            if (statusList && statusList.size() > 0) {
                status {
                    'in'('status', statusList)
                }
            }
            product {
                if (brandList && brandList.size() > 0) {
                    brand {
                        'in'('id', brandList)
                    }
                }
                if (productTypeTypeList && productTypeTypeList.size() > 0) {
                    type {
                        'in'('id', productTypeTypeList)
                    }
                }

                if (productTypeList && productTypeList.size() > 0) {
                    productTypes {
                        or {
                            productTypeList.each { productTypeId ->
                                'in'('id', productService.findChildProductTypes(ProductType.get(productTypeId)).collect {
                                    it.id
                                } + [productTypeId])
                            }
                        }
                    }
                }
            }
        }

        println(productModels)

//        workbook('/path/to/test.xls') {
//            sheet('SheetName') {
//                addData([
//                        ['Column 1', 'Column 2'],
//                        ['Value 1', 'Value 2']
//                ])
//            }
//            (0..1).each { cell(it, 0).bold().center() }
//            (0..1).each { cell(it, 1).left() }
//        }
    }
}
