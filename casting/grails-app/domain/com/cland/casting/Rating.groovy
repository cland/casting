package com.cland.casting

import java.util.Date;
//@gorm.AuditStamp
class Rating {
	transient castingApiService
	Integer rating
	String comments
	String ratingType
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	//User createdBy
	
	boolean deleted
	static transients = [ 'deleted' ]
	static belongsTo = [profile:CastingProfile]
	static constraints = {
		comments(blank:true)
		rating(min:0,max:20)
		lastUpdatedBy nullable:true
		createdBy nullable:true
		ratingType(nullable:true,blank:true)
	}
	static mapping = {
		comments sqlType: "longtext"
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
		"${rating}"
	}
} //end class