
package com.cland.casting

class Production {
	String name
	String description
	static hasMany =[portfolios:Portfolio,profiles:CastingProfile,roles:CastingRole,categories:CastingCategory]
	static belongsTo = [client:Client]
	static constraints = {
		name(blank:false)
		description(nullable:true)
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