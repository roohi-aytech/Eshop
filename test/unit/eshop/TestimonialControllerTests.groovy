package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(TestimonialController)
@Mock(Testimonial)
class TestimonialControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/testimonial/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.testimonialInstanceList.size() == 0
        assert model.testimonialInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.testimonialInstance != null
    }

    void testSave() {
        controller.save()

        assert model.testimonialInstance != null
        assert view == '/testimonial/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/testimonial/show/1'
        assert controller.flash.message != null
        assert Testimonial.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/testimonial/list'


        populateValidParams(params)
        def testimonial = new Testimonial(params)

        assert testimonial.save() != null

        params.id = testimonial.id

        def model = controller.show()

        assert model.testimonialInstance == testimonial
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/testimonial/list'


        populateValidParams(params)
        def testimonial = new Testimonial(params)

        assert testimonial.save() != null

        params.id = testimonial.id

        def model = controller.edit()

        assert model.testimonialInstance == testimonial
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/testimonial/list'

        response.reset()


        populateValidParams(params)
        def testimonial = new Testimonial(params)

        assert testimonial.save() != null

        // test invalid parameters in update
        params.id = testimonial.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/testimonial/edit"
        assert model.testimonialInstance != null

        testimonial.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/testimonial/show/$testimonial.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        testimonial.clearErrors()

        populateValidParams(params)
        params.id = testimonial.id
        params.version = -1
        controller.update()

        assert view == "/testimonial/edit"
        assert model.testimonialInstance != null
        assert model.testimonialInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/testimonial/list'

        response.reset()

        populateValidParams(params)
        def testimonial = new Testimonial(params)

        assert testimonial.save() != null
        assert Testimonial.count() == 1

        params.id = testimonial.id

        controller.delete()

        assert Testimonial.count() == 0
        assert Testimonial.get(testimonial.id) == null
        assert response.redirectedUrl == '/testimonial/list'
    }
}
