package com.cland.casting

import java.util.Date;

class CastingProfile {
	BigInteger castNo
	Date castDate
	
	boolean isInvited		//invited for first casting audition - Y/N
	boolean isAuditionAvailable //called for casting audition - available Y/N
	boolean isShortlist
	boolean isRoleAvailable //accepted for the job - available Y/N
	String outcome	//Final outcome
	Integer round
	Double averating	//average rating - a computed field from the exiting ratings.
	String comments
	Candidate canditate
	VideoSet videos
	PictureSet pictures
	static hasMany = [ratings:Rating,roles:CastingRole,categories:CastingCategory]
	static belongsTo = [production:Production]
	static constraints = {
		outcome(inList:["Pending","Selected","Not-Selected"],nullable:true)
	}
	
	void computeAverageRating(){
		averating = 0.0 //TODO: Calculate the average ratings
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