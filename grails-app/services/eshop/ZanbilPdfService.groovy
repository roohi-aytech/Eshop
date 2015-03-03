package eshop

import com.itextpdf.text.BaseColor
import com.itextpdf.text.Document
import com.itextpdf.text.Element
import com.itextpdf.text.Font
import com.itextpdf.text.FontFactory
import com.itextpdf.text.Image
import com.itextpdf.text.PageSize
import com.itextpdf.text.Paragraph
import com.itextpdf.text.pdf.BaseFont
import com.itextpdf.text.pdf.ColumnText
import com.itextpdf.text.pdf.PdfContentByte
import com.itextpdf.text.pdf.PdfPCell
import com.itextpdf.text.pdf.PdfPTable
import com.itextpdf.text.pdf.PdfReader
import com.itextpdf.text.pdf.PdfWriter
import eshop.accounting.PaymentRequest

import java.awt.Color

class ZanbilPdfService {

    def grailsApplication
    def rg

    def generateInvoice(Order order, OutputStream outputStream, Boolean useBackground) {
        if (order.invoiceType == 'with_added_value')
            generateInvoiceWithAddedValue(order, outputStream, useBackground)
        else
            generateInvoiceWithoutAddedValue(order, outputStream, useBackground)
    }

    def generateInvoiceWithAddedValue(Order order, OutputStream outputStream, Boolean useBackground) {
        def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
        def rg = grailsApplication.mainContext.getBean('rapidgrails.JqueryUiTagLib')
        def e = grailsApplication.mainContext.getBean('eshop.PriceTagLib');

        def document = new Document()
        document.setPageSize(PageSize.A4);
        document.setMargins(0, 0, 0, 0);
        def writer = PdfWriter.getInstance(document, outputStream)
        document.open()

        //background
        if (useBackground) {
            Image img = Image.getInstance(grailsApplication.mainContext.getResource('/images/zanbil/A4-Invoice.jpg').getFile().path);
            img.setAlignment(Image.MIDDLE | Image.UNDERLYING);
            img.setBorder(Image.BOX);
            img.setBorderWidth(0);
            img.setBorderColor(BaseColor.WHITE);
            img.scaleToFitHeight = true
            img.scaleAbsoluteWidth(600)
            img.scaleAbsoluteHeight(850)
            document.add(img);
        }

        def fontPersian = BaseFont.createFont(grailsApplication.mainContext.getResource('/font/b yekan.ttf').getFile().path, BaseFont.IDENTITY_H, BaseFont.EMBEDDED)
        def fontComplex = BaseFont.createFont(grailsApplication.mainContext.getResource('/font/tahoma.ttf').getFile().path, BaseFont.IDENTITY_H, BaseFont.EMBEDDED)
        Font fontPersianGrey = new Font(fontPersian, 9, Font.NORMAL, BaseColor.GRAY);
        Font fontPersianBlack = new Font(fontPersian, 9, Font.NORMAL, BaseColor.BLACK);
        Font fontPersianBlackBold = new Font(fontPersian, 9, Font.BOLD, BaseColor.BLACK);
        Font fontPersianHeader = new Font(fontPersian, 16, Font.NORMAL, BaseColor.BLACK);
        Font fontComplexBlack = new Font(fontComplex, 8, Font.NORMAL, BaseColor.BLACK);

        //date
        addText(
                520f, 715f, 20f, 20f,
                g.message(code: 'invoice.date') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                458f, 715f, 60f, 20f,
                rg.formatJalaliDate(date: OrderTrackingLog.findByOrderAndAction(order, OrderHelper.ACTION_INQUIRY).date),
                fontPersianBlack,
                writer.directContent)

        //serial number
        addText(
                493f, 697f, 47f, 20f,
                g.message(code: 'invoice.serialNumber') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                391f, 697f, 100f, 20f,
                order.serialNumber,
                fontPersianBlack,
                writer.directContent)

        //title
        addText(
                400f, 645f, 140f, 35f,
                order.status == OrderHelper.STATUS_PAYMENT_APPROVED || order.status == OrderHelper.STATUS_TRANSMITTED || order.status == OrderHelper.STATUS_DELIVERED ? g.message(code: 'order.finalInvoice.title') : g.message(code: 'order.preInvoice.title'),
                fontPersianHeader,
                writer.directContent)

        //tracking code
        addText(
                474f, 626f, 66f, 20f,
                g.message(code: 'invoice.trackingCode') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                412f, 626f, 60f, 20f,
                order.trackingCode,
                fontPersianBlackBold,
                writer.directContent)

        //seller info
        writer.directContent.saveState();
        writer.directContent.setColorFill(BaseColor.WHITE);
        writer.directContent.roundRectangle(40, 570, 499, 25, 5);
        writer.directContent.fillStroke();
        writer.directContent.restoreState();

        addText(
                497f, 574f, 34f, 20f,
                g.message(code: 'invoice.seller.label') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                232f, 574f, 263f, 20f,
                g.message(code: 'invoice.seller.value'),
                fontPersianBlack,
                writer.directContent)

        addText(
                175f, 574f, 45f, 20f,
                g.message(code: 'invoice.seller.code.label') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                50f, 574f, 123f, 20f,
                g.message(code: 'invoice.seller.code.value'),
                fontPersianBlack,
                writer.directContent)

        //customer info
        writer.directContent.saveState();
        writer.directContent.setColorFill(BaseColor.WHITE);
        writer.directContent.roundRectangle(40, 500, 499, 65, 5);
        writer.directContent.fillStroke();
        writer.directContent.restoreState();

        //owner name
        addText(
                504f, 544f, 27f, 20f,
                g.message(code: 'invoice.owner.name') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                232f, 544f, 270f, 20f,
                order.useAlternateInformation ? order.alternateOwnerName : (order.customer ? '' : g.message(code: "customer.title." + order.ownerSex) + " ") + order.ownerName,
                fontPersianBlack,
                writer.directContent)

        //owner code
        addText(
                145f, 544f, 75f, 20f,
                g.message(code: 'invoice.ownerCode') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                50f, 544f, 93f, 20f,
                order.ownerCode,
                fontPersianBlack,
                writer.directContent)

        //owner address
        addText(
                479f, 524f, 52f, 20f,
                g.message(code: 'invoice.sendingAddress') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                50f, 524f, 427f, 20f,
                g.message(code: "province") + " " + order.sendingAddress.city.province.title + " - " +
                        g.message(code: "city") + " " + order.sendingAddress.city.title + " - " +
                        order.sendingAddress.addressLine1 + " " + (order.sendingAddress.addressLine2 ? order.sendingAddress.addressLine2 : ""),
                fontPersianBlack,
                writer.directContent)

        //postal code
        addText(
                497f, 504f, 34f, 20f,
                g.message(code: 'invoice.postalCode') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                372f, 504f, 123f, 20f,
                order.sendingAddress.postalCode,
                fontPersianBlack,
                writer.directContent)

        //telephone
        addText(
                340f, 504f, 20f, 20f,
                g.message(code: 'invoice.owner.telephone') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                232f, 504f, 106f, 20f,
                order.ownerTelephone,
                fontPersianBlack,
                writer.directContent)

        //mobile
        addText(
                180f, 504f, 40f, 20f,
                g.message(code: 'invoice.owner.mobile') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                50f, 504f, 128f, 20f,
                order.ownerMobile,
                fontPersianBlack,
                writer.directContent)

        def table = new PdfPTable(8)
        table.setTotalWidth(500)
        table.setWidths([4, 4, 1.5, 3, 3.5, 12, 2, 1.5] as float[])

        def highLightColor = new BaseColor(196, 185, 154)

        //header
        table.addCell(createCell("${g.message(code: 'invoice.item.totalPrice')} (${e.currencyLabel()})", fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.item.tax'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.item.count'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.item.discount'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.item.price'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.item.name'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.productCode'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.rowNumber'), fontPersianBlack, highLightColor, 1, 1))

        //items
        OrderItem.findAllByOrderAndDeleted(order, false).sort { it.id }.eachWithIndex { orderItem, i ->

            def description = orderItem.productModel.toString()
            orderItem.addedValues.each { description += " + " + it }

            table.addCell(createCell(g.formatNumber(number: orderItem.totalPrice, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(g.formatNumber(number: orderItem.tax, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(g.formatNumber(number: orderItem.orderCount, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(g.formatNumber(number: orderItem.discount, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(g.formatNumber(number: orderItem.unitPrice, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(description, fontComplexBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(g.formatNumber(number: orderItem.productModel.product.id, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(i + 1, fontPersianBlack, BaseColor.WHITE, 1, 1))
        }

        //total rows
        table.addCell(createCell(g.formatNumber(number: order.items.sum { it.totalPrice }, type: 'number'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.formatNumber(number: order.items.sum { it.tax }, type: 'number'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.formatNumber(number: order.items.sum { it.orderCount }, type: 'number'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: "invoice.item.totalSum"), fontPersianBlack, highLightColor, 5, 1))

        def paymentRequest = PaymentRequest.findAllByOrder(order)?.sort { -it.id }?.toArray()?.find() as PaymentRequest
        def paymentType = g.message(
                code: "order.paymentType.${order.paymentType}",
                args: [rg.formatJalaliDate(date: paymentRequest?.creationDate ?: new Date()), paymentRequest?.account?.accountNumber, g.message(code: "order.payment.bank.${paymentRequest?.account?.bankName}.label"), paymentRequest?.trackingCode]).split('<br/>')

        table.addCell(createCell(g.formatNumber(number: order.deliveryPrice, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
        table.addCell(createCell(g.message(code: 'deliveryPrice'), fontPersianBlack, BaseColor.WHITE, 2, 1))
        def cell = paymentType.size() > 1 ?
            createCell(g.message(code: "invoice.paymentType") + ": " + paymentType[0], fontPersianBlack, BaseColor.WHITE, 5, 1) :
            new PdfPCell()
        cell.setBorderWidthBottom(0)
        cell.setColspan(5)
        table.addCell(cell)

        table.addCell(createCell(g.formatNumber(number: order.totalPrice, type: 'number'), fontPersianBlackBold, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'basket.totalRoundedPrice'), fontPersianBlackBold, highLightColor, 2, 1))
        if (order.status != OrderHelper.STATUS_PAYMENT_APPROVED && order.status != OrderHelper.STATUS_TRANSMITTED && order.status != OrderHelper.STATUS_DELIVERED)
            cell = createCell(g.message(code: "invoice.validityDate") + ": " +
                    rg.formatJalaliDate(date: order.paymentTimeout, hm: "true"), fontPersianBlack, BaseColor.WHITE, 5, 1)
        else
            cell = createCell((paymentType.size() > 1 ? paymentType[1] : g.message(code: "invoice.paymentType") + ": " + paymentType[0]), fontPersianBlack, BaseColor.WHITE, 5, 1)
        cell.setBorderWidthTop(0)
        cell.setBorderWidthBottom(0)
        table.addCell(cell)

        table.addCell(createCell(g.formatNumber(number: order.usedAccountValue, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.customerAccount'), fontPersianBlack, BaseColor.WHITE, 2, 1))
        cell = createCell(g.message(code: "invoice.deliveryType") + ": " +
                g.message(code: "invoice.deliveryType.label") + " " + order.deliverySourceStation.method.toString(), fontPersianBlack, BaseColor.WHITE, 5, 1)
        cell.setBorderWidthTop(0)
        cell.setBorderWidthBottom(0)
        table.addCell(cell)

        table.addCell(createCell(g.formatNumber(number: order.totalPayablePrice, type: 'number'), fontPersianBlackBold, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.remainingPayablePrice'), fontPersianBlackBold, highLightColor, 2, 1))
        cell = new PdfPCell()
        cell.setBorderWidthTop(0)
        cell.setColspan(5)
        table.addCell(cell)

        //descriptions
        table.addCell(createDescriptionCell(g.message(code: 'invoice.description'), fontPersianBlackBold, 8, Element.ALIGN_LEFT, 0, 0))
        table.addCell(createDescriptionCell("1. " + g.message(code: 'invoice.description.1'), fontPersianBlack, 8, Element.ALIGN_LEFT, 20, 0))
        table.addCell(createDescriptionCell("2. " + g.message(code: 'invoice.description.2'), fontPersianBlack, 8, Element.ALIGN_LEFT, 20, 0))
        table.addCell(createDescriptionCell(g.message(code: 'invoice.aggreegation', args: ['........................']), fontPersianBlack, 8, Element.ALIGN_LEFT, 0, 0))
        table.addCell(createDescriptionCell(g.message(code: 'invoice.aggreegation.sign'), fontPersianBlack, 8, Element.ALIGN_RIGHT, 0, 80))

        table.writeSelectedRows(0, -1, 0, -1, 40, 490, writer.directContent)

        document.close()
    }

    def generateInvoiceWithoutAddedValue(Order order, OutputStream outputStream, Boolean useBackground) {
        def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
        def rg = grailsApplication.mainContext.getBean('rapidgrails.JqueryUiTagLib')
        def e = grailsApplication.mainContext.getBean('eshop.PriceTagLib');

        def document = new Document()
        document.setPageSize(PageSize.A4);
        document.setMargins(0, 0, 0, 0);
        def writer = PdfWriter.getInstance(document, outputStream)
        document.open()

        //background
        if (useBackground) {
            Image img = Image.getInstance(grailsApplication.mainContext.getResource('/images/zanbil/A4-Invoice.jpg').getFile().path);
            img.setAlignment(Image.MIDDLE | Image.UNDERLYING);
            img.setBorder(Image.BOX);
            img.setBorderWidth(0);
            img.setBorderColor(BaseColor.WHITE);
            img.scaleToFitHeight = true
            img.scaleAbsoluteWidth(600)
            img.scaleAbsoluteHeight(850)
            document.add(img);
        }

        def fontPersian = BaseFont.createFont(grailsApplication.mainContext.getResource('/font/b yekan.ttf').getFile().path, BaseFont.IDENTITY_H, BaseFont.EMBEDDED)
        def fontComplex = BaseFont.createFont(grailsApplication.mainContext.getResource('/font/tahoma.ttf').getFile().path, BaseFont.IDENTITY_H, BaseFont.EMBEDDED)
        Font fontPersianGrey = new Font(fontPersian, 9, Font.NORMAL, BaseColor.GRAY);
        Font fontPersianBlack = new Font(fontPersian, 9, Font.NORMAL, BaseColor.BLACK);
        Font fontPersianBlackBold = new Font(fontPersian, 9, Font.BOLD, BaseColor.BLACK);
        Font fontPersianHeader = new Font(fontPersian, 16, Font.NORMAL, BaseColor.BLACK);
        Font fontComplexBlack = new Font(fontComplex, 8, Font.NORMAL, BaseColor.BLACK);

        //date
        addText(
                520f, 715f, 20f, 20f,
                g.message(code: 'invoice.date') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                458f, 715f, 60f, 20f,
                rg.formatJalaliDate(date: OrderTrackingLog.findByOrderAndAction(order, OrderHelper.ACTION_INQUIRY).date),
                fontPersianBlack,
                writer.directContent)

        //serial number
        addText(
                493f, 697f, 47f, 20f,
                g.message(code: 'invoice.serialNumber') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                391f, 697f, 100f, 20f,
                order.serialNumber,
                fontPersianBlack,
                writer.directContent)

        //title
        addText(
                400f, 645f, 140f, 35f,
                order.status == OrderHelper.STATUS_PAYMENT_APPROVED || order.status == OrderHelper.STATUS_TRANSMITTED || order.status == OrderHelper.STATUS_DELIVERED ? g.message(code: 'order.finalInvoice.title') : g.message(code: 'order.preInvoice.title'),
                fontPersianHeader,
                writer.directContent)

        //tracking code
        addText(
                474f, 626f, 66f, 20f,
                g.message(code: 'invoice.trackingCode') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                412f, 626f, 60f, 20f,
                order.trackingCode,
                fontPersianBlackBold,
                writer.directContent)

        //customer info
        writer.directContent.saveState();
        writer.directContent.setColorFill(BaseColor.WHITE);
        writer.directContent.roundRectangle(40, 530, 499, 65, 5);
        writer.directContent.fillStroke();
        writer.directContent.restoreState();

        //owner name
        addText(
                504f, 574f, 27f, 20f,
                g.message(code: 'invoice.owner.name') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                232f, 574f, 270f, 20f,
                order.useAlternateInformation ? order.alternateOwnerName : (order.customer ? '' : g.message(code: "customer.title." + order.ownerSex) + " ") + order.ownerName,
                fontPersianBlack,
                writer.directContent)

        //owner code
        addText(
                145f, 574f, 75f, 20f,
                g.message(code: 'invoice.ownerCodeWithoutAddedValue') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                100f, 574f, 93f, 20f,
                order.ownerCode,
                fontPersianBlack,
                writer.directContent)

        //owner address
        addText(
                479f, 554f, 52f, 20f,
                g.message(code: 'invoice.sendingAddress') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                50f, 554f, 427f, 20f,
                g.message(code: "province") + " " + order.sendingAddress.city.province.title + " - " +
                        g.message(code: "city") + " " + order.sendingAddress.city.title + " - " +
                        order.sendingAddress.addressLine1 + " " + (order.sendingAddress.addressLine2 ? order.sendingAddress.addressLine2 : ""),
                fontPersianBlack,
                writer.directContent)

        //postal code
        addText(
                497f, 534f, 34f, 20f,
                g.message(code: 'invoice.postalCode') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                372f, 534f, 123f, 20f,
                order.sendingAddress.postalCode,
                fontPersianBlack,
                writer.directContent)

        //telephone
        addText(
                340f, 534f, 20f, 20f,
                g.message(code: 'invoice.owner.telephone') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                232f, 534f, 106f, 20f,
                order.ownerTelephone,
                fontPersianBlack,
                writer.directContent)

        //mobile
        addText(
                180f, 534f, 40f, 20f,
                g.message(code: 'invoice.owner.mobile') + ":",
                fontPersianGrey,
                writer.directContent)
        addText(
                50f, 534f, 128f, 20f,
                order.ownerMobile,
                fontPersianBlack,
                writer.directContent)

        def table = new PdfPTable(7)
        table.setTotalWidth(500)
        table.setWidths([4, 1.5, 3, 3.5, 12, 2, 1.5] as float[])

        def highLightColor = new BaseColor(196, 185, 154)

        //header
        table.addCell(createCell("${g.message(code: 'invoice.item.totalPrice')} (${e.currencyLabel()})", fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.item.count'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.item.discount'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.item.price'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.item.name'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.productCode'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.rowNumber'), fontPersianBlack, highLightColor, 1, 1))

        //items
        OrderItem.findAllByOrderAndDeleted(order, false).sort { it.id }.eachWithIndex { orderItem, i ->

            def description = orderItem.productModel.toString()
            orderItem.addedValues.each { description += " + " + it }

            table.addCell(createCell(g.formatNumber(number: orderItem.totalPrice, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(g.formatNumber(number: orderItem.orderCount, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(g.formatNumber(number: orderItem.discount, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(g.formatNumber(number: orderItem.unitPrice, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(description, fontComplexBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(g.formatNumber(number: orderItem.productModel.product.id, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
            table.addCell(createCell(i + 1, fontPersianBlack, BaseColor.WHITE, 1, 1))
        }

        //total rows
        table.addCell(createCell(g.formatNumber(number: order.items.sum { it.totalPrice }, type: 'number'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.formatNumber(number: order.items.sum { it.orderCount }, type: 'number'), fontPersianBlack, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: "invoice.item.totalSum"), fontPersianBlack, highLightColor, 5, 1))

        def paymentRequest = PaymentRequest.findAllByOrder(order)?.sort { -it.id }?.toArray()?.find() as PaymentRequest
        def paymentType = g.message(
                code: "order.paymentType.${order.paymentType}",
                args: [rg.formatJalaliDate(date: paymentRequest?.creationDate ?: new Date()), paymentRequest?.account?.accountNumber, g.message(code: "order.payment.bank.${paymentRequest?.account?.bankName}.label"), paymentRequest?.trackingCode]).split('<br/>')

        table.addCell(createCell(g.formatNumber(number: order.deliveryPrice, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
        table.addCell(createCell(g.message(code: 'deliveryPrice'), fontPersianBlack, BaseColor.WHITE, 2, 1))
        def cell = paymentType.size() > 1 ?
            createCell(g.message(code: "invoice.paymentType") + ": " + paymentType[0], fontPersianBlack, BaseColor.WHITE, 4, 1) :
            new PdfPCell()
        cell.setBorderWidthBottom(0)
        cell.setColspan(4)
        table.addCell(cell)

        table.addCell(createCell(g.formatNumber(number: order.totalPrice, type: 'number'), fontPersianBlackBold, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'basket.totalRoundedPrice'), fontPersianBlackBold, highLightColor, 2, 1))
        if (order.status != OrderHelper.STATUS_PAYMENT_APPROVED && order.status != OrderHelper.STATUS_TRANSMITTED && order.status != OrderHelper.STATUS_DELIVERED)
            cell = createCell(g.message(code: "invoice.validityDate") + ": " +
                    rg.formatJalaliDate(date: order.paymentTimeout, hm: "true"), fontPersianBlack, BaseColor.WHITE, 4, 1)
        else
            cell = createCell((paymentType.size() > 1 ? paymentType[1] : g.message(code: "invoice.paymentType") + ": " + paymentType[0]), fontPersianBlack, BaseColor.WHITE, 4, 1)
        cell.setBorderWidthTop(0)
        cell.setBorderWidthBottom(0)
        table.addCell(cell)

        table.addCell(createCell(g.formatNumber(number: order.usedAccountValue, type: 'number'), fontPersianBlack, BaseColor.WHITE, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.customerAccount'), fontPersianBlack, BaseColor.WHITE, 2, 1))
        cell = createCell(g.message(code: "invoice.deliveryType") + ": " +
                g.message(code: "invoice.deliveryType.label") + " " + order.deliverySourceStation.method.toString(), fontPersianBlack, BaseColor.WHITE, 4, 1)
        cell.setBorderWidthTop(0)
        cell.setBorderWidthBottom(0)
        table.addCell(cell)

        table.addCell(createCell(g.formatNumber(number: order.totalPayablePrice, type: 'number'), fontPersianBlackBold, highLightColor, 1, 1))
        table.addCell(createCell(g.message(code: 'invoice.remainingPayablePrice'), fontPersianBlackBold, highLightColor, 2, 1))
        cell = new PdfPCell()
        cell.setBorderWidthTop(0)
        cell.setColspan(4)
        table.addCell(cell)

        //descriptions
        table.addCell(createDescriptionCell(g.message(code: 'invoice.description'), fontPersianBlackBold, 7, Element.ALIGN_LEFT, 0, 0))
        table.addCell(createDescriptionCell("1. " + g.message(code: 'invoice.description.1'), fontPersianBlack, 7, Element.ALIGN_LEFT, 20, 0))
        table.addCell(createDescriptionCell("2. " + g.message(code: 'invoice.description.2'), fontPersianBlack, 7, Element.ALIGN_LEFT, 20, 0))
        table.addCell(createDescriptionCell(g.message(code: 'invoice.aggreegation', args: ['........................']), fontPersianBlack, 7, Element.ALIGN_LEFT, 0, 0))
        table.addCell(createDescriptionCell(g.message(code: 'invoice.aggreegation.sign'), fontPersianBlack, 7, Element.ALIGN_RIGHT, 0, 80))

        table.writeSelectedRows(0, -1, 0, -1, 40, 520, writer.directContent)

        document.close()
    }

    PdfPCell createDescriptionCell(def text, def font, int colSpan, int align, float indentLeft, float indentRight) {
        def cell = new PdfPCell()
        def paragraph = new Paragraph(text.toString(), font as Font)
        paragraph.setIndentationLeft(indentLeft)
        paragraph.setIndentationRight(indentRight)
        paragraph.setAlignment(align)
        cell.addElement(paragraph)
        cell.setColspan(colSpan)
        cell.setBorderWidth(0)
        cell.setRunDirection(PdfWriter.RUN_DIRECTION_RTL)
        cell
    }

    PdfPCell createCell(def text, def font, def backgroundColor, int colSpan, int rowSpan) {
        def cell = new PdfPCell()
        cell.setRunDirection(PdfWriter.RUN_DIRECTION_RTL)
        cell.setHorizontalAlignment(Element.ALIGN_CENTER)
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE)
        cell.setBackgroundColor(backgroundColor as BaseColor)
        cell.setPaddingTop(0)
        cell.setPaddingBottom(8)
        cell.setColspan(colSpan)
        cell.setRowspan(rowSpan)
        def paragraph = new Paragraph(text.toString().replace('<br/>', '\n'), font as Font)
        paragraph.setAlignment(Element.ALIGN_CENTER)
        cell.addElement(paragraph)
        cell
    }

    def addText(float x, float y, float width, float height, def text, def font, def canvas) {

//        canvas.saveState();
//        canvas.setColorFill(BaseColor.LIGHT_GRAY);
//        canvas.rectangle(x, y, width, height);
//        canvas.fill();
//        canvas.restoreState();

        ColumnText column = new ColumnText(canvas as PdfContentByte);

        column.setSimpleColumn(x, y.toInteger(), x.toInteger() + width.toInteger(), y.toInteger() + height.toInteger());
        column.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
        def paragraph = new Paragraph(text.toString(), font as Font)
        paragraph.setAlignment(Element.ALIGN_LEFT)
        column.addElement(paragraph);
        column.go();
    }
}
