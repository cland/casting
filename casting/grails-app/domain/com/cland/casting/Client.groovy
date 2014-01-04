package com.cland.casting

import java.util.Date;

class Client {
	static searchable = {
		spellCheck "include"
	}
	def castingApiService
	Organisation company
	String status
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static hasMany = [contacts:User,productions:Production]
	static constraints = {
		status(inList:["Active","Inactive"],nullable:true,blank:false)
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
		"${company?.name}"
	}
} //end class