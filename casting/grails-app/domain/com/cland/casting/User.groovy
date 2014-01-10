package com.cland.casting

import java.util.Date;

class User {
	static searchable = {
		spellCheck "include"
	}
	transient castingApiService
	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	//* Custom fields
	 String salutation
	 String firstName
	 String lastName
	 String middleName
	 String knownAsName
	 String idNo
	 String homeLanguage
	 Date dateOfBirth
	 String gender
	 String maritalStatus
	 Race race
	 String address
	 String city
	 Region region
	 Country country
	 String email
	 String contactNo
	 String communicationMode //sms,email
	 long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	// Organisation company
	 String status
	 String caption
	// Candidate candidate
	static transients = [ 'mediumDetails','shortDetails','firstLastName','lastFirstName','age' ]
	//static hasOne = [candidate:Candidate] 
	static attachmentable = true
	static constraints = {
		//candidate(nullable:true)
		username blank: true, unique: true, nullable:true
		password blank: true, nullable:true
		firstName(blank:false)
		lastName(blank:false)
		middleName(nullable:true)
		knownAsName(blank:true,nullable:true) 
		homeLanguage(nullable:true)
		salutation(inList:["Mr","Mrs","Ms","Miss"],nullable:true)
		idNo(nullable:true)
		dateOfBirth(nullable:true)
		gender(inList:["Male", "Female"])
		race(nullable:true)
		maritalStatus(nullable:true,inList:["Single","Married","Divorced","Widowed"])
		communicationMode(nullable:true,inList:["Email","SMS"])
		address(nullable:true)	
		city(nullable:true)
		region(nullable:true)
		country(nullable:true)
		contactNo()
		email(email:true)
		//company(nullable:true)
		dateCreated()
		lastUpdatedBy nullable:true
		createdBy nullable:true
		status(inList:["Active","Inactive"],nullable:true,blank:false)
		//candidate(nullable:true)
		caption(nullable:true)
	}

	static mapping = {
		password column: '`password`'
		candidate  cascade: "delete"
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		createdBy = castingApiService.getCurrentUserId()
		encodePassword()
	}

	def beforeUpdate() {
		lastUpdatedBy = castingApiService.getCurrentUserId()
		if (isDirty('password')) {
			encodePassword()
		}
	}
	/**
	 * To ensure that all attachments are removed when the "onwer" domain is deleted.
	 */
	transient def beforeDelete = {
		withNewSession{
		  removeAttachments()
		}
	  }
	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	public getShortDetails(){
		toString() + " (${username})"
	}
	public String getMediumDetails(){
		toString() + " (${username} | ${gender} | ${race})"
	}
	public String getLastFirstName(String s = " "){
		"${lastName}" + s + "${firstName}"
	}
	public String getFirstLastName(String s = " "){
		"${firstName}" + s + "${lastName}"
	}
	String toString(){
		"${firstName} ${lastName}"
	}

	public getAge(){
		if(dateOfBirth == null){
			return 0
		}
		def now = new GregorianCalendar()
		Integer birthMonth = dateOfBirth.getAt(Calendar.MONTH)
		Integer birthYear = dateOfBirth.getAt(Calendar.YEAR)
		Integer birthDate = dateOfBirth.getAt(Calendar.DATE)
		Integer yearNow = now.get(Calendar.YEAR)

		def offset = new GregorianCalendar(
				yearNow,
				birthMonth-1,
				birthDate)
		return (yearNow - birthYear - (offset > now ? 1 : 0))
	}

	public enum PhoneType{
		H("Home"),
		M("Mobile"),
		W("Work"),
		F("Fax")

		final String value;
		
		PhoneType(String value) {
			this.value = value;
		}
		
		String toString(){
			value;
		}
		
		String getKey(){
			name()
		}

		static list() {
			[H, M, W, F]
		}

	}
} //end class
