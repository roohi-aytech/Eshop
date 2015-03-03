package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(CustomerReviewController)
@Mock(CustomerReview)
class CustomerReviewControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/customerReview/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.customerReviewInstanceList.size() == 0
        assert model.customerReviewInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.customerReviewInstance != null
    }

    void testSave() {
        controller.save()

        assert model.customerReviewInstance != null
        assert view == '/customerReview/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/customerReview/show/1'
        assert controller.flash.message != null
        assert CustomerReview.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/customerReview/list'


        populateValidParams(params)
        def customerReview = new CustomerReview(params)

        assert customerReview.save() != null

        params.id = customerReview.id

        def model = controller.show()

        assert model.customerReviewInstance == customerReview
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/customerReview/list'


        populateValidParams(params)
        def customerReview = new CustomerReview(params)

        assert customerReview.save() != null

        params.id = customerReview.id

        def model = controller.edit()

        assert model.customerReviewInstance == customerReview
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/customerReview/list'

        response.reset()


        populateValidParams(params)
        def customerReview = new CustomerReview(params)

        assert customerReview.save() != null

        // test invalid parameters in update
        params.id = customerReview.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/customerReview/edit"
        assert model.customerReviewInstance != null

        customerReview.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/customerReview/show/$customerReview.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        customerReview.clearErrors()

        populateValidParams(params)
        params.id = customerReview.id
        params.version = -1
        controller.update()

        assert view == "/customerReview/edit"
        assert model.customerReviewInstance != null
        assert model.customerReviewInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/customerReview/list'

        response.reset()

        populateValidParams(params)
        def customerReview = new CustomerReview(params)

        assert customerReview.save() != null
        assert CustomerReview.count() == 1

        params.id = customerReview.id

        controller.delete()

        assert CustomerReview.count() == 0
        assert CustomerReview.get(customerReview.id) == null
        assert response.redirectedUrl == '/customerReview/list'
    }
}
