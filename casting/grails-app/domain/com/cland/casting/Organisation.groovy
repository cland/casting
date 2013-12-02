package com.cland.casting

class Organisation {

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
} //end of class
