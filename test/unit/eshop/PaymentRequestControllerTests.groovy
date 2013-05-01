package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(PaymentRequestController)
@Mock(PaymentRequest)
class PaymentRequestControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/paymentRequest/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.paymentRequestInstanceList.size() == 0
        assert model.paymentRequestInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.paymentRequestInstance != null
    }

    void testSave() {
        controller.save()

        assert model.paymentRequestInstance != null
        assert view == '/paymentRequest/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/paymentRequest/show/1'
        assert controller.flash.message != null
        assert PaymentRequest.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentRequest/list'


        populateValidParams(params)
        def paymentRequest = new PaymentRequest(params)

        assert paymentRequest.save() != null

        params.id = paymentRequest.id

        def model = controller.show()

        assert model.paymentRequestInstance == paymentRequest
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentRequest/list'


        populateValidParams(params)
        def paymentRequest = new PaymentRequest(params)

        assert paymentRequest.save() != null

        params.id = paymentRequest.id

        def model = controller.edit()

        assert model.paymentRequestInstance == paymentRequest
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentRequest/list'

        response.reset()


        populateValidParams(params)
        def paymentRequest = new PaymentRequest(params)

        assert paymentRequest.save() != null

        // test invalid parameters in update
        params.id = paymentRequest.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/paymentRequest/edit"
        assert model.paymentRequestInstance != null

        paymentRequest.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/paymentRequest/show/$paymentRequest.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        paymentRequest.clearErrors()

        populateValidParams(params)
        params.id = paymentRequest.id
        params.version = -1
        controller.update()

        assert view == "/paymentRequest/edit"
        assert model.paymentRequestInstance != null
        assert model.paymentRequestInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/paymentRequest/list'

        response.reset()

        populateValidParams(params)
        def paymentRequest = new PaymentRequest(params)

        assert paymentRequest.save() != null
        assert PaymentRequest.count() == 1

        params.id = paymentRequest.id

        controller.delete()

        assert PaymentRequest.count() == 0
        assert PaymentRequest.get(paymentRequest.id) == null
        assert response.redirectedUrl == '/paymentRequest/list'
    }
}
