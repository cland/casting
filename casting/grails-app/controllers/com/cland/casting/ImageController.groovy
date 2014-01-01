package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException
import com.macrobit.grails.plugins.attachmentable.domains.Attachment;
class ImageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [imageInstanceList: Image.list(params), imageInstanceTotal: Image.count()]
    }

    def create() {
        [imageInstance: new Image(params), isEditing:true, isNew:true]
    }

    def save() {
        def imageInstance = new Image(params)
        if (!imageInstance.save(flush: true)) {
            render(view: "create", model: [imageInstance: imageInstance])
            return
        }
		attachUploadedFilesTo(imageInstance)
        flash.message = message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), imageInstance.id])
        redirect(action: "show", id: imageInstance.id)
    }

    def show(Long id) {
        def imageInstance = Image.get(id)
        if (!imageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "list")
            return
        }

        [imageInstance: imageInstance, isEditing:false, isNew:false]
    }

    def edit(Long id) {
	
        def imageInstance = Image.get(id)
        if (!imageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "list")
            return
        }

        [imageInstance: imageInstance, isEditing:true, isNew:false]
    }

    def update(Long id, Long version) {
		println(params)
        def imageInstance = Image.get(id)
        if (!imageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "list")
            return
        }
		if(params?.locations){
			params.locations.each{location ->
				imageInstance.addToLocations(location)
			}
		}
        if (version != null) {
            if (imageInstance.version > version) {
                imageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'image.label', default: 'Image')] as Object[],
                          "Another user has updated this Image while you were editing")
                render(view: "edit", model: [imageInstance: imageInstance])
                return
            }
        }

        imageInstance.properties = params

        if (!imageInstance.save(flush: true)) {
            render(view: "edit", model: [imageInstance: imageInstance])
            return
        }
		attachUploadedFilesTo(imageInstance)
        flash.message = message(code: 'default.updated.message', args: [message(code: 'image.label', default: 'Image'), imageInstance.id])
        redirect(action: "show", id: imageInstance.id)
    }

    def delete(Long id) {
        def imageInstance = Image.get(id)
        if (!imageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "list")
            return
        }

        try {
            imageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'image.label', default: 'Image'), id])
            redirect(action: "show", id: id)
        }
    }
}
