package com.cland.casting

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class OrganisationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		//def orglist = Organisation.list(params);
		int offset = 0	//some pagination calculated value here
		def orglist = Organisation.createCriteria().list (offset:offset,max:params.max){
			eq "type","Agency"
			order ('name','desc')
		}
        [organisationInstanceList: orglist, organisationInstanceTotal: Organisation.count()]
    }

    def create() {
        [organisationInstance: new Organisation(params)]
    }

    def save() {
        def organisationInstance = new Organisation(params)
        if (!organisationInstance.save(flush: true)) {
            render(view: "create", model: [organisationInstance: organisationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'organisation.label', default: 'Organisation'), organisationInstance.id])
        redirect(action: "show", id: organisationInstance.id)
    }

    def show(Long id) {
        def organisationInstance = Organisation.get(id)
        if (!organisationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organisation.label', default: 'Organisation'), id])
            redirect(action: "list")
            return
        }

        [organisationInstance: organisationInstance]
    }

    def edit(Long id) {
        def organisationInstance = Organisation.get(id)
        if (!organisationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organisation.label', default: 'Organisation'), id])
            redirect(action: "list")
            return
        }

        [organisationInstance: organisationInstance]
    }

    def update(Long id, Long version) {
        def organisationInstance = Organisation.get(id)
        if (!organisationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organisation.label', default: 'Organisation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (organisationInstance.version > version) {
                organisationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'organisation.label', default: 'Organisation')] as Object[],
                          "Another user has updated this Organisation while you were editing")
                render(view: "edit", model: [organisationInstance: organisationInstance])
                return
            }
        }

        organisationInstance.properties = params

        if (!organisationInstance.save(flush: true)) {
            render(view: "edit", model: [organisationInstance: organisationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'organisation.label', default: 'Organisation'), organisationInstance.id])
        redirect(action: "show", id: organisationInstance.id)
    }

    def delete(Long id) {
        def organisationInstance = Organisation.get(id)
        if (!organisationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organisation.label', default: 'Organisation'), id])
            redirect(action: "list")
            return
        }

        try {
            organisationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'organisation.label', default: 'Organisation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'organisation.label', default: 'Organisation'), id])
            redirect(action: "show", id: id)
        }
    }
	
	/** Custom functions **/

	def dialogcreate = {
		def organisationInstance = new Organisation()
		organisationInstance.properties = params
		return [organisationInstance: organisationInstance]
	}
	

	def dialogsave = {
		//println ("Saving...${params}");
		def message = ""
		def organisationInstance = new Organisation(params)
		if (!organisationInstance.save(flush: true)) {
			println organisationInstance.errors
		//	render(view: "create", model: [organisationInstance: organisationInstance])
		//	return
			message = "Error: " + organisationInstance.errors
			def response = [message:message,id:'nothing']
			render response as JSON
			return
		}
		
	//	flash.message = message(code: 'default.created.message', args: [message(code: 'organisationInstance.label', default: 'organisation'), organisationInstance.name])
	//	redirect(action: "show", id: organisationInstance.id)
		message = "success "
		def response = [message:message,id:organisationInstance.id]
		render response as JSON
	}
}
