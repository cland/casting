package com.cland.casting

import java.util.List;
import com.macrobit.grails.plugins.attachmentable.domains.Attachment;
import org.springframework.dao.DataIntegrityViolationException

class UserController {
	def castingApiService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params), isEditing:true, isNew:true]
    }

    def save() {
        def userInstance = new User(params)
		bindData(userInstance, params, [exclude: 'dateOfBirth'])
		bindData(userInstance, ['dateOfBirth': params.date('dateOfBirth', ['dd-MMM-yyyy'])], [include: 'dateOfBirth'])
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }
		
		//update the roles here
		castingApiService.updateRoles(userInstance, params)
//		UserRole.removeAll(userInstance)
//		def roles = Role.list()
//		for(Role r : roles){
//			def tmp = params.list("role_${r.authority}")
//			if (tmp[0]) UserRole.create(userInstance, r, true)
//		}
		attachUploadedFilesTo(userInstance)
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance])
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
		//get the roles
		def roleMap = userInstance.getAuthorities()
		[userInstance: userInstance,roleMap:roleMap,clientList:castingApiService.getClientListForUser(id, 0,100),agencyList:castingApiService.getAgencyListForUser(id, 0, 100), isEditing:false, isNew:false]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
		//get the roles
		def roleMap = userInstance.getAuthorities()
        [userInstance: userInstance,roleMap:roleMap, isEditing:true, isNew:false]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params
		bindData(userInstance, params, [exclude: 'dateOfBirth'])
		bindData(userInstance, ['dateOfBirth': params.date('dateOfBirth', ['dd-MMM-yyyy'])], [include: 'dateOfBirth'])

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }
		//update the roles here
		castingApiService.updateRoles(userInstance, params)
//		UserRole.removeAll(userInstance)
//		def roles = Role.list()
//		for(Role r : roles){
//			def tmp = params.list("role_${r.authority}")
//			if (tmp[0]) UserRole.create(userInstance, r, true)
//		}
		attachUploadedFilesTo(userInstance)
        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
	/** Custom functions **/
	List getOrgs (){
		return Organisation.list()
	}
	def orgOptions(){
		def orgs = getOrgs()
		String options = "<option value='9999'>My Value</option>"
		for(Organisation org: orgs){
			options += "<option value='${org.id}'>${org.name}</option>"
		}
		render options
	}
} //end class
