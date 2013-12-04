package com.cland.casting

import java.util.Date;

class CastingProfile {
	BigInteger castNo
	Date castDate
	
	boolean isInvited		//invited for first casting audition - Y/N
	boolean isAuditionAvailable //called for casting audition - available Y/N
	boolean isCallbackAvailable //available for the call back date - Y/N
	boolean isShortlist
	boolean isRoleAvailable //accepted for the job - available Y/N
	Date auditionDate
	Date callbackDate
	String outcome	//Final outcome
	Integer round
	Double averating	//average rating - a computed field from the exiting ratings.
	String comments
	Candidate canditate
	int age		//computed value at the time of this casting profile
//	VideoSet videos
//	PictureSet pictures
	List ratings
	static hasMany = [ratings:Rating,roles:CastingRole,categories:CastingCategory]
	static hasOne = [videos:VideoSet,pictures:PictureSet]
	static belongsTo = [production:Production]
	static constraints = {
		outcome(inList:["Pending","Selected","Not-Selected"],nullable:true)
		averating(nullable:true) 
		videos(nullable:true)
		pictures(nullable:true)
		comments(nullable:true)		
		auditionDate(nullable:true)
		callbackDate(nullable:true)
		castDate(nullable:true)
		castNo(nullable:true)
		round(nullable:true)
		age(nullable:true)
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
		computeAverageRating()
	}
	def beforeUpdate = {
		computeAverageRating()
	}
	def beforeDelete = {
		// your code goes here
	}
	def onLoad = {
		// your code goes here
	}

	String toString(){
		"Cast: ${castNo} - ${canditate?.person?.toString()}"
	}
} //end class