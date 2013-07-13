package eshop.delivery



import org.junit.*
import grails.test.mixin.*

@TestFor(DeliveryTargetZoneController)
@Mock(DeliveryTargetZone)
class DeliveryTargetZoneControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/deliveryTargetZone/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.deliveryTargetZoneInstanceList.size() == 0
        assert model.deliveryTargetZoneInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.deliveryTargetZoneInstance != null
    }

    void testSave() {
        controller.save()

        assert model.deliveryTargetZoneInstance != null
        assert view == '/deliveryTargetZone/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/deliveryTargetZone/show/1'
        assert controller.flash.message != null
        assert DeliveryTargetZone.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/deliveryTargetZone/list'


        populateValidParams(params)
        def deliveryTargetZone = new DeliveryTargetZone(params)

        assert deliveryTargetZone.save() != null

        params.id = deliveryTargetZone.id

        def model = controller.show()

        assert model.deliveryTargetZoneInstance == deliveryTargetZone
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/deliveryTargetZone/list'


        populateValidParams(params)
        def deliveryTargetZone = new DeliveryTargetZone(params)

        assert deliveryTargetZone.save() != null

        params.id = deliveryTargetZone.id

        def model = controller.edit()

        assert model.deliveryTargetZoneInstance == deliveryTargetZone
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/deliveryTargetZone/list'

        response.reset()


        populateValidParams(params)
        def deliveryTargetZone = new DeliveryTargetZone(params)

        assert deliveryTargetZone.save() != null

        // test invalid parameters in update
        params.id = deliveryTargetZone.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/deliveryTargetZone/edit"
        assert model.deliveryTargetZoneInstance != null

        deliveryTargetZone.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/deliveryTargetZone/show/$deliveryTargetZone.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        deliveryTargetZone.clearErrors()

        populateValidParams(params)
        params.id = deliveryTargetZone.id
        params.version = -1
        controller.update()

        assert view == "/deliveryTargetZone/edit"
        assert model.deliveryTargetZoneInstance != null
        assert model.deliveryTargetZoneInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/deliveryTargetZone/list'

        response.reset()

        populateValidParams(params)
        def deliveryTargetZone = new DeliveryTargetZone(params)

        assert deliveryTargetZone.save() != null
        assert DeliveryTargetZone.count() == 1

        params.id = deliveryTargetZone.id

        controller.delete()

        assert DeliveryTargetZone.count() == 0
        assert DeliveryTargetZone.get(deliveryTargetZone.id) == null
        assert response.redirectedUrl == '/deliveryTargetZone/list'
    }
}
