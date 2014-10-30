package eshop

import grails.test.mixin.*

@TestFor(SlideController)
@Mock(Slide)
class SlideControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/slideshowItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.slideshowItemInstanceList.size() == 0
        assert model.slideshowItemInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.slideshowItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.slideshowItemInstance != null
        assert view == '/slideshowItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/slideshowItem/show/1'
        assert controller.flash.message != null
        assert Slide.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/slideshowItem/list'


        populateValidParams(params)
        def slideshowItem = new Slide(params)

        assert slideshowItem.save() != null

        params.id = slideshowItem.id

        def model = controller.show()

        assert model.slideshowItemInstance == slideshowItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/slideshowItem/list'


        populateValidParams(params)
        def slideshowItem = new Slide(params)

        assert slideshowItem.save() != null

        params.id = slideshowItem.id

        def model = controller.edit()

        assert model.slideshowItemInstance == slideshowItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/slideshowItem/list'

        response.reset()


        populateValidParams(params)
        def slideshowItem = new Slide(params)

        assert slideshowItem.save() != null

        // test invalid parameters in update
        params.id = slideshowItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/slideshowItem/edit"
        assert model.slideshowItemInstance != null

        slideshowItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/slideshowItem/show/$slideshowItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        slideshowItem.clearErrors()

        populateValidParams(params)
        params.id = slideshowItem.id
        params.version = -1
        controller.update()

        assert view == "/slideshowItem/edit"
        assert model.slideshowItemInstance != null
        assert model.slideshowItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/slideshowItem/list'

        response.reset()

        populateValidParams(params)
        def slideshowItem = new Slide(params)

        assert slideshowItem.save() != null
        assert Slide.count() == 1

        params.id = slideshowItem.id

        controller.delete()

        assert Slide.count() == 0
        assert Slide.get(slideshowItem.id) == null
        assert response.redirectedUrl == '/slideshowItem/list'
    }
}
