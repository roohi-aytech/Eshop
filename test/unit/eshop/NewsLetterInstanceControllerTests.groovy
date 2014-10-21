package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(NewsLetterInstanceController)
@Mock(NewsLetterInstance)
class NewsLetterInstanceControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/newsLetterInstance/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.newsLetterInstanceInstanceList.size() == 0
        assert model.newsLetterInstanceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.newsLetterInstanceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.newsLetterInstanceInstance != null
        assert view == '/newsLetterInstance/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/newsLetterInstance/show/1'
        assert controller.flash.message != null
        assert NewsLetterInstance.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterInstance/list'


        populateValidParams(params)
        def newsLetterInstance = new NewsLetterInstance(params)

        assert newsLetterInstance.save() != null

        params.id = newsLetterInstance.id

        def model = controller.show()

        assert model.newsLetterInstanceInstance == newsLetterInstance
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterInstance/list'


        populateValidParams(params)
        def newsLetterInstance = new NewsLetterInstance(params)

        assert newsLetterInstance.save() != null

        params.id = newsLetterInstance.id

        def model = controller.edit()

        assert model.newsLetterInstanceInstance == newsLetterInstance
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterInstance/list'

        response.reset()


        populateValidParams(params)
        def newsLetterInstance = new NewsLetterInstance(params)

        assert newsLetterInstance.save() != null

        // test invalid parameters in update
        params.id = newsLetterInstance.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/newsLetterInstance/edit"
        assert model.newsLetterInstanceInstance != null

        newsLetterInstance.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/newsLetterInstance/show/$newsLetterInstance.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        newsLetterInstance.clearErrors()

        populateValidParams(params)
        params.id = newsLetterInstance.id
        params.version = -1
        controller.update()

        assert view == "/newsLetterInstance/edit"
        assert model.newsLetterInstanceInstance != null
        assert model.newsLetterInstanceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterInstance/list'

        response.reset()

        populateValidParams(params)
        def newsLetterInstance = new NewsLetterInstance(params)

        assert newsLetterInstance.save() != null
        assert NewsLetterInstance.count() == 1

        params.id = newsLetterInstance.id

        controller.delete()

        assert NewsLetterInstance.count() == 0
        assert NewsLetterInstance.get(newsLetterInstance.id) == null
        assert response.redirectedUrl == '/newsLetterInstance/list'
    }
}
