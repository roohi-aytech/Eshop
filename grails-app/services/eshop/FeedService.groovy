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
        list
    }

    def readPosts(def id) {
        def list = []
        try {
            def productType = ProductType.get(id)
            def rssObj = new XmlSlurper().parse("http://www.blog.zanbil.ir/${id ? productType.seoFriendlyName + "/" : ''}feed/")
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
