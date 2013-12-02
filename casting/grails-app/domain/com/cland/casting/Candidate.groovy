package com.cland.casting;

class Candidate {
	//casting details:
	User person
	String clothing
	String shoe
	String waist
	String height
	String hair
	String eyes
	String status
	static belongsTo = [agency:Agency]	
	static constraints = {
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

	String toSummary(){
		"${person?.toString()} (${agency?.toString()})"
	}
	String toString(){
		//"${person?.toString()}"
		"${person?.toString()} (${agency?.toString()})"
	}
} //end class