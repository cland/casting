package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException

class CastingCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        [castingCategoryInstanceList: CastingCategory.list(params), castingCategoryInstanceTotal: CastingCategory.count()]
    }

    def create() {
        [castingCategoryInstance: new CastingCategory(params)]
    }

    def save() {
        def castingCategoryInstance = new CastingCategory(params)
        if (!castingCategoryInstance.save(flush: true)) {
            render(view: "create", model: [castingCategoryInstance: castingCategoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'castingCategory.label', default: 'CastingCategory'), castingCategoryInstance.id])
        redirect(action: "show", id: castingCategoryInstance.id)
    }

    def show(Long id) {
        def castingCategoryInstance = CastingCategory.get(id)
        if (!castingCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingCategory.label', default: 'CastingCategory'), id])
            redirect(action: "list")
            return
        }

        [castingCategoryInstance: castingCategoryInstance]
    }

    def edit(Long id) {
        def castingCategoryInstance = CastingCategory.get(id)
        if (!castingCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingCategory.label', default: 'CastingCategory'), id])
            redirect(action: "list")
            return
        }

        [castingCategoryInstance: castingCategoryInstance]
    }

    def update(Long id, Long version) {
        def castingCategoryInstance = CastingCategory.get(id)
        if (!castingCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingCategory.label', default: 'CastingCategory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (castingCategoryInstance.version > version) {
                castingCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'castingCategory.label', default: 'CastingCategory')] as Object[],
                          "Another user has updated this CastingCategory while you were editing")
                render(view: "edit", model: [castingCategoryInstance: castingCategoryInstance])
                return
            }
        }

        castingCategoryInstance.properties = params

        if (!castingCategoryInstance.save(flush: true)) {
            render(view: "edit", model: [castingCategoryInstance: castingCategoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'castingCategory.label', default: 'CastingCategory'), castingCategoryInstance.id])
        redirect(action: "show", id: castingCategoryInstance.id)
    }

    def delete(Long id) {
        def castingCategoryInstance = CastingCategory.get(id)
        if (!castingCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingCategory.label', default: 'CastingCategory'), id])
            redirect(action: "list")
            return
        }

        try {
            castingCategoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'castingCategory.label', default: 'CastingCategory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'castingCategory.label', default: 'CastingCategory'), id])
            redirect(action: "show", id: id)
        }
    }
}
