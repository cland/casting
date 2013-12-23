package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException

class ProductionController {
	def castingApiService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [productionInstanceList: Production.list(params), productionInstanceTotal: Production.count()]
    }

    def create() {
		def clientInstance = null
		if(params?.client?.id){
			clientInstance = Client.get(params.client.id)
		}
        [productionInstance: new Production(params),clientInstance:clientInstance, isEditing:true, isNew:true]
    }

    def save() {
        def productionInstance = new Production(params)
		bindData(productionInstance, params, [exclude: 'shootDate'])
		bindData(productionInstance, ['shootDate': params.date('shootDate', ['dd-MMM-yyyy'])], [include: 'shootDate'])
        if (!productionInstance.save(flush: true)) {
            render(view: "create", model: [productionInstance: productionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'production.label', default: 'Production'), productionInstance.id])
        redirect(action: "show", id: productionInstance.id)
    }

    def show(Long id) {
        def productionInstance = Production.get(id)
        if (!productionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "list")
            return
        }

		def auditionProfiles = productionInstance?.profiles //?.findAll{it.isShortlist}
		def shortlistProfiles = productionInstance?.profiles?.findAll{it.isShortlist}
		def finalProfiles = productionInstance?.profiles?.findAll{it?.outcome?.equalsIgnoreCase("selected")}
		
		def productionDates = castingApiService.getProductionDates(productionInstance)
		
		
        [productionInstance: productionInstance,auditionProfiles:auditionProfiles,shortlistProfiles:shortlistProfiles,finalProfiles:finalProfiles,productionDates:productionDates, isEditing:false, isNew:false]
    }

    def edit(Long id) {
        def productionInstance = Production.get(id)
        if (!productionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "list")
            return
        }

        [productionInstance: productionInstance, isEditing:true, isNew:false]
    }

    def update(Long id, Long version) {
        def productionInstance = Production.get(id)
        if (!productionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (productionInstance.version > version) {
                productionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'production.label', default: 'Production')] as Object[],
                          "Another user has updated this Production while you were editing")
                render(view: "edit", model: [productionInstance: productionInstance])
                return
            }
        }

        productionInstance.properties = params
		bindData(productionInstance, params, [exclude: 'shootDate'])
		bindData(productionInstance, ['shootDate': params.date('shootDate', ['dd-MMM-yyyy'])], [include: 'shootDate'])
		bindData(productionInstance, params, [exclude: 'startDate'])
		bindData(productionInstance, ['startDate': params.date('startDate', ['dd-MMM-yyyy'])], [include: 'startDate'])
		bindData(productionInstance, params, [exclude: 'endDate'])
		bindData(productionInstance, ['endDate': params.date('endDate', ['dd-MMM-yyyy'])], [include: 'endDate'])
		// remove deleted entities. This relies on the cascade:"all-delete-orphan" setting in the respective Entity.
		productionInstance.roles.removeAll{ it.deleted }
		productionInstance.categories.removeAll{ it.deleted }
		productionInstance.portfolios.removeAll{ it.deleted }
        if (!productionInstance.save(flush: true)) {
            render(view: "edit", model: [productionInstance: productionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'production.label', default: 'Production'), productionInstance.id])
        redirect(action: "show", id: productionInstance.id)
    }

    def delete(Long id) {
        def productionInstance = Production.get(id)
        if (!productionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "list")
            return
        }

        try {
            productionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "show", id: id)
        }
    }
}
