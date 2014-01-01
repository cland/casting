package com.cland.casting

import java.util.Date;

class Agency {
	transient castingApiService
	Organisation company
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	String status
	static transients = [ 'agencyAndCategories' ]
	static hasMany = [contacts:User,candidates:Candidate,categories:Category]
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

	public getAgencyAndCategories(){
		toString() + " [" + categories*.name.join(',') + "]"
	}
	String toString(){
		"${company?.name}"
	}
} //end class