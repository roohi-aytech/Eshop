package eshop.discout



import org.junit.*
import grails.test.mixin.*

@TestFor(DiscountController)
@Mock(Discount)
class DiscountControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/discount/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.discountInstanceList.size() == 0
        assert model.discountInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.discountInstance != null
    }

    void testSave() {
        controller.save()

        assert model.discountInstance != null
        assert view == '/discount/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/discount/show/1'
        assert controller.flash.message != null
        assert Discount.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/discount/list'


        populateValidParams(params)
        def discount = new Discount(params)

        assert discount.save() != null

        params.id = discount.id

        def model = controller.show()

        assert model.discountInstance == discount
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/discount/list'


        populateValidParams(params)
        def discount = new Discount(params)

        assert discount.save() != null

        params.id = discount.id

        def model = controller.edit()

        assert model.discountInstance == discount
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/discount/list'

        response.reset()


        populateValidParams(params)
        def discount = new Discount(params)

        assert discount.save() != null

        // test invalid parameters in update
        params.id = discount.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/discount/edit"
        assert model.discountInstance != null

        discount.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/discount/show/$discount.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        discount.clearErrors()

        populateValidParams(params)
        params.id = discount.id
        params.version = -1
        controller.update()

        assert view == "/discount/edit"
        assert model.discountInstance != null
        assert model.discountInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/discount/list'

        response.reset()

        populateValidParams(params)
        def discount = new Discount(params)

        assert discount.save() != null
        assert Discount.count() == 1

        params.id = discount.id

        controller.delete()

        assert Discount.count() == 0
        assert Discount.get(discount.id) == null
        assert response.redirectedUrl == '/discount/list'
    }
}
