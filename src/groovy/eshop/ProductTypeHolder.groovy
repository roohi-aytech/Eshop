package eshop

/**
 * Created by roohi on 4/26/2015.
 */
class ProductTypeHolder {
    static ProductTypeHolder ins
    static Date last=new Date()
    static ProductTypeHolder getInstance(){
        if(!ins)
        {
            ins=new ProductTypeHolder()
            last=new Date()
        }
        else {
            def cal = Calendar.instance
            cal.add(Calendar.MINUTE, -10)
            def tenMinAgo = cal.time
            if (last.before(tenMinAgo)) {
                ins = new ProductTypeHolder()
                last = new Date()
            }
        }
        return ins
    }
    def ptm
    def findRootProductTypes(){
        try {
            if (!ptm) {
                ptm = []
                def pts = ProductType.findAllByDeleted(false)
                        .collectEntries {
                    [it.id, [id: it.id, name: it.name, urlName: it.urlName, description: it.description, parent: it.parentProduct?.id, godFathers: it.godFathers?.collect {
                        it.id
                    }, children: []]]
                }
                pts.each { pt ->
                    if (pt.value.parent)
                        pts[pt.value.parent].children << pt
                    else
                        ptm << pt
                    if (pt.value.godFathers) {
                        pt.value.godFathers.each {
                            pts[it].children << pt
                        }
                    }
                }
            }
            return ptm
        }catch (e){
            e.printStackTrace()
        }
        return null
    }
}
