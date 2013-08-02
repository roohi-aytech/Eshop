package eshop.accounting



import org.junit.*
import grails.test.mixin.*

@TestFor(AccountFilterController)
@Mock(AccountFilter)
class AccountFilterControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/accountFilter/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.accountFilterInstanceList.size() == 0
        assert model.accountFilterInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.accountFilterInstance != null
    }

    void testSave() {
        controller.save()

        assert model.accountFilterInstance != null
        assert view == '/accountFilter/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/accountFilter/show/1'
        assert controller.flash.message != null
        assert AccountFilter.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/accountFilter/list'


        populateValidParams(params)
        def accountFilter = new AccountFilter(params)

        assert accountFilter.save() != null

        params.id = accountFilter.id

        def model = controller.show()

        assert model.accountFilterInstance == accountFilter
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/accountFilter/list'


        populateValidParams(params)
        def accountFilter = new AccountFilter(params)

        assert accountFilter.save() != null

        params.id = accountFilter.id

        def model = controller.edit()

        assert model.accountFilterInstance == accountFilter
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/accountFilter/list'

        response.reset()


        populateValidParams(params)
        def accountFilter = new AccountFilter(params)

        assert accountFilter.save() != null

        // test invalid parameters in update
        params.id = accountFilter.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/accountFilter/edit"
        assert model.accountFilterInstance != null

        accountFilter.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/accountFilter/show/$accountFilter.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        accountFilter.clearErrors()

        populateValidParams(params)
        params.id = accountFilter.id
        params.version = -1
        controller.update()

        assert view == "/accountFilter/edit"
        assert model.accountFilterInstance != null
        assert model.accountFilterInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/accountFilter/list'

        response.reset()

        populateValidParams(params)
        def accountFilter = new AccountFilter(params)

        assert accountFilter.save() != null
        assert AccountFilter.count() == 1

        params.id = accountFilter.id

        controller.delete()

        assert AccountFilter.count() == 0
        assert AccountFilter.get(accountFilter.id) == null
        assert response.redirectedUrl == '/accountFilter/list'
    }
}
