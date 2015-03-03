package eshop


import org.junit.*
import grails.test.mixin.*

@TestFor(AddedValueTypeController)
@Mock(AddedValueType)
class AddedValueTypeControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/addedValueType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.addedValueTypeInstanceList.size() == 0
        assert model.addedValueTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.addedValueTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.addedValueTypeInstance != null
        assert view == '/addedValueType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/addedValueType/show/1'
        assert controller.flash.message != null
        assert AddedValueType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/addedValueType/list'


        populateValidParams(params)
        def addedValueType = new AddedValueType(params)

        assert addedValueType.save() != null

        params.id = addedValueType.id

        def model = controller.show()

        assert model.addedValueTypeInstance == addedValueType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/addedValueType/list'


        populateValidParams(params)
        def addedValueType = new AddedValueType(params)

        assert addedValueType.save() != null

        params.id = addedValueType.id

        def model = controller.edit()

        assert model.addedValueTypeInstance == addedValueType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/addedValueType/list'

        response.reset()


        populateValidParams(params)
        def addedValueType = new AddedValueType(params)

        assert addedValueType.save() != null

        // test invalid parameters in update
        params.id = addedValueType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/addedValueType/edit"
        assert model.addedValueTypeInstance != null

        addedValueType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/addedValueType/show/$addedValueType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        addedValueType.clearErrors()

        populateValidParams(params)
        params.id = addedValueType.id
        params.version = -1
        controller.update()

        assert view == "/addedValueType/edit"
        assert model.addedValueTypeInstance != null
        assert model.addedValueTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/addedValueType/list'

        response.reset()

        populateValidParams(params)
        def addedValueType = new AddedValueType(params)

        assert addedValueType.save() != null
        assert AddedValueType.count() == 1

        params.id = addedValueType.id

        controller.delete()

        assert AddedValueType.count() == 0
        assert AddedValueType.get(addedValueType.id) == null
        assert response.redirectedUrl == '/addedValueType/list'
    }
}
