package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(JournalArticleController)
@Mock(JournalArticle)
class JournalArticleControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/journalArticle/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.journalArticleInstanceList.size() == 0
        assert model.journalArticleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.journalArticleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.journalArticleInstance != null
        assert view == '/journalArticle/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/journalArticle/show/1'
        assert controller.flash.message != null
        assert JournalArticle.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/journalArticle/list'


        populateValidParams(params)
        def journalArticle = new JournalArticle(params)

        assert journalArticle.save() != null

        params.id = journalArticle.id

        def model = controller.show()

        assert model.journalArticleInstance == journalArticle
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/journalArticle/list'


        populateValidParams(params)
        def journalArticle = new JournalArticle(params)

        assert journalArticle.save() != null

        params.id = journalArticle.id

        def model = controller.edit()

        assert model.journalArticleInstance == journalArticle
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/journalArticle/list'

        response.reset()


        populateValidParams(params)
        def journalArticle = new JournalArticle(params)

        assert journalArticle.save() != null

        // test invalid parameters in update
        params.id = journalArticle.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/journalArticle/edit"
        assert model.journalArticleInstance != null

        journalArticle.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/journalArticle/show/$journalArticle.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        journalArticle.clearErrors()

        populateValidParams(params)
        params.id = journalArticle.id
        params.version = -1
        controller.update()

        assert view == "/journalArticle/edit"
        assert model.journalArticleInstance != null
        assert model.journalArticleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/journalArticle/list'

        response.reset()

        populateValidParams(params)
        def journalArticle = new JournalArticle(params)

        assert journalArticle.save() != null
        assert JournalArticle.count() == 1

        params.id = journalArticle.id

        controller.delete()

        assert JournalArticle.count() == 0
        assert JournalArticle.get(journalArticle.id) == null
        assert response.redirectedUrl == '/journalArticle/list'
    }
}
