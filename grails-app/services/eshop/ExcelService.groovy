package eshop

import jxl.CellView
import jxl.Sheet
import jxl.format.Alignment
import jxl.format.Border
import jxl.format.BorderLineStyle
import jxl.format.Colour
import jxl.format.UnderlineStyle
import jxl.format.VerticalAlignment
import jxl.write.WritableCellFormat
import jxl.write.WritableFont

import javax.servlet.http.HttpServletResponse
import jxl.Workbook
import jxl.write.Label
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook

import java.text.NumberFormat

class ExcelService {

    def productService

    def exportPriceList(
            def productTypeList,
            def productTypeTypeList, def brandList, def guaranteeList, def statusList, HttpServletResponse response) {

        def productModels = ProductModel.createCriteria().listDistinct {
            if (guaranteeList && guaranteeList.size() > 0) {
                guarantee {
                    'in'('id', guaranteeList)
                }
            }
            if (statusList && statusList.size() > 0) {
                'in'('status', statusList)
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
                        'in'('id', productTypeList)
                    }
                }
            }
        }

        response.setContentType('application/vnd.ms-excel')
        response.setHeader('Content-Disposition', 'Attachment;Filename="PriceList.xls"')

        WritableWorkbook workbook = Workbook.createWorkbook(response.outputStream)
        WritableSheet sheet1 = workbook.createSheet("Students", 0)
        sheet1.addCell(new Label(0, 0, "واحد پولی", createHeaderCellFormat()))
        sheet1.addCell(new Label(1, 0, "قیمت", createHeaderCellFormat()))
        sheet1.addCell(new Label(2, 0, "وضعیت", createHeaderCellFormat()))
        sheet1.addCell(new Label(3, 0, "گارانتی", createHeaderCellFormat()))
        sheet1.addCell(new Label(4, 0, "مدل", createHeaderCellFormat()))
        sheet1.addCell(new Label(5, 0, "رنگ", createHeaderCellFormat()))
        sheet1.addCell(new Label(6, 0, "برند", createHeaderCellFormat()))
        sheet1.addCell(new Label(7, 0, "نوع", createHeaderCellFormat()))
        sheet1.addCell(new Label(8, 0, "نوع محصول", createHeaderCellFormat()))
        sheet1.addCell(new Label(9, 0, "#", createHeaderCellFormat()))

        def indexer = 0
        productModels.each {
            indexer++
            def price = calculatePrice(it)
            sheet1.addCell(new Label(0, indexer, price.currency, createNormalCellFormat()))
            sheet1.addCell(new Label(1, indexer, price.value, createNormalCellFormat()))
            sheet1.addCell(new Label(2, indexer, getStatusCode(it.status.toString()) ?: '-', createNormalCellFormat()))
            sheet1.addCell(new Label(3, indexer, it.guarantee?.name ?: '-', createRightAlignedCellFormat()))
            sheet1.addCell(new Label(4, indexer, it.name ?: '-', createRightAlignedCellFormat()))
            sheet1.addCell(new Label(5, indexer, it.variationValues?.find {
                it?.variationGroup?.representationType == 'Color'
            }?.toString() ?: '-', createRightAlignedCellFormat()))
            sheet1.addCell(new Label(6, indexer, it.product?.brand?.name ?: '-', createRightAlignedCellFormat()))
            sheet1.addCell(new Label(7, indexer, it.product?.type?.title ?: '-', createRightAlignedCellFormat()))
            sheet1.addCell(new Label(8, indexer, it.product?.productTypes?.find {
                true
            }?.name ?: '-', createRightAlignedCellFormat()))
            sheet1.addCell(new Label(9, indexer, it.id.toString(), createNormalCellFormat()))
        }

        int c = 10;
        for (int x = 0; x < c; x++) {
            CellView cell = sheet1.getColumnView(x);
            cell.setAutosize(true);
            sheet1.setColumnView(x, cell);
        }

        workbook.write();
        workbook.close();
    }

    WritableCellFormat createHeaderCellFormat() {
        WritableFont font = new WritableFont(WritableFont.TAHOMA, WritableFont.DEFAULT_POINT_SIZE, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, Colour.BLACK)

        WritableCellFormat format = new WritableCellFormat(font)
        format.setWrap(false)
        format.setAlignment(Alignment.CENTRE)
        format.setVerticalAlignment(VerticalAlignment.CENTRE)
        format.setBorder(Border.BOTTOM, BorderLineStyle.MEDIUM, Colour.BLACK)
        format
    }

    WritableCellFormat createNormalCellFormat() {
        WritableFont font = new WritableFont(WritableFont.TAHOMA, WritableFont.DEFAULT_POINT_SIZE, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE, Colour.BLACK)

        WritableCellFormat format = new WritableCellFormat(font)
        format.setWrap(false)
        format.setAlignment(Alignment.CENTRE)
        format.setVerticalAlignment(VerticalAlignment.CENTRE)
        format.setBorder(Border.ALL, BorderLineStyle.HAIR, Colour.BLACK)
        format
    }

    WritableCellFormat createRightAlignedCellFormat() {
        WritableFont font = new WritableFont(WritableFont.TAHOMA, WritableFont.DEFAULT_POINT_SIZE, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE, Colour.BLACK)

        WritableCellFormat format = new WritableCellFormat(font)
        format.setWrap(false)
        format.setAlignment(Alignment.RIGHT)
        format.setVerticalAlignment(VerticalAlignment.CENTRE)
        format.setBorder(Border.ALL, BorderLineStyle.HAIR, Colour.BLACK)
        format
    }

    String getStatusCode(String status) {
        switch (status) {
            case 'exists':
                return 1
            case 'not-exists':
                return 2
            case 'inquiry-required':
                return 3
            case 'coming-soon':
                return 4
        }
    }

    def calculatePrice(ProductModel productModel) {
        def price = Price.findByProductModelAndStartDateLessThanEqualsAndEndDateIsNull(productModel, new Date())
        if (!price)
            return [value: "-", currency: "-"]
        NumberFormat format = NumberFormat.getNumberInstance()
        format.maximumFractionDigits = 2
        return [value: format.format(price?.price)?.toString(), currency: price?.currency?.name ?: 'ریال']
    }

    def importPriceList(InputStream inputFileStream) {

        def result = [:]

        def priceList = new ArrayList<Map>()
        result.priceList = priceList

        try {
            //read workbook
            Workbook book = Workbook.getWorkbook(inputFileStream)
            Sheet sheet = book.getSheet(0)
            result.itemsCount = sheet.rows
            for (def i = 1; i < sheet.rows; i++) {
                def item = [:]
                try {
                    item.currency = sheet.getCell(0, i).contents
                    item.guarantee = sheet.getCell(3, i).contents
                    item.model = sheet.getCell(4, i).contents
                    item.color = sheet.getCell(5, i).contents
                    item.brand = sheet.getCell(6, i).contents
                    item.type = sheet.getCell(7, i).contents
                    item.productType = sheet.getCell(8, i).contents
                    item.id = sheet.getCell(9, i).contents as Long
                    item.price = (sheet.getCell(1, i).contents ?: '0').replace(',', '').replace('-', '0') as Double
                    item.status = getStatus(sheet.getCell(2, i).contents)
                    item.statusChanged = false
                    item.priceChanged = false
                    item.hasError = false
                    item.errorList = []
                }
                catch (ignored) {
                    item.hasError = true
                    item.errorList = ['itemStructureError']
                }
                result.priceList.add(item)
            }
        } catch (ignore) {
            result.status = "fileStructureError"
        }

        //apply changes
        priceList.findAll { !it.hasError }.each { item ->
            def model = ProductModel.get(item.id)
            item.name = model.toString()

            //update status
            if (model.status != item.status) {
                item.statusChanged = true
                item.oldStatus = model.status
                model.status = item.status
                if (!model.save(flush: true)) {
                    item.hasError = true
                    item.errorList.add('statusSave')
                }
            }

            //update price
            def lastPrice = Price.findByProductModelAndEndDateIsNull(model)
            def price = (lastPrice?.price ?: 0) as Double
            if (price != item.price) {
                item.priceChanged = true
                item.oldPrice = price
                def priceInstance = new Price()
                priceInstance.productModel = model
                priceInstance.price = item.price
                priceInstance.startDate = new Date()

                if (lastPrice) {
                    lastPrice.endDate = new Date()
                    lastPrice.save(flush: true)
                }

                priceInstance.rialPrice = priceInstance.currency ? priceInstance.price * priceInstance.currency.exchangeRate : priceInstance.price
                if (!priceInstance.validate() || !priceInstance.save(flush: true)) {
                    item.hasError = true
                    item.errorList.add('priceSave')
                }
            }

            //enqueue product for synchronization
            if (item.statusChanged || item.priceChanged) {
                model.product.isSynchronized = false
                model.product.save(flush: true)
            }
        }

        if (!result.status)
            result.status = "success"

        result
    }

    String getStatus(String code) {
        switch (code) {
            case '1':
                return 'exists'
            case '2':
                return 'not-exists'
            case '3':
                return 'inquiry-required'
            case '4':
                return 'coming-soon'
        }
    }

}
