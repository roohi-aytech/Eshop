package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(AddedValueController)
@Mock(AddedValue)
class AddedValueControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/addedValue/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.addedValueInstanceList.size() == 0
        assert model.addedValueInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.addedValueInstance != null
    }

    void testSave() {
        controller.save()

        assert model.addedValueInstance != null
        assert view == '/addedValue/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/addedValue/show/1'
        assert controller.flash.message != null
        assert AddedValue.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/addedValue/list'


        populateValidParams(params)
        def addedValue = new AddedValue(params)

        assert addedValue.save() != null

        params.id = addedValue.id

        def model = controller.show()

        assert model.addedValueInstance == addedValue
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/addedValue/list'


        populateValidParams(params)
        def addedValue = new AddedValue(params)

        assert addedValue.save() != null

        params.id = addedValue.id

        def model = controller.edit()

        assert model.addedValueInstance == addedValue
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/addedValue/list'

        response.reset()


        populateValidParams(params)
        def addedValue = new AddedValue(params)

        assert addedValue.save() != null

        // test invalid parameters in update
        params.id = addedValue.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/addedValue/edit"
        assert model.addedValueInstance != null

        addedValue.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/addedValue/show/$addedValue.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        addedValue.clearErrors()

        populateValidParams(params)
        params.id = addedValue.id
        params.version = -1
        controller.update()

        assert view == "/addedValue/edit"
        assert model.addedValueInstance != null
        assert model.addedValueInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/addedValue/list'

        response.reset()

        populateValidParams(params)
        def addedValue = new AddedValue(params)

        assert addedValue.save() != null
        assert AddedValue.count() == 1

        params.id = addedValue.id

        controller.delete()

        assert AddedValue.count() == 0
        assert AddedValue.get(addedValue.id) == null
        assert response.redirectedUrl == '/addedValue/list'
    }
}
