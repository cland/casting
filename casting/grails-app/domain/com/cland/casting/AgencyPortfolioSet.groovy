package com.cland.casting

import java.util.Date;

/**
 * This is a set of of PICTURES and VIDEOS managed (created/deleted/updated) by the Agency ONLY and share with
 * Casting Admin if they want to. Not to confuse with PictureSet and VideoSet which is managed by the Casting Admin
 * @author Cland
 *
 */
class AgencyPortfolioSet {
	def castingApiService
	String name
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static attachmentable = true
	static belongsTo = [candidate:Candidate]
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