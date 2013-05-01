package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(PaymentResponseController)
@Mock(PaymentResponse)
class PaymentResponseControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/paymentResponse/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.paymentResponseInstanceList.size() == 0
        assert model.paymentResponseInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.paymentResponseInstance != null
    }

    void testSave() {
        controller.save()

        assert model.paymentResponseInstance != null
        assert view == '/paymentResponse/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/paymentResponse/show/1'
        assert controller.flash.message != null
        assert PaymentResponse.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentResponse/list'


        populateValidParams(params)
        def paymentResponse = new PaymentResponse(params)

        assert paymentResponse.save() != null

        params.id = paymentResponse.id

        def model = controller.show()

        assert model.paymentResponseInstance == paymentResponse
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentResponse/list'


        populateValidParams(params)
        def paymentResponse = new PaymentResponse(params)

        assert paymentResponse.save() != null

        params.id = paymentResponse.id

        def model = controller.edit()

        assert model.paymentResponseInstance == paymentResponse
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentResponse/list'

        response.reset()


        populateValidParams(params)
        def paymentResponse = new PaymentResponse(params)

        assert paymentResponse.save() != null

        // test invalid parameters in update
        params.id = paymentResponse.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/paymentResponse/edit"
        assert model.paymentResponseInstance != null

        paymentResponse.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/paymentResponse/show/$paymentResponse.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        paymentResponse.clearErrors()

        populateValidParams(params)
        params.id = paymentResponse.id
        params.version = -1
        controller.update()

        assert view == "/paymentResponse/edit"
        assert model.paymentResponseInstance != null
        assert model.paymentResponseInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/paymentResponse/list'

        response.reset()

        populateValidParams(params)
        def paymentResponse = new PaymentResponse(params)

        assert paymentResponse.save() != null
        assert PaymentResponse.count() == 1

        params.id = paymentResponse.id

        controller.delete()

        assert PaymentResponse.count() == 0
        assert PaymentResponse.get(paymentResponse.id) == null
        assert response.redirectedUrl == '/paymentResponse/list'
    }
}
