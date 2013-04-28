package eshop

/**
 * Created with IntelliJ IDEA.
 * User: roohi
 * Date: 9/5/12
 * Time: 10:40 PM
 * To change this template use File | Settings | File Templates.
 */
class BaseProduct {
    static hasMany = [variations: Variation, articles: JournalArticle, guarantees: Guarantee]
    static constraints = {
    }
}
