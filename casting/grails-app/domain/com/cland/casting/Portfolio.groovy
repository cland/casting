package com.cland.casting

class Portfolio {
	String name
	String comments
	boolean deleted
	static transients = [ 'deleted' ]
	static belongsTo = [production:Production]
	static hasMany =[profiles:CastingProfile]
	static attachmentable = true
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