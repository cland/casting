package com.cland.casting

class CastingRole {
	String name
	int maxRequiredAuditionCount
	int minRequiredAuditionCount
	int requiredMaleCount
	int requiredFemaleCount
	int requiredCount
	static belongsTo = [production:Production]
	static constraints = {
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