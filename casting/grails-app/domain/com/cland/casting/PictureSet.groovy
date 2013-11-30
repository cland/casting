package com.cland.casting

class PictureSet {
	String name
	Date dateCreated
	static attachmentable = true
	static belongsTo = [castingProfile:CastingProfile]
	static constraints = {
	}
	def beforeInsert = {
		// your code goes here
	}
	def beforeUpdate = {
		// your code goes here
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