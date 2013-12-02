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
		//If you are not admin/developer, set agencyId by default to currently loggedin user else use default supplied value
		if(agencyId < 1){
		//-	if(!SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_ADMIN.value + "," + SystemRoles.ROLE_DEVELOPER.value)) {
				//check if current user's capacity is associated with an Agency and assign that id.
		//		if(SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_AGENT.value)){
			println(">>. testing user...")
					def user = User.get(11)	//springSecurityService.currentUser
					// def agency = Agency.executeQuery("select distinct agency_contacts_id as agencyid from agency_user where user_id=:userid",[userid: user.id])
					// println(agency)
		//		}
		//-	}
		}else{
		def agency = Agency.get(agencyId)
		println(">> " + agency.candidates)
		}
	//	
	//	def candidateList = agency.candidates
		def candidateList = Candidate.createCriteria().list(offset:offset, max:max){
			createAlias('agency','agent')
			if(agencyId > 0) eq('agent.id',agencyId)
			//ilike('hair','black')
		}
		
		//candidateInstanceTotal: candidateList.totalCount
		//println(candidateList.size())
		return candidateList
		
	} //end function getAgencyCandidates
	
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
