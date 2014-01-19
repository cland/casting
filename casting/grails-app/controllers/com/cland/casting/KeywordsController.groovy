package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException
import com.macrobit.grails.plugins.attachmentable.domains.Attachment;
class KeywordsController {
	def castingApiService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        [keywordsInstanceList: Keywords.list(params), keywordsInstanceTotal: Keywords.count()]
    }

    def create() {
        [keywordsInstance: new Keywords(params), isEditing:true, isNew:true]
    }

    def save() {
        def keywordsInstance = new Keywords(params)
        if (!keywordsInstance.save(flush: true)) {
            render(view: "create", model: [keywordsInstance: keywordsInstance])
            return
        }
		attachUploadedFilesTo(keywordsInstance)
        flash.message = message(code: 'default.created.message', args: [message(code: 'keywords.label', default: 'Keywords'), keywordsInstance.id])
        redirect(action: "show", id: keywordsInstance.id)
    }

    def show(Long id) {
        def keywordsInstance = Keywords.get(id)
        if (!keywordsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keywords.label', default: 'Keywords'), id])
            redirect(action: "list")
            return
        }

        [keywordsInstance: keywordsInstance, isEditing:false, isNew:false]
    }

    def edit(Long id) {
        def keywordsInstance = Keywords.get(id)
        if (!keywordsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keywords.label', default: 'Keywords'), id])
            redirect(action: "list")
            return
        }

        [keywordsInstance: keywordsInstance, isEditing:true, isNew:false]
    }

    def update(Long id, Long version) {
        def keywordsInstance = Keywords.get(id)
        if (!keywordsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keywords.label', default: 'Keywords'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (keywordsInstance.version > version) {
                keywordsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'keywords.label', default: 'Keywords')] as Object[],
                          "Another user has updated this Keywords while you were editing")
                render(view: "edit", model: [keywordsInstance: keywordsInstance])
                return
            }
        }

        keywordsInstance.properties = params

        if (!keywordsInstance.save(flush: true)) {
            render(view: "edit", model: [keywordsInstance: keywordsInstance])
            return
        }
		keywordsInstance
        flash.message = message(code: 'default.updated.message', args: [message(code: 'keywords.label', default: 'Keywords'), keywordsInstance.id])
        redirect(action: "show", id: keywordsInstance.id)
    }

    def delete(Long id) {
        def keywordsInstance = Keywords.get(id)
        if (!keywordsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'keywords.label', default: 'Keywords'), id])
            redirect(action: "list")
            return
        }

        try {
            keywordsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'keywords.label', default: 'Keywords'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'keywords.label', default: 'Keywords'), id])
            redirect(action: "show", id: id)
        }
    }
}
