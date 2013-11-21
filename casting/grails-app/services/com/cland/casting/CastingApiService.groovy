package com.cland.casting

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap;

class CastingApiService {

	/**
	 * This function is used to update the roles for a given user from the checkbox on the user gsp
	 * @param userInstance
	 * @param params
	 * @return
	 */
    def updateRoles(User userInstance, GrailsParameterMap params) {
		UserRole.removeAll(userInstance)
		def roles = Role.list()
		for(Role r : roles){
			def tmp = params.list("role_${r.authority}")
			if (tmp[0]) UserRole.create(userInstance, r, true)
		}
    }
	
	def getAgencyCandidates(long agencyId, int offset, int max){
		
		def agency = Agency.get(agencyId)
	//	def candidateList = agency.candidates
		def candidateList = Candidate.createCriteria().list(offset:offset, max:max){
			createAlias('agency','agent')
			eq('agent.id',agencyId)
			ilike('hair','black')
		}
		
		//candidateInstanceTotal: candidateList.totalCount
		println(candidateList.size())
		return candidateList
		
	} //end function getAgencyCandidates
	
	// example criteria search
	//		def resultSummaryInstanceList = ResultSummary.createCriteria().list(offset: offset, max: max) {
	//			createAlias('register','reg')
	//			createAlias('tutor','tut')
	//			createAlias('reg.learner','l')
	//			order('reg.learner','asc')
	//            if (idLongbox.value) {
	//                eq('id', idLongbox.value)
	//            }
	//			if(keywordBox.value){
	//				ilike('l.lastName',"%"+keywordBox.value+"%")
	//			}
	//			if(keywordBoxTutor.value){
	//				ilike('tut.lastName',"%"+keywordBoxTutor.value+"%")
	//			}
	//		}
}//end class
