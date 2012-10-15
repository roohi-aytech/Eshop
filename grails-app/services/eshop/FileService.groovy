package eshop

/**
 * Created with IntelliJ IDEA.
 * User: roohi
 * Date: 9/18/12
 * Time: 9:54 PM
 * To change this template use File | Settings | File Templates.
 */
class FileService {
    def baseLoc = System.getProperty("catalina.base") + "/../content"

    def getFileContent(String name,String type,String parent){
        def path = baseLoc + "/" + parent + "/" + type+"/"+name
        def file=new File(path)
        if(file.exists()){
            def fis = new FileInputStream(file)
            def res=new byte[fis.available()]
            fis.read(res)
            return res
        }
        return new byte[0]
    }
    def saveFile(byte[] content, String name, String type, String parent) {
        def basePath = baseLoc + "/" + parent + "/" + type
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
