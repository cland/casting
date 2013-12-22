package com.cland.casting

import org.springframework.dao.DataIntegrityViolationException
import com.cland.casting.DateParser
class CastingRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [castingRoleInstanceList: CastingRole.list(params), castingRoleInstanceTotal: CastingRole.count()]
    }

    def create() {
        [castingRoleInstance: new CastingRole(params)]
    }

    def save() {
		
        def castingRoleInstance = new CastingRole(params)
        if (!castingRoleInstance.save(flush: true)) {
            render(view: "create", model: [castingRoleInstance: castingRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), castingRoleInstance.id])
        redirect(action: "show", id: castingRoleInstance.id)
    }

    def show(Long id) {
        def castingRoleInstance = CastingRole.get(id)
        if (!castingRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "list")
            return
        }

        [castingRoleInstance: castingRoleInstance]
    }

    def edit(Long id) {
		
        def castingRoleInstance = CastingRole.get(id)
        if (!castingRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "list")
            return
        }

        [castingRoleInstance: castingRoleInstance]
    }

    def update(Long id, Long version) {
		def castingRoleInstance = CastingRole.get(id)
		
        
        if (!castingRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (castingRoleInstance.version > version) {
                castingRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'castingRole.label', default: 'CastingRole')] as Object[],
                          "Another user has updated this CastingRole while you were editing")
                render(view: "edit", model: [castingRoleInstance: castingRoleInstance])
                return
            }
        }

		bindData(castingRoleInstance, params, [exclude: 'auditionDates'])
		bindData(castingRoleInstance, params, [exclude: 'shootDates'])
		bindData(castingRoleInstance, params, [exclude: 'callbackDates'])
		bindData(castingRoleInstance, params, [exclude: 'wardropeDates'])
        castingRoleInstance.properties = params
		
		appendDates(params?.auditionDates,castingRoleInstance,CastEventType.AUDITION)
		appendDates(params?.callbackDates,castingRoleInstance,CastEventType.CALLBACK)
		appendDates(params?.wardropeDates,castingRoleInstance,CastEventType.WARDROPE)
		appendDates(params?.shootDates,castingRoleInstance,CastEventType.SHOOT)
//		if(params?.auditionDates){			
//			String dtlist = params?.auditionDates			
//			def datelist = Arrays.asList(dtlist.split("\\s*,\\s*"))
//			datelist.each{ entry ->
//				println ">> adding..." + (DateParser.fromString("",entry))?.format("d-M-yyyy")
//				castingRoleInstance.addToAuditionDates(DateParser.fromString("",entry))
//			}
//		}
        if (!castingRoleInstance.save(flush: true)) {
            render(view: "edit", model: [castingRoleInstance: castingRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), castingRoleInstance.id])
        redirect(action: "show", id: castingRoleInstance.id)
    }

    def delete(Long id) {
        def castingRoleInstance = CastingRole.get(id)
        if (!castingRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "list")
            return
        }

        try {
            castingRoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'castingRole.label', default: 'CastingRole'), id])
            redirect(action: "show", id: id)
        }
    }
	
	private void appendDates(String rawdates,def objInstance,def to){
		println(">> " + to + " - " + rawdates)
		if(rawdates){
			String dtlist = rawdates
			def datelist = Arrays.asList(dtlist.split("\\s*,\\s*"))
			
				switch(to){
					case CastEventType.AUDITION:
					objInstance.auditionDates.clear()
						datelist.each{ entry ->
							println "\t > aud: " + DateParser.fromString("",entry)						
							objInstance.addToAuditionDates(DateParser.fromString("",entry))
						} //end each
					break;
					case CastEventType.WARDROPE:
					objInstance.wardropeDates.clear()
						
						datelist.each{ entry ->
							println "\t > wad: " + DateParser.fromString("",entry)
						objInstance.addToWardropeDates(DateParser.fromString("",entry))
						}
					break;
					case CastEventType.CALLBACK:
					objInstance.callbackDates.clear()
						datelist.each{ entry ->
						println "\t > cal: " + DateParser.fromString("",entry)
						
						objInstance.addToCallbackDates(DateParser.fromString("",entry))
						}
					break;
					case CastEventType.SHOOT:
						objInstance.shootDates.clear()
						datelist.each{ entry ->
							println "\t > sho: " + DateParser.fromString("",entry)					
							objInstance.addToShootDates(DateParser.fromString("",entry))
						}
					break;
					default: println("nothing to do")
				}				
			
			
			//save
		//	if(!objInstance.save(flush: true)){
		//		println("Failed to add dats to " + to)
		//	}
		} //end if
	}//end 
	
} //end class
