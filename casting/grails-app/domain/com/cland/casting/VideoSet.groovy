package com.cland.casting

import java.util.Date;

class VideoSet {
	transient castingApiService
	String name
		long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static belongsTo = [castingProfile:CastingProfile]
	static attachmentable = true
	static constraints = {
		lastUpdatedBy nullable:true
		createdBy nullable:true
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