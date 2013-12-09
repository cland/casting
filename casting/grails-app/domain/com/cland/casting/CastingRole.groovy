package com.cland.casting

class CastingRole {
	String name
	String description	//the description of the role
	double dayfee
	String feeNotes	//any comments on the structure of the fee.
	int maxRequiredAuditionCount
	int minRequiredAuditionCount
	int requiredMaleCount
	int requiredFemaleCount
	int requiredCount
	List<Date> auditionDates	//castingDates
	List<Date> callbackDates
	List<Date> wardropeDates
	List<Date> shootDates
	List<Category> allowedCategories //emply list means all allowed otherwise restricted to allow categories in the list.
	boolean deleted
	static transients = [ 'deleted' ]
	
	static belongsTo = [production:Production]
	static constraints = {
		name(blank:false)
		maxRequiredAuditionCount(min:0,blank:true)
		minRequiredAuditionCount(min:0,blank:true)
		requiredMaleCount(min:0,nullable:true,blank:true)
		requiredFemaleCount(min:0,nullable:true,blank:true)
		requiredCount(min:1,blank:true)	
		allowedCategories nullable: true  
	}
	static mapping = {
		requiredCount defaultValue: 1
		maxRequiredAuditionCount defaultValue: 10
		minRequiredAuditionCount defaultValue: 5
		requiredMaleCount defaultValue: 1
		requiredMaleCount defaultValue: 1
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