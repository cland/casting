
package com.cland.casting

import java.util.List;

class Production {
	String name
	String description
	String address
	City city	
	List roles //without this problem: HibernateException – A collection with cascade=”all-delete-orphan” was no longer referenced by the owning entity instance
	List categories
	List portfolios
	Date shootDate
	List auditionDates
	ProductionStatus status
	
	String producer
	String productionCompany
	String storyboard
	/** Package Deal Fields **/
	String usage
	String medium 
	String period
	String territories
	String exclusions
	String feeNotes
	
	static hasMany =[portfolios:Portfolio,profiles:CastingProfile,roles:CastingRole,categories:CastingCategory,agencyACL:Agency]
	
	static mapping = {
		roles cascade:"all-delete-orphan"
		categories cascade:"all-delete-orphan"
		portfolios cascade:"all-delete-orphan"
		status defaultValue : ProductionStatus.OPEN_CANDIDATES_REQUIRED		
	}
	
	static belongsTo = [client:Client]
	static constraints = {
		name(blank:false)
		description(nullable:true)
		status(blank:false)
		producer (nullable:true)
		productionCompany (nullable:true)
		city(nullable:true)
		storyboard(nullable:true)
		usage(nullable:true)
		medium(nullable:true)
		period(nullable:true)
		territories(nullable:true)
		exclusions(nullable:true)
		feeNotes(nullable:true)
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
		"${name} - ${status.value}"
	}
} //end class