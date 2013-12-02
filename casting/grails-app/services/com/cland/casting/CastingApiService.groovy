package com.cland.casting

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap;
import org.codehaus.groovy.grails.plugins.springsecurity.*

class CastingApiService {
	def springSecurityService
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
    } // function
	def getUsersWithRole(List<String> rolelist){
		List alldata = []
		def role = null
		for(int i=0;i<rolelist.size();i++){
			role = Role.findByAuthority(rolelist[i])
			//def data = UserRole.findByRole(role)*.user
			def tmp = UserRole.findByRole(role)?.user
			if( tmp ) alldata.addAll(tmp)
		}		
		return alldata
	}
	
	def getCandidates(long productionId, long agencyId, int offset, int max){
		def user = springSecurityService.currentUser
		def candidateList = []
		
		if(isAdmin()){
			//if admin return all candidates for a given agencyId
			candidateList = Candidate.createCriteria().list(offset:offset, max:max){
				createAlias('agency','agent')
				createAlias('person','p')
				order('agent.company','asc')
				order('p.firstName','asc')
				if(agencyId > 0) eq('agent.id',agencyId)  //if not valid id is provided ignore this rule so that all candidates will be returned.
				//ilike('hair','black')
			}
		}else{
			//current user is not admin, check if he/she is agency contact
			agencyId = 0	//force agencyId to something that returns empty results
			def agency = getAgencyForUser(user.id)
			//if an agency entity exists, then set the id so that he/she can only see her own list of candidates.
			if(agency) agencyId = agency.id
			candidateList = Candidate.createCriteria().list(offset:offset, max:max){
				createAlias('person','p')
				order('agent.company','asc')
				order('p.firstName','asc')
				eq('agent.id',agencyId)
				//ilike('hair','black')
			}
		} 
		
		//candidateInstanceTotal: candidateList.totalCount
		//println(candidateList.size())
		return candidateList
		
	} //end function getAgencyCandidates
	def getProfiles(long productionId, long candidateId, int offset, int max){
		def profiles = CastingProfile.withCriteria {
			canditate{
				idEq(candidateId)
			}
			production{
				if(productionId > 0){
					idEq(productionId)	
				}
			}
		}
	}
	def getAgencyForUser(Long id){
		return Agency.withCriteria {
			contacts{
				idEq(id)
			}
		}
	}
	def getClientListForOrg(Long id,Integer offset,Integer max){
		def clientlist = Client.createCriteria().list (offset:offset,max:max){
			eq "company.id",id
		}
		return clientlist
	}
	def getAgencyListForOrg(Long id,Integer offset,Integer max){
		def agencylist = Agency.createCriteria().list (offset:offset,max:max){
			eq "company.id",id
		}
		return agencylist
	} //end function
	boolean isAdmin(){
		return (SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_ADMIN.value + "," + SystemRoles.ROLE_DEVELOPER.value))
	}
	boolean isDeveloper(){
		return (SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_DEVELOPER.value))
	}
	boolean isAgent(){
		return (SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_AGENT.value))
	}
	boolean isClient(){
		return (isDirector() || isReviewer())
	}
	boolean isDirector(){
		return (SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_DIRECTOR.value))
	}
	boolean isReviewer(){
		return (SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_REVIEWER.value))
	}
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
