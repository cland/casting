package com.cland.casting
import org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent
class HistoryLogTagLib {
	def objectHistory = {attrs->
		if(attrs.persistedObjectId) {
			def events = AuditLogEvent.findAllByPersistedObjectId(attrs.persistedObjectId, [sort:"dateCreated",order:"desc"])
			if(events.size() > 0) {
			  events.each{event->
				out << event.propertyName
				out << ' changed on '
				out << event.dateCreated
				out << 'The old value was '
				out << event.oldValue
				out << ' and the new value is '
				out << event.newValue
			  }
			}
		}
	}
}
