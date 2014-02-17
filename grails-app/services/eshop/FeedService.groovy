package eshop

/**
 * Created with IntelliJ IDEA.
 * User: Farzin
 * Date: 1/19/14
 * Time: 11:44 PM
 * To change this template use File | Settings | File Templates.
 */
class FeedService {

    def readNews() {
        def list = []
        try {
            def rssObj = new XmlSlurper().parse('http://www.blog.zanbil.ir/zanbil-news/feed/')
            rssObj.channel.item.each {
                def post = [
                        title: it.title.toString(),
                        link: it.link.toString(),
                        body: it.description.toString().split('</p>').find().replace('<p>', ''),
                        imgUrl: it.'encoded'?.toString()?.split('"')?.findAll { it =~ /http:.*.jpg/ || it =~ /http:.*.gif/ || it =~ /http:.*.jpeg/ || it =~ /http:.*.png/ }?.find()
                ]
                list << post
            }
        } catch (ex) {}
        list
    }

    def readPosts(def id) {
        def list = []
        try {
            def productType = ProductType.get(id)
            def name = ""
            if(productType){
                def pt = productType
                name = pt.seoFriendlyName + "/"
                while(pt.parentProduct){
                    pt = pt.parentProduct
                    name = pt.seoFriendlyName + "/" + name
                }
            }
            def rssObj = new XmlSlurper().parse("http://www.blog.zanbil.ir/${name}feed/")
            rssObj.channel.item.findAll { !it.category.toString().contains('اخبار') }.each {
                list << [
                        title: it.title.toString(),
                        link: it.link.toString(),
                        body: it.description.toString().split('</p>').find().replace('<p>', ''),
                        imgUrl: it.'encoded'?.toString()?.split('"')?.findAll { it =~ /http:.*.jpg/ || it =~ /http:.*.gif/ || it =~ /http:.*.jpeg/ || it =~ /http:.*.png/ }?.find()
                ]
            }
        } catch (ex) {}
        list
    }

    def readArticles(def id) {
        def list = []
        try {
            JournalArticle.createCriteria().list {
                if (id)
                    'in'('baseProduct.id', ProductType.get(id).allChildren.collect { it.id } + [id])
                order('id', ORDER_DESCENDING)
                maxResults(5)
            }.each {
                list << [
                        id: it.id,
                        title: it.title
                ]
            }

        } catch (ex) {}
        list
    }
}
