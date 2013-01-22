package eshop

import org.springframework.context.ApplicationContext
import org.codehaus.groovy.grails.web.context.ServletContextHolder

/**
 * Created with IntelliJ IDEA.
 * User: roohi
 * Date: 9/18/12
 * Time: 9:54 PM
 * To change this template use File | Settings | File Templates.
 */
class FileService {
    def baseLoc = "${System.getProperty("base.dir")}/uploads/"
    //ServletContextHolder.servletContext.getRealPath("../../uploads/Image")
    def getFileContent(String path) {
        def p = "${baseLoc}${path}"
        def file = new File(p)
        if (file.exists()) {
            def fis = new FileInputStream(file)
            def res = new byte[fis.available()]
            fis.read(res)
            return res
        }
        return new byte[0]
    }

    def getFileContent(String name, String type, String parent) {
        def path = baseLoc + "Image" + "/" + parent + "/" + type + "/" + name
        def file = new File(path)
        if (file.exists()) {
            def fis = new FileInputStream(file)
            def res = new byte[fis.available()]
            fis.read(res)
            return res
        }
        return new byte[0]
    }

    def saveFile(byte[] content, String name, String type, String parent) {
        def basePath = baseLoc + "Image" + "/" + parent + "/" + type
        def base = new File(basePath)
        if (!base.exists() && !base.mkdirs()) {
            return false
        }
        def fileos = new FileOutputStream(basePath + "/" + name)
        fileos.write(content)
        fileos.flush()
        fileos.close()
    }
}
