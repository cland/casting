package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException

class CastingProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [castingProfileInstanceList: CastingProfile.list(params), castingProfileInstanceTotal: CastingProfile.count()]
    }

    def create() {
		def production = Production.get(params.production.id)
        [castingProfileInstance: new CastingProfile(params),productionInstance:production]
    }

    def save() {
        def castingProfileInstance = new CastingProfile(params)
        if (!castingProfileInstance.save(flush: true)) {
            render(view: "create", model: [castingProfileInstance: castingProfileInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), castingProfileInstance.id])
        redirect(action: "show", id: castingProfileInstance.id)
    }

    def show(Long id) {
        def castingProfileInstance = CastingProfile.get(id)
        if (!castingProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "list")
            return
        }

        [castingProfileInstance: castingProfileInstance]
    }

    def edit(Long id) {
        def castingProfileInstance = CastingProfile.get(id)
        if (!castingProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "list")
            return
        }

        [castingProfileInstance: castingProfileInstance]
    }

    def update(Long id, Long version) {
        def castingProfileInstance = CastingProfile.get(id)
        if (!castingProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (castingProfileInstance.version > version) {
                castingProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'castingProfile.label', default: 'CastingProfile')] as Object[],
                          "Another user has updated this CastingProfile while you were editing")
                render(view: "edit", model: [castingProfileInstance: castingProfileInstance])
                return
            }
        }

        castingProfileInstance.properties = params

        if (!castingProfileInstance.save(flush: true)) {
            render(view: "edit", model: [castingProfileInstance: castingProfileInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), castingProfileInstance.id])
        redirect(action: "show", id: castingProfileInstance.id)
    }

    def delete(Long id) {
        def castingProfileInstance = CastingProfile.get(id)
        if (!castingProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "list")
            return
        }

        try {
            castingProfileInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'castingProfile.label', default: 'CastingProfile'), id])
            redirect(action: "show", id: id)
        }
    }
}
