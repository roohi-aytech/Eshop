package eshop.delivery



import org.junit.*
import grails.test.mixin.*

@TestFor(DeliveryPricingRuleController)
@Mock(DeliveryPricingRule)
class DeliveryPricingRuleControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/deliveryPricingRule/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.deliveryPricingRuleInstanceList.size() == 0
        assert model.deliveryPricingRuleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.deliveryPricingRuleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.deliveryPricingRuleInstance != null
        assert view == '/deliveryPricingRule/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/deliveryPricingRule/show/1'
        assert controller.flash.message != null
        assert DeliveryPricingRule.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/deliveryPricingRule/list'


        populateValidParams(params)
        def deliveryPricingRule = new DeliveryPricingRule(params)

        assert deliveryPricingRule.save() != null

        params.id = deliveryPricingRule.id

        def model = controller.show()

        assert model.deliveryPricingRuleInstance == deliveryPricingRule
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/deliveryPricingRule/list'


        populateValidParams(params)
        def deliveryPricingRule = new DeliveryPricingRule(params)

        assert deliveryPricingRule.save() != null

        params.id = deliveryPricingRule.id

        def model = controller.edit()

        assert model.deliveryPricingRuleInstance == deliveryPricingRule
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/deliveryPricingRule/list'

        response.reset()


        populateValidParams(params)
        def deliveryPricingRule = new DeliveryPricingRule(params)

        assert deliveryPricingRule.save() != null

        // test invalid parameters in update
        params.id = deliveryPricingRule.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/deliveryPricingRule/edit"
        assert model.deliveryPricingRuleInstance != null

        deliveryPricingRule.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/deliveryPricingRule/show/$deliveryPricingRule.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        deliveryPricingRule.clearErrors()

        populateValidParams(params)
        params.id = deliveryPricingRule.id
        params.version = -1
        controller.update()

        assert view == "/deliveryPricingRule/edit"
        assert model.deliveryPricingRuleInstance != null
        assert model.deliveryPricingRuleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/deliveryPricingRule/list'

        response.reset()

        populateValidParams(params)
        def deliveryPricingRule = new DeliveryPricingRule(params)

        assert deliveryPricingRule.save() != null
        assert DeliveryPricingRule.count() == 1

        params.id = deliveryPricingRule.id

        controller.delete()

        assert DeliveryPricingRule.count() == 0
        assert DeliveryPricingRule.get(deliveryPricingRule.id) == null
        assert response.redirectedUrl == '/deliveryPricingRule/list'
    }
}
