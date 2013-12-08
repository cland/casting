package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException
import com.macrobit.grails.plugins.attachmentable.domains.Attachment;

class PictureSetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pictureSetInstanceList: PictureSet.list(params), pictureSetInstanceTotal: PictureSet.count()]
    }

    def create() {
		def profile = null
		if(params?.castingProfile?.id) profile = CastingProfile.get(params.castingProfile.id)
        [pictureSetInstance: new PictureSet(params),castingProfileInstance:profile, isEditing:true, isNew:true]
    }

    def save() {
        def pictureSetInstance = new PictureSet(params)
        if (!pictureSetInstance.save(flush: true)) {
            render(view: "create", model: [pictureSetInstance: pictureSetInstance])
            return
        }
		attachUploadedFilesTo(pictureSetInstance)
		//println("saved! ${videoSetInstance.totalAttachments}" )
        flash.message = message(code: 'default.created.message', args: [message(code: 'pictureSet.label', default: 'PictureSet'), pictureSetInstance.id])
        redirect(action: "show", id: pictureSetInstance.id)
    }

    def show(Long id) {
        def pictureSetInstance = PictureSet.get(id)
        if (!pictureSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pictureSet.label', default: 'PictureSet'), id])
            redirect(action: "list")
            return
        }

        [pictureSetInstance: pictureSetInstance,castingProfileInstance:pictureSetInstance?.castingProfile,, isEditing:false, isNew:false]
    }

    def edit(Long id) {
        def pictureSetInstance = PictureSet.get(id)
        if (!pictureSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pictureSet.label', default: 'PictureSet'), id])
            redirect(action: "list")
            return
        }
		def profile = pictureSetInstance?.castingProfile
		
        [pictureSetInstance: pictureSetInstance,castingProfileInstance:profile, isEditing:true, isNew:false]
    }

    def update(Long id, Long version) {
        def pictureSetInstance = PictureSet.get(id)
        if (!pictureSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pictureSet.label', default: 'PictureSet'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pictureSetInstance.version > version) {
                pictureSetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pictureSet.label', default: 'PictureSet')] as Object[],
                          "Another user has updated this PictureSet while you were editing")
                render(view: "edit", model: [pictureSetInstance: pictureSetInstance])
                return
            }
        }

        pictureSetInstance.properties = params

        if (!pictureSetInstance.save(flush: true)) {
            render(view: "edit", model: [pictureSetInstance: pictureSetInstance])
            return
        }
		attachUploadedFilesTo(pictureSetInstance)
        flash.message = message(code: 'default.updated.message', args: [message(code: 'pictureSet.label', default: 'PictureSet'), pictureSetInstance.id])
        redirect(action: "show", id: pictureSetInstance.id)
    }

    def delete(Long id) {
        def pictureSetInstance = PictureSet.get(id)
        if (!pictureSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pictureSet.label', default: 'PictureSet'), id])
            redirect(action: "list")
            return
        }

        try {
            pictureSetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pictureSet.label', default: 'PictureSet'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pictureSet.label', default: 'PictureSet'), id])
            redirect(action: "show", id: id)
        }
    }
}
