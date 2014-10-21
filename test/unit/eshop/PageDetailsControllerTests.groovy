package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(PageDetailsController)
@Mock(PageDetails)
class PageDetailsControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pageDetails/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pageDetailsInstanceList.size() == 0
        assert model.pageDetailsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pageDetailsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pageDetailsInstance != null
        assert view == '/pageDetails/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pageDetails/show/1'
        assert controller.flash.message != null
        assert PageDetails.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pageDetails/list'


        populateValidParams(params)
        def pageDetails = new PageDetails(params)

        assert pageDetails.save() != null

        params.id = pageDetails.id

        def model = controller.show()

        assert model.pageDetailsInstance == pageDetails
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pageDetails/list'


        populateValidParams(params)
        def pageDetails = new PageDetails(params)

        assert pageDetails.save() != null

        params.id = pageDetails.id

        def model = controller.edit()

        assert model.pageDetailsInstance == pageDetails
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pageDetails/list'

        response.reset()


        populateValidParams(params)
        def pageDetails = new PageDetails(params)

        assert pageDetails.save() != null

        // test invalid parameters in update
        params.id = pageDetails.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pageDetails/edit"
        assert model.pageDetailsInstance != null

        pageDetails.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pageDetails/show/$pageDetails.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pageDetails.clearErrors()

        populateValidParams(params)
        params.id = pageDetails.id
        params.version = -1
        controller.update()

        assert view == "/pageDetails/edit"
        assert model.pageDetailsInstance != null
        assert model.pageDetailsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pageDetails/list'

        response.reset()

        populateValidParams(params)
        def pageDetails = new PageDetails(params)

        assert pageDetails.save() != null
        assert PageDetails.count() == 1

        params.id = pageDetails.id

        controller.delete()

        assert PageDetails.count() == 0
        assert PageDetails.get(pageDetails.id) == null
        assert response.redirectedUrl == '/pageDetails/list'
    }
}
