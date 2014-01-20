package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(MenuConfigController)
@Mock(MenuConfig)
class MenuConfigControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/menuConfig/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.menuConfigInstanceList.size() == 0
        assert model.menuConfigInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.menuConfigInstance != null
    }

    void testSave() {
        controller.save()

        assert model.menuConfigInstance != null
        assert view == '/menuConfig/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/menuConfig/show/1'
        assert controller.flash.message != null
        assert MenuConfig.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/menuConfig/list'


        populateValidParams(params)
        def menuConfig = new MenuConfig(params)

        assert menuConfig.save() != null

        params.id = menuConfig.id

        def model = controller.show()

        assert model.menuConfigInstance == menuConfig
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/menuConfig/list'


        populateValidParams(params)
        def menuConfig = new MenuConfig(params)

        assert menuConfig.save() != null

        params.id = menuConfig.id

        def model = controller.edit()

        assert model.menuConfigInstance == menuConfig
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/menuConfig/list'

        response.reset()


        populateValidParams(params)
        def menuConfig = new MenuConfig(params)

        assert menuConfig.save() != null

        // test invalid parameters in update
        params.id = menuConfig.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/menuConfig/edit"
        assert model.menuConfigInstance != null

        menuConfig.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/menuConfig/show/$menuConfig.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        menuConfig.clearErrors()

        populateValidParams(params)
        params.id = menuConfig.id
        params.version = -1
        controller.update()

        assert view == "/menuConfig/edit"
        assert model.menuConfigInstance != null
        assert model.menuConfigInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/menuConfig/list'

        response.reset()

        populateValidParams(params)
        def menuConfig = new MenuConfig(params)

        assert menuConfig.save() != null
        assert MenuConfig.count() == 1

        params.id = menuConfig.id

        controller.delete()

        assert MenuConfig.count() == 0
        assert MenuConfig.get(menuConfig.id) == null
        assert response.redirectedUrl == '/menuConfig/list'
    }
}
