package com.cland.casting

class Client {
	Organisation company
	String status
	static hasMany = [contacts:User,productions:Production]
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

	String toString(){
		"${company?.name}"
	}
} //end class