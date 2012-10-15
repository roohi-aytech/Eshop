package eshop

import java.awt.image.BufferedImage
import javax.imageio.ImageIO
import java.awt.Image

class ImageService {
    def fileService
    def size = [
            [width: 400, height: 400],
            [width: 300, height: 300],
            [width: 200, height: 200],
            [width: 100, height: 100],
            [width: 50, height: 50]
    ]

    def getImage(Content img, String wh, String parent) {
        if (wh?.toBoolean()) {
            return fileService.getFileContent(img.name, "images", parent)
        }
        else if (wh)
            return fileService.getFileContent(img.name + "-" + wh, "images", parent)
        else
            return new byte[0]

    }

    def saveAndScaleImages(byte[] content, String name, String parent) {

        fileService.saveFile(content, name, "images", parent)
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
                    thumbnail.getHeight(null), BufferedImage.TYPE_INT_RGB);
            bufferedThumbnail.getGraphics().drawImage(thumbnail, 0, 0, null);
            def tfname = name + "-" + fname
            def baos = new ByteArrayOutputStream()
            ImageIO.write(bufferedThumbnail, 'png', baos)
            thumb = baos.toByteArray()
            fileService.saveFile(thumb, tfname, "images", parent)
        }
        return thumb
    }
}
