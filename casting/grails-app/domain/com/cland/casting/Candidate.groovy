package com.cland.casting;

class Candidate {
	def castingApiService
	//casting details:
	User person
	String clothing
	String shoe
	String waist
	String height
	String hair
	String eyes
	String status
	String keywords
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [portfolios:AgencyPortfolioSet]
	static belongsTo = [agency:Agency]	
	static constraints = {
		status(inList:["Active","Inactive"],nullable:true,blank:false)
		lastUpdatedBy nullable:true
		createdBy nullable:true
		keywords (blank:true, nullable:true)
	}
	def beforeInsert = {
		// your code goes here
		createdBy = castingApiService.getCurrentUserId()
	}
	def beforeUpdate = {
		lastUpdatedBy = castingApiService.getCurrentUserId()
	}
	def beforeDelete = {
		
	}
	def onLoad = {
		// your code goes here
	}

	String toSummary(){
		"${person?.toString()} (${agency?.toString()})"
	}
	String toString(){
		//"${person?.toString()}"
		"${person?.toString()} (${agency?.toString()})"
	}
} //end class