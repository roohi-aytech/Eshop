package eshop.delivery



import org.junit.*
import grails.test.mixin.*

@TestFor(DeliveryMethodController)
@Mock(DeliveryMethod)
class DeliveryMethodControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/deliveryMethod/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.deliveryMethodInstanceList.size() == 0
        assert model.deliveryMethodInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.deliveryMethodInstance != null
    }

    void testSave() {
        controller.save()

        assert model.deliveryMethodInstance != null
        assert view == '/deliveryMethod/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/deliveryMethod/show/1'
        assert controller.flash.message != null
        assert DeliveryMethod.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/deliveryMethod/list'


        populateValidParams(params)
        def deliveryMethod = new DeliveryMethod(params)

        assert deliveryMethod.save() != null

        params.id = deliveryMethod.id

        def model = controller.show()

        assert model.deliveryMethodInstance == deliveryMethod
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/deliveryMethod/list'


        populateValidParams(params)
        def deliveryMethod = new DeliveryMethod(params)

        assert deliveryMethod.save() != null

        params.id = deliveryMethod.id

        def model = controller.edit()

        assert model.deliveryMethodInstance == deliveryMethod
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/deliveryMethod/list'

        response.reset()


        populateValidParams(params)
        def deliveryMethod = new DeliveryMethod(params)

        assert deliveryMethod.save() != null

        // test invalid parameters in update
        params.id = deliveryMethod.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/deliveryMethod/edit"
        assert model.deliveryMethodInstance != null

        deliveryMethod.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/deliveryMethod/show/$deliveryMethod.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        deliveryMethod.clearErrors()

        populateValidParams(params)
        params.id = deliveryMethod.id
        params.version = -1
        controller.update()

        assert view == "/deliveryMethod/edit"
        assert model.deliveryMethodInstance != null
        assert model.deliveryMethodInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/deliveryMethod/list'

        response.reset()

        populateValidParams(params)
        def deliveryMethod = new DeliveryMethod(params)

        assert deliveryMethod.save() != null
        assert DeliveryMethod.count() == 1

        params.id = deliveryMethod.id

        controller.delete()

        assert DeliveryMethod.count() == 0
        assert DeliveryMethod.get(deliveryMethod.id) == null
        assert response.redirectedUrl == '/deliveryMethod/list'
    }
}
