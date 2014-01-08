package com.cland.casting
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
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
        flash.message = message(code: 'default.created.message', args: [message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet'), agencyPortfolioSetInstance])
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
		
        flash.message = message(code: 'default.updated.message', args: [message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet'), agencyPortfolioSetInstance])
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
	
	def downloadPortfolioZip(Long id){
		
		def portfolioInstance = AgencyPortfolioSet.get(id)

		
		response.setContentType("APPLICATION/OCTET-STREAM")
		response.setHeader('Content-Disposition', 'Attachmet;Filename="portfolio_' + portfolioInstance?.name?.toLowerCase() + '.zip"')
		ZipOutputStream zip = new ZipOutputStream(response.outputStream)
		
		//add data
		if(portfolioInstance){
			//get the attachments
			//def attachments = portfolioInstance.attachments
			def pictures = portfolioInstance.attachments //portfolioInstance.getAttachments('pictures')	
			pictures?.each{pic ->
				def fileEntry = new ZipEntry(pic.getFilename())
				zip.putNextEntry(fileEntry)
				def file = new File(pic.getPath())
				def data = "Data for: " + pic.getFilename() + " - " + pic.getNiceLength()
				zip.write(file.bytes)
				println("Added: " + pic.getPath())  //full path to the file on disk. need to read this file. :)
			}
		}
//		def file1Entry = new ZipEntry('first_file1.txt') //open a file
//		zip.putNextEntry(file1Entry)	//add it to zip
//		zip.write("This is the content of the first file".bytes) //write the data
//		
//		def file2Entry = new ZipEntry('first_file2.txt')
//		zip.putNextEntry(file2Entry)
//		zip.write("This is the content of the second file".bytes)
		zip.close()
	} //end downloadPortfolioZip
	
} //end class
