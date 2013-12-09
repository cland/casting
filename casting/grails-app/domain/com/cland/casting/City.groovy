package com.cland.casting

class City {
	String name
	static constraints = {
		name(blank:false)
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
		//TODO: "${name}"
	}
} //end class