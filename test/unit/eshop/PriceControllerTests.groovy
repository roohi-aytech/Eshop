package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(PriceController)
@Mock(Price)
class PriceControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/price/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.priceInstanceList.size() == 0
        assert model.priceInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.priceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.priceInstance != null
        assert view == '/price/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/price/show/1'
        assert controller.flash.message != null
        assert Price.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/price/list'


        populateValidParams(params)
        def price = new Price(params)

        assert price.save() != null

        params.id = price.id

        def model = controller.show()

        assert model.priceInstance == price
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/price/list'


        populateValidParams(params)
        def price = new Price(params)

        assert price.save() != null

        params.id = price.id

        def model = controller.edit()

        assert model.priceInstance == price
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/price/list'

        response.reset()


        populateValidParams(params)
        def price = new Price(params)

        assert price.save() != null

        // test invalid parameters in update
        params.id = price.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/price/edit"
        assert model.priceInstance != null

        price.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/price/show/$price.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        price.clearErrors()

        populateValidParams(params)
        params.id = price.id
        params.version = -1
        controller.update()

        assert view == "/price/edit"
        assert model.priceInstance != null
        assert model.priceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/price/list'

        response.reset()

        populateValidParams(params)
        def price = new Price(params)

        assert price.save() != null
        assert Price.count() == 1

        params.id = price.id

        controller.delete()

        assert Price.count() == 0
        assert Price.get(price.id) == null
        assert response.redirectedUrl == '/price/list'
    }
}
