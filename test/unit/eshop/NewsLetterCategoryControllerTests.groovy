package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(NewsLetterCategoryController)
@Mock(NewsLetterCategory)
class NewsLetterCategoryControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/newsLetterCategory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.newsLetterCategoryInstanceList.size() == 0
        assert model.newsLetterCategoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.newsLetterCategoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.newsLetterCategoryInstance != null
        assert view == '/newsLetterCategory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/newsLetterCategory/show/1'
        assert controller.flash.message != null
        assert NewsLetterCategory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterCategory/list'


        populateValidParams(params)
        def newsLetterCategory = new NewsLetterCategory(params)

        assert newsLetterCategory.save() != null

        params.id = newsLetterCategory.id

        def model = controller.show()

        assert model.newsLetterCategoryInstance == newsLetterCategory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterCategory/list'


        populateValidParams(params)
        def newsLetterCategory = new NewsLetterCategory(params)

        assert newsLetterCategory.save() != null

        params.id = newsLetterCategory.id

        def model = controller.edit()

        assert model.newsLetterCategoryInstance == newsLetterCategory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterCategory/list'

        response.reset()


        populateValidParams(params)
        def newsLetterCategory = new NewsLetterCategory(params)

        assert newsLetterCategory.save() != null

        // test invalid parameters in update
        params.id = newsLetterCategory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/newsLetterCategory/edit"
        assert model.newsLetterCategoryInstance != null

        newsLetterCategory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/newsLetterCategory/show/$newsLetterCategory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        newsLetterCategory.clearErrors()

        populateValidParams(params)
        params.id = newsLetterCategory.id
        params.version = -1
        controller.update()

        assert view == "/newsLetterCategory/edit"
        assert model.newsLetterCategoryInstance != null
        assert model.newsLetterCategoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/newsLetterCategory/list'

        response.reset()

        populateValidParams(params)
        def newsLetterCategory = new NewsLetterCategory(params)

        assert newsLetterCategory.save() != null
        assert NewsLetterCategory.count() == 1

        params.id = newsLetterCategory.id

        controller.delete()

        assert NewsLetterCategory.count() == 0
        assert NewsLetterCategory.get(newsLetterCategory.id) == null
        assert response.redirectedUrl == '/newsLetterCategory/list'
    }
}
