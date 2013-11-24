package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException

class ProductionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [productionInstanceList: Production.list(params), productionInstanceTotal: Production.count()]
    }

    def create() {
        [productionInstance: new Production(params)]
    }

    def save() {
        def productionInstance = new Production(params)
        if (!productionInstance.save(flush: true)) {
            render(view: "create", model: [productionInstance: productionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'production.label', default: 'Production'), productionInstance.id])
        redirect(action: "show", id: productionInstance.id)
    }

    def show(Long id) {
        def productionInstance = Production.get(id)
        if (!productionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "list")
            return
        }

        [productionInstance: productionInstance]
    }

    def edit(Long id) {
        def productionInstance = Production.get(id)
        if (!productionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "list")
            return
        }

        [productionInstance: productionInstance]
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
		// remove deleted entities. This relies on the cascade:"all-delete-orphan" setting in the respective Entity.
		productionInstance.roles.removeAll{ it.deleted }
		productionInstance.categories.removeAll{ it.deleted }
		productionInstance.portfolios.removeAll{ it.deleted }
        if (!productionInstance.save(flush: true)) {
            render(view: "edit", model: [productionInstance: productionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'production.label', default: 'Production'), productionInstance.id])
        redirect(action: "show", id: productionInstance.id)
    }

    def delete(Long id) {
        def productionInstance = Production.get(id)
        if (!productionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "list")
            return
        }

        try {
            productionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'production.label', default: 'Production'), id])
            redirect(action: "show", id: id)
        }
    }
}
