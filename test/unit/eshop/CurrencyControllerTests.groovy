package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(CurrencyController)
@Mock(Currency)
class CurrencyControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/currency/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.currencyInstanceList.size() == 0
        assert model.currencyInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.currencyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.currencyInstance != null
        assert view == '/currency/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/currency/show/1'
        assert controller.flash.message != null
        assert Currency.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/currency/list'


        populateValidParams(params)
        def currency = new Currency(params)

        assert currency.save() != null

        params.id = currency.id

        def model = controller.show()

        assert model.currencyInstance == currency
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/currency/list'


        populateValidParams(params)
        def currency = new Currency(params)

        assert currency.save() != null

        params.id = currency.id

        def model = controller.edit()

        assert model.currencyInstance == currency
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/currency/list'

        response.reset()


        populateValidParams(params)
        def currency = new Currency(params)

        assert currency.save() != null

        // test invalid parameters in update
        params.id = currency.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/currency/edit"
        assert model.currencyInstance != null

        currency.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/currency/show/$currency.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        currency.clearErrors()

        populateValidParams(params)
        params.id = currency.id
        params.version = -1
        controller.update()

        assert view == "/currency/edit"
        assert model.currencyInstance != null
        assert model.currencyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/currency/list'

        response.reset()

        populateValidParams(params)
        def currency = new Currency(params)

        assert currency.save() != null
        assert Currency.count() == 1

        params.id = currency.id

        controller.delete()

        assert Currency.count() == 0
        assert Currency.get(currency.id) == null
        assert response.redirectedUrl == '/currency/list'
    }
}
