package eshop



import org.junit.*
import grails.test.mixin.*

@TestFor(RelationshipController)
@Mock(Relationship)
class RelationshipControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/relationship/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.relationshipInstanceList.size() == 0
        assert model.relationshipInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.relationshipInstance != null
    }

    void testSave() {
        controller.save()

        assert model.relationshipInstance != null
        assert view == '/relationship/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/relationship/show/1'
        assert controller.flash.message != null
        assert Relationship.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/relationship/list'


        populateValidParams(params)
        def relationship = new Relationship(params)

        assert relationship.save() != null

        params.id = relationship.id

        def model = controller.show()

        assert model.relationshipInstance == relationship
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/relationship/list'


        populateValidParams(params)
        def relationship = new Relationship(params)

        assert relationship.save() != null

        params.id = relationship.id

        def model = controller.edit()

        assert model.relationshipInstance == relationship
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/relationship/list'

        response.reset()


        populateValidParams(params)
        def relationship = new Relationship(params)

        assert relationship.save() != null

        // test invalid parameters in update
        params.id = relationship.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/relationship/edit"
        assert model.relationshipInstance != null

        relationship.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/relationship/show/$relationship.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        relationship.clearErrors()

        populateValidParams(params)
        params.id = relationship.id
        params.version = -1
        controller.update()

        assert view == "/relationship/edit"
        assert model.relationshipInstance != null
        assert model.relationshipInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/relationship/list'

        response.reset()

        populateValidParams(params)
        def relationship = new Relationship(params)

        assert relationship.save() != null
        assert Relationship.count() == 1

        params.id = relationship.id

        controller.delete()

        assert Relationship.count() == 0
        assert Relationship.get(relationship.id) == null
        assert response.redirectedUrl == '/relationship/list'
    }
}
