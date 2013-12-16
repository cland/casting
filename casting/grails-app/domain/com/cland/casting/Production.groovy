
package com.cland.casting

import java.util.Date;
import java.util.List;

class Production {
	transient castingApiService
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
	String productionCompany	//?? not necessary - client will represent the production company
	String storyboard
	/** Package Deal Fields **/
	String prodUsage
	String medium 
	String period
	String territories
	String exclusions
	String feeNotes		//?? not necessary. details on the role as well as the general comments can be used for this
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
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
		prodUsage(nullable:true)
		medium(nullable:true)
		period(nullable:true)
		territories(nullable:true)
		exclusions(nullable:true)
		feeNotes(nullable:true)
		lastUpdatedBy nullable:true
		createdBy nullable:true
	}

	def beforeInsert = { 
		createdBy = castingApiService.getCurrentUserId()
	}
	def beforeUpdate = {
		lastUpdatedBy = castingApiService.getCurrentUserId()
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