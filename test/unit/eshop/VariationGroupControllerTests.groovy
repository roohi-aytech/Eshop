package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(VariationGroupController)
@Mock(VariationGroup)
class VariationGroupControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/variationGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.variationGroupInstanceList.size() == 0
        assert model.variationGroupInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.variationGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.variationGroupInstance != null
        assert view == '/variationGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/variationGroup/show/1'
        assert controller.flash.message != null
        assert VariationGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/variationGroup/list'


        populateValidParams(params)
        def variationGroup = new VariationGroup(params)

        assert variationGroup.save() != null

        params.id = variationGroup.id

        def model = controller.show()

        assert model.variationGroupInstance == variationGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/variationGroup/list'


        populateValidParams(params)
        def variationGroup = new VariationGroup(params)

        assert variationGroup.save() != null

        params.id = variationGroup.id

        def model = controller.edit()

        assert model.variationGroupInstance == variationGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/variationGroup/list'

        response.reset()


        populateValidParams(params)
        def variationGroup = new VariationGroup(params)

        assert variationGroup.save() != null

        // test invalid parameters in update
        params.id = variationGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/variationGroup/edit"
        assert model.variationGroupInstance != null

        variationGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/variationGroup/show/$variationGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        variationGroup.clearErrors()

        populateValidParams(params)
        params.id = variationGroup.id
        params.version = -1
        controller.update()

        assert view == "/variationGroup/edit"
        assert model.variationGroupInstance != null
        assert model.variationGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/variationGroup/list'

        response.reset()

        populateValidParams(params)
        def variationGroup = new VariationGroup(params)

        assert variationGroup.save() != null
        assert VariationGroup.count() == 1

        params.id = variationGroup.id

        controller.delete()

        assert VariationGroup.count() == 0
        assert VariationGroup.get(variationGroup.id) == null
        assert response.redirectedUrl == '/variationGroup/list'
    }
}
