package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(NewsLetterController)
@Mock(NewsLetter)
class NewsLetterControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/newsLetter/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.newsLetterInstanceList.size() == 0
        assert model.newsLetterInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.newsLetterInstance != null
    }

    void testSave() {
        controller.save()

        assert model.newsLetterInstance != null
        assert view == '/newsLetter/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/newsLetter/show/1'
        assert controller.flash.message != null
        assert NewsLetter.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetter/list'


        populateValidParams(params)
        def newsLetter = new NewsLetter(params)

        assert newsLetter.save() != null

        params.id = newsLetter.id

        def model = controller.show()

        assert model.newsLetterInstance == newsLetter
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetter/list'


        populateValidParams(params)
        def newsLetter = new NewsLetter(params)

        assert newsLetter.save() != null

        params.id = newsLetter.id

        def model = controller.edit()

        assert model.newsLetterInstance == newsLetter
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetter/list'

        response.reset()


        populateValidParams(params)
        def newsLetter = new NewsLetter(params)

        assert newsLetter.save() != null

        // test invalid parameters in update
        params.id = newsLetter.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/newsLetter/edit"
        assert model.newsLetterInstance != null

        newsLetter.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/newsLetter/show/$newsLetter.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        newsLetter.clearErrors()

        populateValidParams(params)
        params.id = newsLetter.id
        params.version = -1
        controller.update()

        assert view == "/newsLetter/edit"
        assert model.newsLetterInstance != null
        assert model.newsLetterInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/newsLetter/list'

        response.reset()

        populateValidParams(params)
        def newsLetter = new NewsLetter(params)

        assert newsLetter.save() != null
        assert NewsLetter.count() == 1

        params.id = newsLetter.id

        controller.delete()

        assert NewsLetter.count() == 0
        assert NewsLetter.get(newsLetter.id) == null
        assert response.redirectedUrl == '/newsLetter/list'
    }
}
