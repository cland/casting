package com.cland.casting

import java.util.Date;

class CastingProfile {
	transient castingApiService
	BigInteger castNo
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	boolean isInvited		//1. invited for first casting audition - Y/N
	boolean isShortlist		//2. for directors to review
	boolean isConfirmed		//3. confirmed
	
	boolean isAuditionAvailable //called for casting audition - available Y/N
	boolean isAuditionAttended  //whether candidate did attend the audition
	boolean isCallbackAvailable //available for the call back date - Y/N
	boolean isCallbackAttended	//whether the candidate attended the callback	
	boolean isWardropeAvailable	//available
	boolean isWardropeAttended	//
	boolean isRoleAvailable 	//accepted/confirmed for the job - available Y/N
	boolean isRoleAttended		//after the production, might want to know if candidate did attend the shoot
	
	Date castDate	//TODO: duplicate, same purpose as auditionDate
	Date auditionDate
	Date callbackDate
	Date wardropeDate
	Date shooteDate
	
	String outcome	//TODO: Final outcome. Remove and replaced by isConfirmed flag.
	Integer round
	Double averating	//average rating - a computed field from the exiting ratings.
	String comments
	Candidate canditate
	int age		//computed value at the time of this casting profile

	List ratings
	static hasMany = [ratings:Rating,roles:CastingRole,categories:CastingCategory]
	static hasOne = [videos:VideoSet,pictures:PictureSet]
	static belongsTo = [production:Production]
	static constraints = {
		outcome(inList:["Pending","Confirmed","Not-Confirmed"],nullable:true)
		averating(nullable:true) 
		videos(nullable:true)
		pictures(nullable:true)
		comments(nullable:true)		
		auditionDate(nullable:true)
		callbackDate(nullable:true)
		wardropeDate(nullable:true)
		shootDate(nullable:true)
		castDate(nullable:true)
		castNo(nullable:true)
		round(nullable:true)
		age(nullable:true)
		lastUpdatedBy nullable:true
		createdBy nullable:true
		isConfirmed (nullable:true)
	}
	static mapping = {
		ratings cascade:"all-delete-orphan"
	}
	void computeAverageRating(){
		averating = 0.0 //TODO: Calculate the average ratings
	}
	void computeAge(){
		age = 18 //TODO: compute the age here
	}
	def beforeInsert = {
		createdBy = castingApiService.getCurrentUserId()
		computeAverageRating()
	}
	def beforeUpdate = {
		lastUpdatedBy = castingApiService.getCurrentUserId()
		computeAverageRating()
	}
	def beforeDelete = {
		// your code goes here
	}
	def onLoad = {
		// your code goes here
	}
	String getName(){
		"${canditate?.person?.toString()}"
	}
	String toString(){
		"Cast: ${castNo} - ${canditate?.person?.toString()}"
	}
} //end class