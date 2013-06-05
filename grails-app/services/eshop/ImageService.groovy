package eshop

import com.sun.xml.internal.messaging.saaj.util.ByteInputStream

import java.awt.image.BufferedImage
import javax.imageio.ImageIO
import java.awt.Image

class ImageService {
    def fileService
    def burningImageService
    def grailsApplication
    def size = [
            [width: 500, height: 500],
            [width: 400, height: 400],
            [width: 300, height: 300],
            [width: 200, height: 200],
            [width: 150, height: 150],
            [width: 100, height: 100],
            [width: 50, height: 50]
    ]

    def getImage(Content img, String wh, String parent, def watermark) {
        byte[] bytes
        def path = "${grailsApplication.config.ckeditor.upload.basedir}image/" + parent + "/"

        if (wh?.toBoolean()) {
            bytes = fileService.getFileContent(img.name, "image", parent) as byte[]
        } else if (wh) {

            def fileName = (wh == 'max' ? '' : wh + '-') + img.name;
            def emptyImagePath = watermark.toString().replace('watermark.png', 'empty.jpg')

            def file = new File(path + "wm/" + fileName)
            if (!file.exists()) {

                def base = new File(path + "wm/")
                if (!base.exists() && !base.mkdirs())
                    return new byte[0]

                bytes = fileService.getFileContent(fileName, "image", parent) as byte[]
                def image = ImageIO.read(new ByteInputStream(bytes, bytes.length))
                if(!image)
                    return new byte[0]
                def size = image.width > image.height ? image.width : image.height

                //create empty image
                def uuid = UUID.randomUUID().toString()
                new AntBuilder().copy(file: emptyImagePath, tofile: path + "wm/" + uuid + ".jpg")
                new File(path + "wm/" + uuid + ".jpg").renameTo(path + "wm/" + fileName)
                burningImageService.doWith(path + "wm/" + fileName, path + "wm/")
                        .execute {
                    it.scaleAccurate(size, size)
                }

                //center image in empty image
                burningImageService.doWith(path + "wm/" + fileName, path + "wm/")
                        .execute {
                    it.watermark(path + fileName)
                }

                //do watermark if required
                if (wh == 'max')
                    burningImageService.doWith(path + "wm/" + fileName, path + "wm/")
                            .execute {
                        it.watermark(watermark.toString(), ['bottom': 10])
                    }
            }
            bytes = fileService.getFileContent('wm/' + fileName, "image", parent) as byte[]
        } else
            return new byte[0]

        return bytes
    }

    def getImage(Content img, String wh, String parent) {
        if (wh?.toBoolean()) {
            return fileService.getFileContent(img.name, "image", parent)
        } else if (wh) {
            return fileService.getFileContent(wh + "-" + img.name, "image", parent)
        } else
            return new byte[0]

    }

    def getImage(String wh, String parent) {
        if (wh?.toBoolean()) {
            return fileService.getFileContent("image", "image", parent)
        } else if (wh)
            return fileService.getFileContent(wh + "-image", "image", parent)
        else
            return new byte[0]

    }



    def saveAndScaleImages(byte[] content, String name, String parent) {

        fileService.saveFile(content, name, "image", parent)
        BufferedImage sourceImage = ImageIO.read(new ByteArrayInputStream(content))
        def w = sourceImage.width
        def h = sourceImage.height

        def thumb
        size.each {
            def fname = it.width + "x" + it.height
            def thumbnail
            if (w > h)
                thumbnail = sourceImage.getScaledInstance(it.width, -1, Image.SCALE_SMOOTH);
            else
                thumbnail = sourceImage.getScaledInstance(-1, it.height, Image.SCALE_SMOOTH);

            BufferedImage bufferedThumbnail = new BufferedImage(thumbnail.getWidth(null),
                    thumbnail.getHeight(null), sourceImage.type);
            bufferedThumbnail.getGraphics().drawImage(thumbnail, 0, 0, null);
            bufferedThumbnail.getGraphics().dispose()
            def tfname = fname + "-" + name
            def baos = new ByteArrayOutputStream()
            ImageIO.write(bufferedThumbnail, 'png', baos)
            thumb = baos.toByteArray()
            fileService.saveFile(thumb, tfname, "image", parent)
        }
        return thumb
    }
}
