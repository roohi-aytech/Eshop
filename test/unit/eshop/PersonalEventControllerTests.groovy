package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(PersonalEventController)
@Mock(PersonalEvent)
class PersonalEventControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/personalEvent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.personalEventInstanceList.size() == 0
        assert model.personalEventInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.personalEventInstance != null
    }

    void testSave() {
        controller.save()

        assert model.personalEventInstance != null
        assert view == '/personalEvent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/personalEvent/show/1'
        assert controller.flash.message != null
        assert PersonalEvent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/personalEvent/list'


        populateValidParams(params)
        def personalEvent = new PersonalEvent(params)

        assert personalEvent.save() != null

        params.id = personalEvent.id

        def model = controller.show()

        assert model.personalEventInstance == personalEvent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/personalEvent/list'


        populateValidParams(params)
        def personalEvent = new PersonalEvent(params)

        assert personalEvent.save() != null

        params.id = personalEvent.id

        def model = controller.edit()

        assert model.personalEventInstance == personalEvent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/personalEvent/list'

        response.reset()


        populateValidParams(params)
        def personalEvent = new PersonalEvent(params)

        assert personalEvent.save() != null

        // test invalid parameters in update
        params.id = personalEvent.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/personalEvent/edit"
        assert model.personalEventInstance != null

        personalEvent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/personalEvent/show/$personalEvent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        personalEvent.clearErrors()

        populateValidParams(params)
        params.id = personalEvent.id
        params.version = -1
        controller.update()

        assert view == "/personalEvent/edit"
        assert model.personalEventInstance != null
        assert model.personalEventInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/personalEvent/list'

        response.reset()

        populateValidParams(params)
        def personalEvent = new PersonalEvent(params)

        assert personalEvent.save() != null
        assert PersonalEvent.count() == 1

        params.id = personalEvent.id

        controller.delete()

        assert PersonalEvent.count() == 0
        assert PersonalEvent.get(personalEvent.id) == null
        assert response.redirectedUrl == '/personalEvent/list'
    }
}
