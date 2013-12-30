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
	boolean isWardrobeAvailable	//available
	boolean isWardrobeAttended	//
	boolean isRoleAvailable 	//accepted/confirmed for the job - available Y/N
	boolean isRoleAttended		//after the production, might want to know if candidate did attend the shoot
	
	int auditionAvailRank	//if profiles is not available for audition, how many other jobs are waiting for profile before us
	int callbackAvailRank	//if profiles is not available for callback, how many other jobs are waiting for profile before us
	int wardrobeAvailRank	//if profiles is not available for wardrobe, how many other jobs are waiting for profile before us
	int roleAvailRank		//** if profiles is not available for role, how many other jobs are waiting for profile before us
	
	Date castDate	//TODO: duplicate, same purpose as auditionDate
	Date auditionDate
	Date callbackDate
	Date wardrobeDate	//wardropeDate, isWardropeAvailable,isWardropeAttended
	Date shootDate
	
	String outcome	//TODO: Final outcome. Remove and replaced by isConfirmed flag.
	Integer round
	Double averating	//average rating - a computed field from the exiting ratings.
	String comments
	Candidate canditate
	int age		//computed value at the time of this casting profile

	List ratings
	static transients = [ 'mediumDetails',
		'shortDetails','firstLastName','lastFirstName','gender','race','email','contactNo',
		'wardropeDate', 'isWardropeAvailable','isWardropeAttended','candidate','currentAge' ]
	
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
		wardrobeDate(nullable:true)
		shootDate(nullable:true)
		castDate(nullable:true)
		castNo(nullable:true)
		round(nullable:true)
		age(nullable:true)
		lastUpdatedBy nullable:true
		createdBy nullable:true
		isConfirmed (nullable:true)
		auditionAvailRank(nullable:true)
		callbackAvailRank(nullable:true)
		wardrobeAvailRank(nullable:true)
		roleAvailRank(nullable:true)
	}
	static mapping = {
		ratings cascade:"all-delete-orphan"
	}
	void computeAverageRating(){
		averating = 0.0 //TODO: Calculate the average ratings
	}
	void computeAge(){
		if(age == null || age <= 0){
			age = getCanditate()?.person?.age			
		}		
	}
	def beforeInsert = {
		createdBy = castingApiService.getCurrentUserId()
		computeAge()
		computeAverageRating()
	}
	def beforeUpdate = {
		lastUpdatedBy = castingApiService.getCurrentUserId()
		computeAge()
		computeAverageRating()
	}
	def beforeDelete = {
		// your code goes here
	}
	def onLoad = {
		// your code goes here
	}
	public getCurrentAge(){
		candidate?.person?.age
	}
	public String getShortDetails(){
		candidate?.person?.shortDetails
	}
	public String getMediumDetails(){
		candidate?.person?.mediumDetails
	}
	public String getLastFirstName(String s = " "){
		candidate?.person?.lastFirstName
	}
	public String getFirstLastName(String s = " "){
		candidate?.person?.firstLastName
	}

	public String getGender(){
		candidate?.person?.gender
	}
	public String getRace(){
		candidate?.person?.race
	}
	public String getEmail(){
		candidate?.person?.email
	}
	public String getContactNo(){
		candidate?.person?.contactNo
	}

	String getName(){
		"${candidate?.person?.toString()}"
	}
	String toString(){
		"Cast: ${castNo} - ${candidate?.person?.toString()}"
	}
	
	public Candidate getCandidate(){
		return canditate
	}
	//function to fix the stupid spelling error. to phase out slowly
	public Date getWardropeDate(){
		wardrobeDate
	}
	public boolean isWardropeAvailable(){
		isWardrobeAvailable
	}
	public boolean isWardropeAttended(){
		isWardrobeAttended
	}
} //end class