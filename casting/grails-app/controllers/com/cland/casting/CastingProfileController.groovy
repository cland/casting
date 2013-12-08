package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException

class CastingProfileController {
	def castingApiService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		if(!(params?.sort)) params.sort = "production.name"
        [castingProfileInstanceList: CastingProfile.list(params), castingProfileInstanceTotal: CastingProfile.count()]
    }

    def create() {
		def production = null //new Production(params)
		long productionId = 0
		long agencyId = 0
		int offset = 0
		int max = 100
		if(params?.production?.id) { 
			production = Production.get(params.production.id)
			productionId = production.id
		} 
		if(params?.agency?.id) agencyId = Agency.get(params.agency.id)?.id
		//work out the candidates list to present
		def candidateList = castingApiService.getCandidates(productionId, agencyId, offset, max) //Candidate.list();
        [castingProfileInstance: new CastingProfile(params),productionInstance:production,candidateList:candidateList, isEditing:true, isNew:true]
    }

    def save() {
        def castingProfileInstance = new CastingProfile(params)
		def production = null //new Production(params)
		long productionId = 0
		long agencyId = 0
		int offset = 0
		int max = 100
		if(params?.production?.id) {
			production = Production.get(params.production.id)
			productionId = production.id
		}
		if(params?.agency?.id) agencyId = Agency.get(params.agency.id)?.id
		//work out the candidates list to present
		def candidateList = castingApiService.getCandidates(productionId, agencyId, offset, max)
		
		bindData(castingProfileInstance, params, [exclude: 'auditionDate'])
		bindData(castingProfileInstance, params, [exclude: 'callbackDate'])
		bindData(castingProfileInstance, params, [exclude: 'castDate'])
		bindData(castingProfileInstance, ['auditionDate': params.date('auditionDate', ['dd-MMM-yyyy'])], [include: 'auditionDate'])
		bindData(castingProfileInstance, ['callbackDate': params.date('callbackDate', ['dd-MMM-yyyy'])], [include: 'callbackDate'])
		bindData(castingProfileInstance, ['castDate': params.date('castDate', ['dd-MMM-yyyy'])], [include: 'castDate'])
        if (!castingProfileInstance.save(flush: true)) {
            render(view: "create", model: [castingProfileInstance: castingProfileInstance,productionInstance:production,candidateList:candidateList, isEditing:true, isNew:true])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), castingProfileInstance.id])
        redirect(action: "show", id: castingProfileInstance.id)
    }

    def show(Long id) {
        def castingProfileInstance = CastingProfile.get(id)
        if (!castingProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "list")
            return
        }

        [castingProfileInstance: castingProfileInstance, isEditing:false, isNew:false]
    }

    def edit(Long id) {
        def castingProfileInstance = CastingProfile.get(id)
        if (!castingProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "list")
            return
        }
		def production = castingProfileInstance?.production
		long productionId = production?.id
		long agencyId = 0
		int offset = 0
		int max = 100

		//if(params?.agency?.id) agencyId = Agency.get(params.agency.id)?.id
		//work out the candidates list to present
		def candidateList = castingApiService.getCandidates(productionId, agencyId, offset, max)
        [castingProfileInstance: castingProfileInstance,productionInstance:production,candidateList:candidateList, isEditing:true, isNew:false]
    }

    def update(Long id, Long version) {
        def castingProfileInstance = CastingProfile.get(id)		
        if (!castingProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (castingProfileInstance.version > version) {
                castingProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'castingProfile.label', default: 'CastingProfile')] as Object[],
                          "Another user has updated this CastingProfile while you were editing")
                render(view: "edit", model: [castingProfileInstance: castingProfileInstance])
                return
            }
        }

        castingProfileInstance.properties = params
		bindData(castingProfileInstance, params, [exclude: 'auditionDate'])
		bindData(castingProfileInstance, params, [exclude: 'callbackDate'])
		bindData(castingProfileInstance, params, [exclude: 'castDate'])
		bindData(castingProfileInstance, ['auditionDate': params.date('auditionDate', ['dd-MMM-yyyy'])], [include: 'auditionDate'])
		bindData(castingProfileInstance, ['callbackDate': params.date('callbackDate', ['dd-MMM-yyyy'])], [include: 'callbackDate'])
		bindData(castingProfileInstance, ['castDate': params.date('castDate', ['dd-MMM-yyyy'])], [include: 'castDate'])
		// remove deleted entities. This relies on the cascade:"all-delete-orphan" setting in the respective Entity.
		castingProfileInstance.ratings.removeAll{ it.deleted }
        if (!castingProfileInstance.save(flush: true)) {
            render(view: "edit", model: [castingProfileInstance: castingProfileInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), castingProfileInstance.id])
        redirect(action: "show", id: castingProfileInstance.id)
    }

    def delete(Long id) {
        def castingProfileInstance = CastingProfile.get(id)
        if (!castingProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "list")
            return
        }

        try {
            castingProfileInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "show", id: id)
        }
    }
}
