package eshop

import java.awt.image.BufferedImage
import javax.imageio.ImageIO
import java.awt.Image

class ImageService {
    def fileService
    def size = [
            [width: 500, height: 500],
            [width: 400, height: 400],
            [width: 300, height: 300],
            [width: 200, height: 200],
            [width: 150, height: 150],
            [width: 100, height: 100],
            [width: 50, height: 50]
    ]

    def getImage(Content img, String wh, String parent) {
        if (wh?.toBoolean()) {
            return fileService.getFileContent(img.name, "image", parent)
        }
        else if (wh)
            return fileService.getFileContent(wh+"-"+img.name , "image", parent)
        else
            return new byte[0]

    }

    def getImage(String wh, String parent) {
        if (wh?.toBoolean()) {
            return fileService.getFileContent("image", "image", parent)
        }
        else if (wh)
            return fileService.getFileContent(wh+"-image" , "image", parent)
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
