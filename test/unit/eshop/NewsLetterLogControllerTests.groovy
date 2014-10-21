package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(NewsLetterLogController)
@Mock(NewsLetterLog)
class NewsLetterLogControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/newsLetterLog/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.newsLetterLogInstanceList.size() == 0
        assert model.newsLetterLogInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.newsLetterLogInstance != null
    }

    void testSave() {
        controller.save()

        assert model.newsLetterLogInstance != null
        assert view == '/newsLetterLog/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/newsLetterLog/show/1'
        assert controller.flash.message != null
        assert NewsLetterLog.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterLog/list'


        populateValidParams(params)
        def newsLetterLog = new NewsLetterLog(params)

        assert newsLetterLog.save() != null

        params.id = newsLetterLog.id

        def model = controller.show()

        assert model.newsLetterLogInstance == newsLetterLog
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterLog/list'


        populateValidParams(params)
        def newsLetterLog = new NewsLetterLog(params)

        assert newsLetterLog.save() != null

        params.id = newsLetterLog.id

        def model = controller.edit()

        assert model.newsLetterLogInstance == newsLetterLog
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterLog/list'

        response.reset()


        populateValidParams(params)
        def newsLetterLog = new NewsLetterLog(params)

        assert newsLetterLog.save() != null

        // test invalid parameters in update
        params.id = newsLetterLog.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/newsLetterLog/edit"
        assert model.newsLetterLogInstance != null

        newsLetterLog.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/newsLetterLog/show/$newsLetterLog.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        newsLetterLog.clearErrors()

        populateValidParams(params)
        params.id = newsLetterLog.id
        params.version = -1
        controller.update()

        assert view == "/newsLetterLog/edit"
        assert model.newsLetterLogInstance != null
        assert model.newsLetterLogInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterLog/list'

        response.reset()

        populateValidParams(params)
        def newsLetterLog = new NewsLetterLog(params)

        assert newsLetterLog.save() != null
        assert NewsLetterLog.count() == 1

        params.id = newsLetterLog.id

        controller.delete()

        assert NewsLetterLog.count() == 0
        assert NewsLetterLog.get(newsLetterLog.id) == null
        assert response.redirectedUrl == '/newsLetterLog/list'
    }
}
