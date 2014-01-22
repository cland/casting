package com.cland.casting
//@gorm.AuditStamp
class Rating {
	transient castingApiService
	Integer rating
	String comments
	
	//User createdBy
	
	boolean deleted
	static transients = [ 'deleted' ]
	static belongsTo = [profile:CastingProfile]
	static constraints = {
		comments(blank:true)
		rating(min:1,max:5)
	
	}
	def beforeInsert = {
		// your code goes here
	}
	def beforeUpdate = {
		// your code goes here
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