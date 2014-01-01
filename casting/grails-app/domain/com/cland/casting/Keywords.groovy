package com.cland.casting

import java.util.Date;

import javax.management.modelmbean.RequiredModelMBean;

class Keywords {
	transient castingApiService
	String name
	String category
	String description
	String value
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static constraints = {
		name(unique:true)
		category(nullable:true)
		description(nullable:true)
		value (nullable:true) 
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