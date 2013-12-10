package com.cland.casting

import java.util.Date;

class CastingCategory {
	transient castingApiService
	String name
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	boolean deleted
	static transients = [ 'deleted' ]
	static belongsTo = [production:Production]
	static constraints = {
		name(blank:false)
		lastUpdatedBy nullable:true
		createdBy nullable:true
	}
	def beforeInsert = {
		createdBy = castingApiService.getCurrentUserId()
	}
	def beforeUpdate = {
		lastUpdatedBy = castingApiService.getCurrentUserId()
	}
	def beforeDelete = {
		// your code goes here
	}
	def onLoad = {
		// your code goes here
	}

	String toString(){
		 "${name}"
	}
} //end class