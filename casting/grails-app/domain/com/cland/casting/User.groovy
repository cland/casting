package com.cland.casting

import java.util.Date;

class User {

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
	 Date dateCreated
	 Organisation company
	 
	// Candidate candidate
	 
	static constraints = {
		username blank: false, unique: true
		password blank: false
		firstName(blank:false)
		lastName(blank:false)
		middleName(nullable:true)
		homeLanguage(nullable:true)
		salutation(inList:["Mr","Mrs","Ms","Miss"],nullable:true)
		idNo()
		dateOfBirth()
		gender(inList:["Male", "Female"])
		race(nullable:true)
		maritalStatus(nullable:true,inList:["Single","Married","Divorced","Widowed"])
		communicationMode(nullable:true,inList:["Email","SMS"])
		address()	
		city()
		region(nullable:true)
		country(nullable:true)
		contactNo()
		email(email:true)
		company(nullable:true)
		dateCreated()
		//candidate(nullable:true)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	String lastFirstName(String s = " "){
		"${lastName}" + s + "${firstName}"
	}
	String firstLastName(String s = " "){
		"${firstName}" + s + "${lastName}"
	}
	String toString(){
		"${firstName} ${lastName}"
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
