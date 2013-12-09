package com.cland.casting



import org.junit.*
import grails.test.mixin.*

@TestFor(AgencyPortfolioSetController)
@Mock(AgencyPortfolioSet)
class AgencyPortfolioSetControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/agencyPortfolioSet/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.agencyPortfolioSetInstanceList.size() == 0
        assert model.agencyPortfolioSetInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.agencyPortfolioSetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.agencyPortfolioSetInstance != null
        assert view == '/agencyPortfolioSet/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/agencyPortfolioSet/show/1'
        assert controller.flash.message != null
        assert AgencyPortfolioSet.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/agencyPortfolioSet/list'

        populateValidParams(params)
        def agencyPortfolioSet = new AgencyPortfolioSet(params)

        assert agencyPortfolioSet.save() != null

        params.id = agencyPortfolioSet.id

        def model = controller.show()

        assert model.agencyPortfolioSetInstance == agencyPortfolioSet
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/agencyPortfolioSet/list'

        populateValidParams(params)
        def agencyPortfolioSet = new AgencyPortfolioSet(params)

        assert agencyPortfolioSet.save() != null

        params.id = agencyPortfolioSet.id

        def model = controller.edit()

        assert model.agencyPortfolioSetInstance == agencyPortfolioSet
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/agencyPortfolioSet/list'

        response.reset()

        populateValidParams(params)
        def agencyPortfolioSet = new AgencyPortfolioSet(params)

        assert agencyPortfolioSet.save() != null

        // test invalid parameters in update
        params.id = agencyPortfolioSet.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/agencyPortfolioSet/edit"
        assert model.agencyPortfolioSetInstance != null

        agencyPortfolioSet.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/agencyPortfolioSet/show/$agencyPortfolioSet.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        agencyPortfolioSet.clearErrors()

        populateValidParams(params)
        params.id = agencyPortfolioSet.id
        params.version = -1
        controller.update()

        assert view == "/agencyPortfolioSet/edit"
        assert model.agencyPortfolioSetInstance != null
        assert model.agencyPortfolioSetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/agencyPortfolioSet/list'

        response.reset()

        populateValidParams(params)
        def agencyPortfolioSet = new AgencyPortfolioSet(params)

        assert agencyPortfolioSet.save() != null
        assert AgencyPortfolioSet.count() == 1

        params.id = agencyPortfolioSet.id

        controller.delete()

        assert AgencyPortfolioSet.count() == 0
        assert AgencyPortfolioSet.get(agencyPortfolioSet.id) == null
        assert response.redirectedUrl == '/agencyPortfolioSet/list'
    }
}
