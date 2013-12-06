package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException
import com.macrobit.grails.plugins.attachmentable.domains.Attachment;
class VideoSetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [videoSetInstanceList: VideoSet.list(params), videoSetInstanceTotal: VideoSet.count()]
    }

    def create() {
		def profile = null
		if(params?.castingProfile?.id) profile = CastingProfile.get(params.castingProfile.id)
        [videoSetInstance: new VideoSet(params),castingProfileInstance:profile]
    }

    def save() {
		
        def videoSetInstance = new VideoSet(params)
        if (!videoSetInstance.save(flush: true)) {
            render(view: "create", model: [videoSetInstance: videoSetInstance])
            return
        }
		attachUploadedFilesTo(videoSetInstance)
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'videoSet.label', default: 'VideoSet'), videoSetInstance.id])
        redirect(action: "show", id: videoSetInstance.id)
    }

    def show(Long id) {
        def videoSetInstance = VideoSet.get(id)
        if (!videoSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'videoSet.label', default: 'VideoSet'), id])
            redirect(action: "list")
            return
        }

        [videoSetInstance: videoSetInstance,castingProfileInstance:videoSetInstance?.castingProfile]
    }

    def edit(Long id) {
        def videoSetInstance = VideoSet.get(id)
        if (!videoSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'videoSet.label', default: 'VideoSet'), id])
            redirect(action: "list")
            return
        }
		def profile = videoSetInstance?.castingProfile
        [videoSetInstance: videoSetInstance,castingProfileInstance:profile]
    }

    def update(Long id, Long version) {
		
        def videoSetInstance = VideoSet.get(id)
        if (!videoSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'videoSet.label', default: 'VideoSet'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (videoSetInstance.version > version) {
                videoSetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'videoSet.label', default: 'VideoSet')] as Object[],
                          "Another user has updated this VideoSet while you were editing")
                render(view: "edit", model: [videoSetInstance: videoSetInstance])
                return
            }
        }

        videoSetInstance.properties = params

        if (!videoSetInstance.save(flush: true)) {
            render(view: "edit", model: [videoSetInstance: videoSetInstance])
            return
        }
		attachUploadedFilesTo(videoSetInstance)
        flash.message = message(code: 'default.updated.message', args: [message(code: 'videoSet.label', default: 'VideoSet'), videoSetInstance.id])
        redirect(action: "show", id: videoSetInstance.id)
    }

    def delete(Long id) {
        def videoSetInstance = VideoSet.get(id)
        if (!videoSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'videoSet.label', default: 'VideoSet'), id])
            redirect(action: "list")
            return
        }

        try {
            videoSetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'videoSet.label', default: 'VideoSet'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'videoSet.label', default: 'VideoSet'), id])
            redirect(action: "show", id: id)
        }
    }
}
