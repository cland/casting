package com.cland.casting

class Production {
	String name
	
	static hasMany =[portfolios:Portfolio,roles:CastingRole,categories:CastingCategory]
	static belongsTo = [client:Client]
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