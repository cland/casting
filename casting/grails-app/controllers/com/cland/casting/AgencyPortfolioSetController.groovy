package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException
import com.macrobit.grails.plugins.attachmentable.domains.Attachment; 
class AgencyPortfolioSetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [agencyPortfolioSetInstanceList: AgencyPortfolioSet.list(params), agencyPortfolioSetInstanceTotal: AgencyPortfolioSet.count()]
    }

    def create() {
		def profile = null
		if(params?.candidate?.id) profile = Candidate.get(params.candidate.id)
        [agencyPortfolioSetInstance: new AgencyPortfolioSet(params),candidateInstance:profile, isEditing:true, isNew:true]
    }

    def save() {
        def agencyPortfolioSetInstance = new AgencyPortfolioSet(params)
        if (!agencyPortfolioSetInstance.save(flush: true)) {
            render(view: "create", model: [agencyPortfolioSetInstance: agencyPortfolioSetInstance])
            return
        }
		attachUploadedFilesTo(agencyPortfolioSetInstance)
        flash.message = message(code: 'default.created.message', args: [message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet'), agencyPortfolioSetInstance.id])
        redirect(action: "show", id: agencyPortfolioSetInstance.id)
    }

    def show(Long id) {
        def agencyPortfolioSetInstance = AgencyPortfolioSet.get(id)
        if (!agencyPortfolioSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet'), id])
            redirect(action: "list")
            return
        }
		def profile = agencyPortfolioSetInstance?.candidate
        [agencyPortfolioSetInstance: agencyPortfolioSetInstance,candidateInstance:profile, isEditing:false, isNew:false]
    }

    def edit(Long id) {
        def agencyPortfolioSetInstance = AgencyPortfolioSet.get(id)
        if (!agencyPortfolioSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet'), id])
            redirect(action: "list")
            return
        }
		def profile = agencyPortfolioSetInstance?.candidate
		
		[agencyPortfolioSetInstance: agencyPortfolioSetInstance,candidateInstance:profile, isEditing:true, isNew:false]
   
    }

    def update(Long id, Long version) {
        def agencyPortfolioSetInstance = AgencyPortfolioSet.get(id)
        if (!agencyPortfolioSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (agencyPortfolioSetInstance.version > version) {
                agencyPortfolioSetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet')] as Object[],
                          "Another user has updated this AgencyPortfolioSet while you were editing")
                render(view: "edit", model: [agencyPortfolioSetInstance: agencyPortfolioSetInstance])
                return
            }
        }

        agencyPortfolioSetInstance.properties = params
		
        if (!agencyPortfolioSetInstance.save(flush: true)) {
            render(view: "edit", model: [agencyPortfolioSetInstance: agencyPortfolioSetInstance])
            return
        }
		attachUploadedFilesTo(agencyPortfolioSetInstance)
		
        flash.message = message(code: 'default.updated.message', args: [message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet'), agencyPortfolioSetInstance.id])
        redirect(action: "show", id: agencyPortfolioSetInstance.id)
    }

    def delete(Long id) {
        def agencyPortfolioSetInstance = AgencyPortfolioSet.get(id)
        if (!agencyPortfolioSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet'), id])
            redirect(action: "list")
            return
        }

        try {
            agencyPortfolioSetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet'), id])
            redirect(action: "show", id: id)
        }
    }
}