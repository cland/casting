
package com.cland.casting

import java.util.List;

class Production {
	String name
	String description
	List roles //without this problem: HibernateException – A collection with cascade=”all-delete-orphan” was no longer referenced by the owning entity instance
	List categories
	List portfolios
	ProductionStatus status
//	public enum ProductionStatus{
//		OPEN_CANDIDATES_REQUIRED("Open - Candidates Required"),
//		OPEN_AUDITION_IN_PROGRESS("Open - Audition In Progress"),
//		CLOSED("Closed")
//
//		final String value;
//		
//		ProductionStatus(String value) {
//			this.value = value;
//		}
//		
//		String toString(){
//			value;
//		}
//		
//		String getKey(){
//			name()
//		}
//
//		static list() {
//			[OPEN_CANDIDATES_REQUIRED, OPEN_AUDITION_IN_PROGRESS, CLOSED]
//		}
//
//	} //end Enum
	static hasMany =[portfolios:Portfolio,profiles:CastingProfile,roles:CastingRole,categories:CastingCategory,agencyACL:Agency]
	
	static mapping = {
		roles cascade:"all-delete-orphan"
		categories cascade:"all-delete-orphan"
		portfolios cascade:"all-delete-orphan"
		status defaultValue : ProductionStatus.OPEN_CANDIDATES_REQUIRED
	}
	
	static belongsTo = [client:Client]
	static constraints = {
		name(blank:false)
		description(nullable:true)
		status(blank:false)
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
		"${name} - ${status.value}"
	}
} //end class