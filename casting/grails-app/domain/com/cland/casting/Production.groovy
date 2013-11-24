
package com.cland.casting

import java.util.List;

class Production {
	String name
	String description
	List roles //without this problem: HibernateException – A collection with cascade=”all-delete-orphan” was no longer referenced by the owning entity instance
	List categories
	List portfolios

	static hasMany =[portfolios:Portfolio,profiles:CastingProfile,roles:CastingRole,categories:CastingCategory,agencyACL:Agency]
	
	static mapping = {
		roles cascade:"all-delete-orphan"
		categories cascade:"all-delete-orphan"
		portfolios cascade:"all-delete-orphan"
	}
	
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