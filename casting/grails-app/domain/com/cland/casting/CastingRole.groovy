package com.cland.casting

class CastingRole {
	String name
	int maxRequiredAuditionCount
	int minRequiredAuditionCount
	int requiredMaleCount
	int requiredFemaleCount
	int requiredCount
	
	boolean deleted
	static transients = [ 'deleted' ]
	
	static belongsTo = [production:Production]
	static constraints = {
		name(blank:false)
		maxRequiredAuditionCount(min:0)
		minRequiredAuditionCount(min:0)
		requiredMaleCount(min:0)
		requiredFemaleCount(min:0)
		requiredCount(min:1)
	}
	static mapping = {
		requiredCount defaultValue: 1
		maxRequiredAuditionCount : 10
		minRequiredAuditionCount : 5
		requiredMaleCount : 1
		requiredMaleCount : 1
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
		"${name}"
	}
} //end class