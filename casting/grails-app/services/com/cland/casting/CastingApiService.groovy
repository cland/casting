package com.cland.casting

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap;
import org.codehaus.groovy.grails.plugins.springsecurity.*
import org.grails.datastore.gorm.finders.MethodExpression.IsEmpty;

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
			def tmp = UserRole.findAllByRole(role)*.user
			if( tmp ) alldata.addAll(tmp)
		}		
		return alldata
	} //
	
	def getProductions(long agencyId, int offset, int max){
		def user = springSecurityService?.currentUser
		def productionList = Production.withCriteria { isEmpty("agencyACL") }
		if(isAdmin()){
			def tmpList = Production.withCriteria {
				if(agencyId > 0) agencyACL { idEq(agencyId) }
				//firstResult(offset)
				maxResults(max)
				order("status", "asc")
			}
			productionList.addAll(tmpList)
		}else{
			agencyId = 0	//force agencyId to something that returns empty results
			def agency = getAgencyForUser(user.id)
			//if an agency entity exists, then set the id so that he/she can only see her own list of candidates.
			if(agency){			
				 agencyId = agency?.id?.get(0)
			}
			def tmpList = Production.withCriteria {
				agencyACL { idEq(agencyId) }
				//firstResult(offset)
				maxResults(max)
				order("status", "asc")
			}
			productionList.addAll(tmpList)
		}
		return productionList.sort{it.name} //.reverse() // Production.list() //
	} //end function
	
	def getCandidates(long productionId, long agencyId, int offset, int max){
		def user = getCurrentUser() //springSecurityService.currentUser
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
			maxResults(1)
		}
	}
	def getClientForUser(Long id){
		return Client.withCriteria {
			contacts{
				idEq(id)
			}
			maxResults(1)
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
	def getClientListForUser(Long id,Integer offset,Integer max){
		def clientlist = Client.createCriteria().list (offset:offset,max:max){
			contacts{ idEq(id) }
		}
		return clientlist
	}
	def getAgencyListForUser(Long id,Integer offset,Integer max){
		def agencylist = Agency.createCriteria().list (offset:offset,max:max){
			contacts{ idEq(id) }
		}
		return agencylist
	} //end function
	String getHomeLink(){
		Long userId = getCurrentUserId() // springSecurityService?.currentUser?.id
		if(isAdmin()) return "/admin/"
		if(isAgent()){
			//work out the agency that this user belongs to
			def agency = getAgencyForUser(userId)
			long id = agency?.id?.get(0) //comes back as an array coz user can belong to more that one???? 
			
			if(agency?.id){
				//return agency's details link
				return "/agency/show/" + id
			}
		}
		if (isClient()){
			//work out the client that this user belongs to
			def client = getClientForUser(userId)
			long id = client?.id?.get(0)
			if(client){
				//return client's details link
				return "/client/show/" + id
			}
		}
		
		//else we rturn the user back to home page.
		return "/"
	}
	String getSideMenuName(){
		long userId = getCurrentUserId() //springSecurityService.currentUser?.id //?.principal?.id
		if(isAdmin()) return "sidenav-admin"
		if(isAgent()){
			return "sidenav-agency"
		}
		if (isClient()){

			return "sidenav-client"

		}

		//else we rturn the user back to home page.
		return "sidenav"
	}
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
	Long getCurrentUserId(){
		long userId = springSecurityService?.principal?.id //.currentUser?.id //
		return userId
	}
	User getCurrentUser(){
		return springSecurityService?.currentUser
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
