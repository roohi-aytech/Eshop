package eshop.goldaan


import org.junit.*
import grails.test.mixin.*

@TestFor(SpecialProductsController)
@Mock(SpecialProducts)
class SpecialProductsControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/specialProducts/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.specialProductsInstanceList.size() == 0
        assert model.specialProductsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.specialProductsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.specialProductsInstance != null
        assert view == '/specialProducts/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/specialProducts/show/1'
        assert controller.flash.message != null
        assert SpecialProducts.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/specialProducts/list'


        populateValidParams(params)
        def specialProducts = new SpecialProducts(params)

        assert specialProducts.save() != null

        params.id = specialProducts.id

        def model = controller.show()

        assert model.specialProductsInstance == specialProducts
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/specialProducts/list'


        populateValidParams(params)
        def specialProducts = new SpecialProducts(params)

        assert specialProducts.save() != null

        params.id = specialProducts.id

        def model = controller.edit()

        assert model.specialProductsInstance == specialProducts
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/specialProducts/list'

        response.reset()


        populateValidParams(params)
        def specialProducts = new SpecialProducts(params)

        assert specialProducts.save() != null

        // test invalid parameters in update
        params.id = specialProducts.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/specialProducts/edit"
        assert model.specialProductsInstance != null

        specialProducts.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/specialProducts/show/$specialProducts.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        specialProducts.clearErrors()

        populateValidParams(params)
        params.id = specialProducts.id
        params.version = -1
        controller.update()

        assert view == "/specialProducts/edit"
        assert model.specialProductsInstance != null
        assert model.specialProductsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/specialProducts/list'

        response.reset()

        populateValidParams(params)
        def specialProducts = new SpecialProducts(params)

        assert specialProducts.save() != null
        assert SpecialProducts.count() == 1

        params.id = specialProducts.id

        controller.delete()

        assert SpecialProducts.count() == 0
        assert SpecialProducts.get(specialProducts.id) == null
        assert response.redirectedUrl == '/specialProducts/list'
    }
}
