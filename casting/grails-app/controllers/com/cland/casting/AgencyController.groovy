package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException

class AgencyController {
	def castingApiService
	def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
		params.sort = (params?.sort ? params?.sort : 'company')
		params.order = (params?.order ? params?.order : 'desc')
		
        [agencyInstanceList: Agency.list(params), agencyInstanceTotal: Agency.count()] 		
    }

    def create() {
		List <String> rolenames = [SystemRoles.ROLE_AGENT.value]
		def userList = castingApiService.getUsersWithRole(rolenames)
        [agencyInstance: new Agency(params), isEditing:true, isNew:true,agencyList:userList]
    }

    def save() {
        def agencyInstance = new Agency(params)
		if(!params.company.id){
			if(params.company.id == ""){
				if(!agencyInstance.company.save(flush:true)){
					println("Failed to save new organisation/company..."  + agencyInstance.company?.errors)
					render(view: "create", model: [clientInstance: agencyInstance])
					return
				}
			}
		}
        if (!agencyInstance.save(flush: true)) {
            render(view: "create", model: [agencyInstance: agencyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'agency.label', default: 'Agency'), agencyInstance])
        redirect(action: "show", id: agencyInstance.id)
    }

    def show(Long id) {
        def agencyInstance = Agency.get(id)
        if (!agencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agency.label', default: 'Agency'), id])
            redirect(action: "list")
            return
        }
		//fetch the productions that this agency is allowed to view
		def productionList = castingApiService.getProductions(id, 1, 100)
		
        [agencyInstance: agencyInstance,productionList:productionList]
    }

    def edit(Long id) {
        def agencyInstance = Agency.get(id)
        if (!agencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agency.label', default: 'Agency'), id])
            redirect(action: "list")
            return
        }
		List <String> rolenames = [SystemRoles.ROLE_AGENT.value]
		def userList = castingApiService.getUsersWithRole(rolenames)
		
        [agencyInstance: agencyInstance, isEditing:true, isNew:false,agencyList:userList]
    }

    def update(Long id, Long version) {
        def agencyInstance = Agency.get(id)
        if (!agencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agency.label', default: 'Agency'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (agencyInstance.version > version) {
                agencyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'agency.label', default: 'Agency')] as Object[],
                          "Another user has updated this Agency while you were editing")
                render(view: "edit", model: [agencyInstance: agencyInstance])
                return
            }
        }

        agencyInstance.properties = params
		if(!params.company.id){
			if(params.company.id == ""){
				if(!agencyInstance.company.save(flush:true)){
					println("Failed to save new organisation/company..."  + agencyInstance.company?.errors)
					render(view: "create", model: [clientInstance: agencyInstance])
					return
				}
			}
		}
        if (!agencyInstance.save(flush: true)) {
            render(view: "edit", model: [agencyInstance: agencyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'agency.label', default: 'Agency'), agencyInstance])
        redirect(action: "show", id: agencyInstance.id)
    }

    def delete(Long id) {
        def agencyInstance = Agency.get(id)
        if (!agencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agency.label', default: 'Agency'), id])
            redirect(action: "list")
            return
        }

        try {
            agencyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'agency.label', default: 'Agency'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'agency.label', default: 'Agency'), id])
            redirect(action: "show", id: id)
        }
    }
}
