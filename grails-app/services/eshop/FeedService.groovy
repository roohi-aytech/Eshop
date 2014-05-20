package eshop

import grails.plugin.cache.Cacheable
import grails.util.Environment

/**
 * Created with IntelliJ IDEA.
 * User: Farzin
 * Date: 1/19/14
 * Time: 11:44 PM
 * To change this template use File | Settings | File Templates.
 */
class FeedService {

    //yek dafe dige cache mano pak koni ,,, midam vakil zade sob ta shab bahat harf bezane ,,, ye hafteye kaamel
//    @Cacheable(value='feednews')
    def readNews() {
        def list = []
        if(Environment.current == Environment.DEVELOPMENT)
            return list
        try {
            def rssObj = new XmlSlurper().parse('http://www.blog.zanbil.ir/zanbil-and-festival-news/feed')
            rssObj.channel.item.each {
                def imgUrl=it.'encoded'?.toString()?.split('"')?.findAll { it =~ /http:.*.jpg/ || it =~ /http:.*.gif/ || it =~ /http:.*.jpeg/ || it =~ /http:.*.png/ }?.find()
                def indx=imgUrl?.lastIndexOf('.')
                if(indx && indx>0)
                    imgUrl=imgUrl.substring(0,indx)+'-60x40'+imgUrl.substring(indx)
                def post = [
                        title: it.title.toString(),
                        link: it.link.toString(),
                        body: it.description.toString().split('</p>').find().replace('<p>', ''),
                        imgUrl: imgUrl
                ]

                list << post
            }
        } catch (ex) {}
        list
    }
//    @Cacheable(value='feedposts',key='#id.toString()')
    def readPosts(def id) {
        def list = []
        if(Environment.current == Environment.DEVELOPMENT)
            return list
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
                def imgUrl=it.'encoded'?.toString()?.split('"')?.findAll { it =~ /http:.*.jpg/ || it =~ /http:.*.gif/ || it =~ /http:.*.jpeg/ || it =~ /http:.*.png/ }?.find()
                def indx=imgUrl?.lastIndexOf('.')
                if(indx && indx>0)
                    imgUrl=imgUrl.substring(0,indx)+'-60x40'+imgUrl.substring(indx)
                def itm= [
                        title: it.title.toString(),
                        link: it.link.toString(),
                        body: it.description.toString().split('</p>').find().replace('<p>', ''),
                        imgUrl: imgUrl
                ]
                list<<itm
            }
        } catch (ex) {}
        list
    }
//    @Cacheable(value='feedatricles',key='#id.toString()')
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
