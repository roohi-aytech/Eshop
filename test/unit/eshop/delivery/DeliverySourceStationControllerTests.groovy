package eshop.delivery



import org.junit.*
import grails.test.mixin.*

@TestFor(DeliverySourceStationController)
@Mock(DeliverySourceStation)
class DeliverySourceStationControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/deliverySourceStation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.deliverySourceStationInstanceList.size() == 0
        assert model.deliverySourceStationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.deliverySourceStationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.deliverySourceStationInstance != null
        assert view == '/deliverySourceStation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/deliverySourceStation/show/1'
        assert controller.flash.message != null
        assert DeliverySourceStation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/deliverySourceStation/list'


        populateValidParams(params)
        def deliverySourceStation = new DeliverySourceStation(params)

        assert deliverySourceStation.save() != null

        params.id = deliverySourceStation.id

        def model = controller.show()

        assert model.deliverySourceStationInstance == deliverySourceStation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/deliverySourceStation/list'


        populateValidParams(params)
        def deliverySourceStation = new DeliverySourceStation(params)

        assert deliverySourceStation.save() != null

        params.id = deliverySourceStation.id

        def model = controller.edit()

        assert model.deliverySourceStationInstance == deliverySourceStation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/deliverySourceStation/list'

        response.reset()


        populateValidParams(params)
        def deliverySourceStation = new DeliverySourceStation(params)

        assert deliverySourceStation.save() != null

        // test invalid parameters in update
        params.id = deliverySourceStation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/deliverySourceStation/edit"
        assert model.deliverySourceStationInstance != null

        deliverySourceStation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/deliverySourceStation/show/$deliverySourceStation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        deliverySourceStation.clearErrors()

        populateValidParams(params)
        params.id = deliverySourceStation.id
        params.version = -1
        controller.update()

        assert view == "/deliverySourceStation/edit"
        assert model.deliverySourceStationInstance != null
        assert model.deliverySourceStationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/deliverySourceStation/list'

        response.reset()

        populateValidParams(params)
        def deliverySourceStation = new DeliverySourceStation(params)

        assert deliverySourceStation.save() != null
        assert DeliverySourceStation.count() == 1

        params.id = deliverySourceStation.id

        controller.delete()

        assert DeliverySourceStation.count() == 0
        assert DeliverySourceStation.get(deliverySourceStation.id) == null
        assert response.redirectedUrl == '/deliverySourceStation/list'
    }
}
