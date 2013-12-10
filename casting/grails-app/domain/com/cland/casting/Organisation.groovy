package com.cland.casting

import java.util.Date;

class Organisation {
	transient castingApiService
	String name
	String phoneNo
	String email
	String phyAddress
	String phyPostCode
	String postalAddress
	String postalPostCode
	String contactPerson
	String type  //Agency,Other
	String city
	Region region
	Country country
	String comments
	String status
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	//static hasMany = [people:Person]
	
    static constraints = {
		name()
		phoneNo(nullable:true)
		email(nullable:true,email:true)
		phyAddress(blank:true, nullable:true)
		region(nullable:true)
		country(nullable:true)
		type(nullable:true,inList:["Agency","Client","Other"])
		city(nullable:true)
		contactPerson(nullable:true)
		postalAddress(nullable:true)
		postalPostCode(nullable:true)
		phyPostCode(nullable:true)
		comments(nullable:true)
		status(inList:["Active","Inactive"],nullable:true,blank:false)
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
		"${name}"
	}
} //end of class
