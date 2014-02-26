package com.cland.casting

import java.util.Date;

class Portfolio {
	static searchable = {
		spellCheck "include"
	}
	transient castingApiService
	String name
	String comments
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	boolean deleted
	static transients = [ 'deleted' ]
	static belongsTo = [production:Production]
	static hasMany =[profiles:CastingProfile,usersAcl:User,agencyAcl:Agency]
	static attachmentable = true
	static constraints = {
		lastUpdatedBy nullable:true
		createdBy nullable:true
		comments nullable:true
	}
	def beforeInsert = {
		createdBy = castingApiService.getCurrentUserId()
	}
	def beforeUpdate = {
		lastUpdatedBy = castingApiService.getCurrentUserId()
	}
	/**
	 * To ensure that all attachments are removed when the "onwer" domain is deleted.
	 */
	transient def beforeDelete = {
		withNewSession{
		  removeAttachments()
		}
	  }
	def onLoad = {
		// your code goes here
	}

	String toString(){
		 "${name}"
	}
} //end class