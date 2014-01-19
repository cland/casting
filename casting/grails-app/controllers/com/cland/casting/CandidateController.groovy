package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException
import com.macrobit.grails.plugins.attachmentable.domains.Attachment;

class CandidateController {
	def castingApiService
	def searchableService
	//def pdfRenderingService
	def exportService
	def grailsApplication  //inject GrailsApplication
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
		def candidates = castingApiService.getCandidates(0, 0,true, params)
		def total = castingApiService.getCandidatesCount(0, 0, true, params)
		
		//** un-comment code below if we want make use of the export-1.5 plugin to export data.
//		if(params?.format && params.format != "html"){ 
//			response.contentType = grailsApplication.config.grails.mime.types[params.format] 
//			response.setHeader("Content-disposition", "attachment; filename=candidates.${params.extension}")		
//			List fields = ["person.firstLastName", "clothing"]
//			Map labels = ["person.firstLastName": "Candidate", "clothing": "Clothing"]
//			exportService.export(params.format, response.outputStream,candidates, fields, labels,[:],[:]) 
//		}
		
        [candidateInstanceList: candidates, candidateInstanceTotal: total]
    }

    def create() {
		def agency = null 
		if(params?.agency?.id) agency = Agency.get(params.agency.id)
		[candidateInstance: new Candidate(params),agencyInstance:agency, isEditing:true, isNew:true]

    }

    def save() {
		def candidateInstance = new Candidate(params)
		bindData(candidateInstance, params, [exclude: 'person.dateOfBirth'])
		bindData(candidateInstance, ['person.dateOfBirth': params.date('person.dateOfBirth', ['dd-MMM-yyyy'])], [include: 'person.dateOfBirth'])
		
		candidateInstance.person.properties = params
		if(!candidateInstance.person.save(flush:true)){
			println("Failed to save new person..."  + candidateInstance.person?.errors)
		}else {
			candidateInstance = candidateInstance.merge()
		}
		
        if (!candidateInstance.save(flush: true)) {
            render(view: "create", model: [candidateInstance: candidateInstance])
            return
        }
		attachUploadedFilesTo(candidateInstance)
        flash.message = message(code: 'default.created.message', args: [message(code: 'candidate.label', default: 'Candidate'), candidateInstance.toSummary()])
        redirect(action: "show", id:  candidateInstance.id)
    }

    def show(Long id) {
        def candidateInstance = Candidate.get(id)
        if (!candidateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "list")
            return
        }

		//workout the profiles list
		def profiles = castingApiService.getProfiles(0, id, 0, 100)
        [candidateInstance: candidateInstance,profileList:profiles, isEditing:false, isNew:false]
    }

    def edit(Long id) {
        def candidateInstance = Candidate.get(id)
        if (!candidateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "list")
            return
        }

        [candidateInstance: candidateInstance,agencyInstance:candidateInstance.agency,isEditing:true, isNew:false]
    }

    def update(Long id, Long version) {
        def candidateInstance = Candidate.get(id)
        if (!candidateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (candidateInstance.version > version) {
                candidateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'candidate.label', default: 'Candidate')] as Object[],
                          "Another user has updated this Candidate while you were editing")
                render(view: "edit", model: [candidateInstance: candidateInstance])
                return
            }
        }

        candidateInstance.properties = params
		bindData(candidateInstance, params, [exclude: 'person.dateOfBirth'])
		bindData(candidateInstance, ['person.dateOfBirth': params.date('person.dateOfBirth', ['dd-MMM-yyyy'])], [include: 'person.dateOfBirth'])
        if (!candidateInstance.save(flush: true)) {
            render(view: "edit", model: [candidateInstance: candidateInstance])
            return
        }
		attachUploadedFilesTo(candidateInstance)
        flash.message = message(code: 'default.updated.message', args: [message(code: 'candidate.label', default: 'Candidate'),candidateInstance.toSummary()])
        redirect(action: "show", id:  candidateInstance.id)
    }

    def delete(Long id) {
        def candidateInstance = Candidate.get(id)
        if (!candidateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "list")
            return
        }

        try {
            candidateInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'candidate.label', default: 'Candidate'), id])
            redirect(action: "show", id: id)
        }
    }
	
	/** Custom functions **/
	
	def search = {
		flash.message = "Search results for: ${params.q}"
		println(params)
		def resultsMap = Candidate.search(params.q, params) //
		render(view:'list',	model:[	candidateInstanceList:resultsMap.results,candidateInstanceTotal:Candidate.countHits(params.q)]
		)
	} //end search method
//	def renderFormPDF(){
//		//compile ":rendering:0.4.4"
//		def formInstance = Candidate.get(params.id)
//		def args = [template:"pdf", model:[form:formInstance]]
//		pdfRenderingService.render(args+[controller:this],response)
//	}
} //end class

//	REMOVED SECTION FROM SAVE() ACTION
//		if(!params.person.id){
//			if(params.person.id == ""){
//				if(!candidateInstance.person.save(flush:true)){
//					println("Failed to save new person..."  + candidateInstance.person?.errors)
//					render(view: "create", model: [candidateInstance: candidateInstance])
//					return
//				}else{
//					println("Person ID: " + candidateInstance?.person?.id)
//					//params.person.id = candidateInstance?.person?.id
//				}
//			}
//		}