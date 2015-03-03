package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(CultureEventController)
@Mock(CultureEvent)
class CultureEventControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cultureEvent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cultureEventInstanceList.size() == 0
        assert model.cultureEventInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cultureEventInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cultureEventInstance != null
        assert view == '/cultureEvent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cultureEvent/show/1'
        assert controller.flash.message != null
        assert CultureEvent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cultureEvent/list'


        populateValidParams(params)
        def cultureEvent = new CultureEvent(params)

        assert cultureEvent.save() != null

        params.id = cultureEvent.id

        def model = controller.show()

        assert model.cultureEventInstance == cultureEvent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cultureEvent/list'


        populateValidParams(params)
        def cultureEvent = new CultureEvent(params)

        assert cultureEvent.save() != null

        params.id = cultureEvent.id

        def model = controller.edit()

        assert model.cultureEventInstance == cultureEvent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cultureEvent/list'

        response.reset()


        populateValidParams(params)
        def cultureEvent = new CultureEvent(params)

        assert cultureEvent.save() != null

        // test invalid parameters in update
        params.id = cultureEvent.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cultureEvent/edit"
        assert model.cultureEventInstance != null

        cultureEvent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cultureEvent/show/$cultureEvent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cultureEvent.clearErrors()

        populateValidParams(params)
        params.id = cultureEvent.id
        params.version = -1
        controller.update()

        assert view == "/cultureEvent/edit"
        assert model.cultureEventInstance != null
        assert model.cultureEventInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cultureEvent/list'

        response.reset()

        populateValidParams(params)
        def cultureEvent = new CultureEvent(params)

        assert cultureEvent.save() != null
        assert CultureEvent.count() == 1

        params.id = cultureEvent.id

        controller.delete()

        assert CultureEvent.count() == 0
        assert CultureEvent.get(cultureEvent.id) == null
        assert response.redirectedUrl == '/cultureEvent/list'
    }
}
