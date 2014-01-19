package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException
import com.macrobit.grails.plugins.attachmentable.domains.Attachment;
class DocumentController {
	def castingApiService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        [documentInstanceList: Document.list(params), documentInstanceTotal: Document.count()]
    }

    def create() {
        [documentInstance: new Document(params), isEditing:true, isNew:true]
    }

    def save() {
        def documentInstance = new Document(params)
        if (!documentInstance.save(flush: true)) {
            render(view: "create", model: [documentInstance: documentInstance])
            return
        }
		attachUploadedFilesTo(documentInstance)
        flash.message = message(code: 'default.created.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])
        redirect(action: "show", id: documentInstance.id)
    }

    def show(Long id) {
        def documentInstance = Document.get(id)
        if (!documentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
            return
        }

        [documentInstance: documentInstance, isEditing:false, isNew:false]
    }

    def edit(Long id) {
        def documentInstance = Document.get(id)
        if (!documentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
            return
        }

        [documentInstance: documentInstance, isEditing:true, isNew:false]
    }

    def update(Long id, Long version) {
        def documentInstance = Document.get(id)
        if (!documentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (documentInstance.version > version) {
                documentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'document.label', default: 'Document')] as Object[],
                          "Another user has updated this Document while you were editing")
                render(view: "edit", model: [documentInstance: documentInstance])
                return
            }
        }

        documentInstance.properties = params

        if (!documentInstance.save(flush: true)) {
            render(view: "edit", model: [documentInstance: documentInstance])
            return
        }
		attachUploadedFilesTo(documentInstance)
        flash.message = message(code: 'default.updated.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])
        redirect(action: "show", id: documentInstance.id)
    }

    def delete(Long id) {
        def documentInstance = Document.get(id)
        if (!documentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
            return
        }

        try {
            documentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "show", id: id)
        }
    }
}
