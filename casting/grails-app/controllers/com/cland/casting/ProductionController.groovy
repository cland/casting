package com.cland.casting

import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import org.springframework.dao.DataIntegrityViolationException

class ProductionController {
	def castingApiService
	def castingMailService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
		def productions = castingApiService.getProductions(0, 0, params.max)
        [productionInstanceList: productions, productionInstanceTotal: productions.size()]
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
		bindData(productionInstance, params, [exclude: 'startDate'])
		bindData(productionInstance, ['startDate': params.date('startDate', ['dd-MMM-yyyy'])], [include: 'startDate'])
		bindData(productionInstance, params, [exclude: 'endDate'])
		bindData(productionInstance, ['endDate': params.date('endDate', ['dd-MMM-yyyy'])], [include: 'endDate'])
		
		productionInstance = productionInstance.merge()
		try{
        if (!productionInstance.save(flush: true)) {
            render(view: "create", model: [productionInstance: productionInstance])
            return
        }
		}catch (Exception ex){
			ex.printStackTrace()
			flash.message = ex.getMessage()
			render(view: "create", model: [productionInstance: productionInstance])
			return
		}

		//send notification
		if(params?.notify){
		//	castingMailService.sendProductionMail(productionInstance)
		}
        flash.message = message(code: 'default.created.message', args: [message(code: 'production.label', default: 'Production'), productionInstance.name])
        redirect(action: "show", id: productionInstance.id)
    }

    def show(Long id) {
        def productionInstance = Production.get(id)
        if (!productionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "list")
            return
        }

		def auditionProfiles = [:]	//productionInstance?.profiles?.sort{it.castNo} 
		def shortlistProfiles = [:]	//productionInstance?.profiles?.findAll{it.isShortlist}
		def finalProfiles = [:]	//productionInstance?.profiles?.findAll{it?.isConfirmed} //outcome?.equalsIgnoreCase("selected")}
		def rolesList = castingApiService.getAllowedRoles(productionInstance,0) // productionInstance?.roles
		def portfolioList = castingApiService.getPortfoliosAllowed(productionInstance)
	
		def productionDates = castingApiService.getProductionDates(productionInstance)
		
		
        [productionInstance: productionInstance,auditionProfiles:auditionProfiles,shortlistProfiles:shortlistProfiles,finalProfiles:finalProfiles,productionDates:productionDates,rolesList:rolesList,portfolioList:portfolioList, isEditing:false, isNew:false]
    }

    def edit(Long id) {
        def productionInstance = Production.get(id)
        if (!productionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "list")
            return
        }
		def rolesList = castingApiService.getAllowedRoles(productionInstance,0) 
		def productionDates = castingApiService.getProductionDates(productionInstance)
        [productionInstance: productionInstance,productionDates:productionDates,rolesList:rolesList, isEditing:true, isNew:false]
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

        flash.message = message(code: 'default.updated.message', args: [message(code: 'production.label', default: 'Production'), productionInstance.name])
        redirect(action: "show", id: productionInstance.id)
    }

    def delete(Long id) {
        def productionInstance = Production.get(id)
		def name = productionInstance?.getName()
        if (!productionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'production.label', default: 'Production'), name])
            redirect(action: "list")
            return
        }

        try {
            productionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'production.label', default: 'Production'), name])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'production.label', default: 'Production'), name])
            redirect(action: "show", id: id)
        }
    }
	
	/**
	 * Custom functions
	 */

	def filter(Integer max){	
		def productionId = params?.production?.id?.toLong()
		//int offset = 0
		params.max = Math.min(max ?: 50, 100)
		def viewas = params?.viewas 
		def stage = params?.stage
		
		def profiles = castingApiService.profileFilter(productionId, params)
		[profileList:profiles,viewas:viewas,sortby:params?.sortby,max:params?.max,offset:params?.offset,stage:stage,productionId:productionId]
	} //end 
	
	def update_profiles(){
		//println(params)
		def productionId = params?.production?.id?.toLong()		
		def viewas = params?.viewas ? params.viewas : "headshots"
		def sortby = params?.sortby ? params.sortby : "castno"
		def stage = "stage" + params?.stage
		//get the list of profiles submitted
		List profiles = []
		params?.profiles?.each {entry ->					
			def tmp = CastingProfile.get(entry.toLong())
			def values = [:]  //  [:].withDefault { [] }
			if(tmp){
				
				//progress status params
				def isInvited = params?.boolean("invited_${entry.toLong()}")
				if(params?.list("invited_${entry.toLong()}")){
					values += [isInvited:isInvited]
				}
				def shortlist = params?.boolean("shortlist_${entry.toLong()}")
				
				if(params?.list("shortlist_${entry.toLong()}")){
					values += [isShortlist:shortlist]
				}
				def isConfirmed = params?.boolean("confirmed_${entry.toLong()}")
				if(params?.list("confirmed_${entry.toLong()}")){
					values += [isConfirmed:isConfirmed]
				}
				//availability params
				def isAudition = params?.boolean("audition_${entry.toLong()}")
				if(params?.list("audition_${entry.toLong()}")){
					values += [isAuditionAvailable:isAudition]
				}
				def isCallback = params?.boolean("callback_${entry.toLong()}")
				if(params?.list("callback_${entry.toLong()}")){
					values += [isCallbackAvailable:isCallback]
				}
				def isWardrobe = params?.boolean("wardrobe_${entry.toLong()}")
				if(params?.list("wardrobe_${entry.toLong()}")){
					values += [isWardrobeAvailable:isWardrobe]
				}
				def isShoot = params?.boolean("shoot_${entry.toLong()}")
				if(params?.list("shoot_${entry.toLong()}")){
					values += [isRoleAvailable:isShoot]
				}
				//attendance params
				def isAuditionAtt = params?.boolean("audition_attended_${entry.toLong()}")
				if(params?.list("audition_attended_${entry.toLong()}")){
					values += [isAuditionAttended:isAuditionAtt]
				}
				def isCallbackAtt = params?.boolean("callback_attended_${entry.toLong()}")
				if(params?.list("callback_attended_${entry.toLong()}")){
					values += [isCallbackAttended:isCallbackAtt]
				}
				def isWardrobeAtt = params?.boolean("wardrobe_attended_${entry.toLong()}")
				if(params?.list("wardrobe_attended_${entry.toLong()}")){
					values += [isWardrobeAttended:isWardrobeAtt]
				}
				def isShootAtt = params?.boolean("shoot_attended_${entry.toLong()}")
				if(params?.list("shoot_attended_${entry.toLong()}")){
					values += [isRoleAttended:isShootAtt]
				}
				//save updates
				if(!values.isEmpty()){
					tmp.properties = values //[isAuditionAvailable:val]
					if(!tmp.save(flush:true)){
						//failed to update profile
						tmp.errors
					}
				}
				profiles.add(tmp)
			}
		}  //end for each profile submitted	
		render (view:"filter", model:[profileList:profiles,viewas:viewas,sortby:params?.sortby,max:params?.max,offset:params?.offset,stage:stage,productionId:productionId])
	} //end def update_stage1()
	def downloadProfilesZip(Long id){
		def productionInstance = Production.get(params?.prod_id)
		
		def profiles = params?.profiles //?.replace("[", "")?.replace("]", "")?.split(",")
		def portfolioInstance = Portfolio.get(params?.portfolioId)
		def portfolioName = ""
		if (portfolioInstance){
			portfolioName = portfolioInstance?.name
		}
		def message = ""
		String zipFilename = ""
		if(profiles){
			//Initialize zip variables
			if(!portfolioName.equals("")){
				zipFilename = productionInstance?.name?.toLowerCase() + "-" + portfolioName + ".zip"
			}else{
				zipFilename = productionInstance?.name?.toLowerCase() + ".zip"
			}
			response.setContentType("APPLICATION/OCTET-STREAM")
			response.setHeader('Content-Disposition', 'Attachmet;Filename="' +  zipFilename + '"')
			ZipOutputStream zip = new ZipOutputStream(response.outputStream)
			try{		
				//get the list of profiles submitted		
				profiles?.each {entry ->
					def castingProfileInstance = CastingProfile.get(entry.toLong())
					def values = [:]  //  [:].withDefault { [] }
					if(castingProfileInstance){
						//get the videos and pics and add to zip
						def zipfolder = "castno-" + castingProfileInstance?.castNo + "_" + castingProfileInstance?.name + "_id-" + castingProfileInstance?.id + "/"
											
						def pictures = castingProfileInstance?.pictures?.attachments
						pictures?.each{att ->							
							def diskFilename = att.getPath().tokenize('\\').last().toString()
							diskFilename = diskFilename.substring(0,diskFilename.indexOf("."))							
							def fileEntry = new ZipEntry(zipfolder + diskFilename + "_" + att.getFilename())
							zip.putNextEntry(fileEntry)
							def file = new File(att.getPath())							
							zip.write(file.bytes)							
						}	
						
						//add videos
						def videos = castingProfileInstance?.videos?.attachments
						videos?.each{att ->							
							def diskFilename = att.getPath().tokenize('\\').last().toString()
							diskFilename = diskFilename.substring(0,diskFilename.indexOf("."))							
							def fileEntry = new ZipEntry(zipfolder + diskFilename + "_" + att.getFilename())
							zip.putNextEntry(fileEntry)
							def file = new File(att.getPath())
							zip.write(file.bytes)							
						}
						
						//close the folder for this castingProfileInstance
						zip.closeEntry()
					} //end if castingProfileInstance
				}  //end for each profile submitted
			
				zip.close()
			}catch(Exception e){
				message = "Failed to download zip: " + e.getMessage()
			}finally{				
				if(!zip.closed) zip.close()
			}
		}else {
			//No profiles to download
			message = "No profiles found to download!"
		}
	//	render (view:"filter", model:[profileList:profiles,viewas:viewas,sortby:params?.sortby,max:params?.max,offset:params?.offset,stage:stage,message:message])
	} //end functin downloadProfilesZip
	
	
	def dialogfilter(Long id){
		def productionInstance = Production.get(id)
		//get all the filter params and tab where we are coming from
		[productionInstance: productionInstance]
	}
} //End class
