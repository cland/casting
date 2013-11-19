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
	static belongsTo = [agency:Agency]
	static hasMany = [videos:VideoSet,pictures:PictureSet]
	static constraints = {
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
		"${person?.toString()}"
	}
} //end class