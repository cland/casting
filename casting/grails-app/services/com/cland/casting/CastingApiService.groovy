package com.cland.casting

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap;
import org.codehaus.groovy.grails.plugins.springsecurity.*
import org.grails.datastore.gorm.finders.MethodExpression.IsEmpty;

import com.sun.org.apache.xalan.internal.xsltc.compiler.ForEach;

class CastingApiService {
	static transactional = false
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
	
	/*
	 * Given a production, it computes all the key dates defined on the roles if any
	 * These are: AUDITION_DATES, CALLBACK_DATES, WARDROPE_DATES, SHOOT_DATES
	 * Returns: an array of unique dates as defined by all the roles for the production
	 */
	def getProductionDates(Production production){
		List auditionDates = []
		List callbackDates = []
		List wardropeDates = []
		List shootDates = []
		//loop through the available roles
		production?.roles?.each {role->
			auditionDates.addAll(role?.auditionDates)
			callbackDates.addAll(role?.callbackDates)
			wardropeDates.addAll(role?.wardropeDates)
			shootDates.addAll(role?.shootDates)
		}
		return [auditionDates:auditionDates?.sort()?.unique(),
			callbackDates:callbackDates?.sort()?.unique(),
			wardropeDates:wardropeDates?.sort()?.unique(),
			shootDates:shootDates?.sort()?.unique()]
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
		long userId = 0 //.currentUser?.id //
		if(springSecurityService?.principal?.id) userId = springSecurityService?.principal?.id
		return userId
	}
	User getCurrentUser(){
		return springSecurityService?.currentUser
	}
	User getUser(Long id){
		return User.get(id)
	}
	String getUserFullname(Long id){
		User user = getUser(id)
		if(user) return user.getFirstLastName()
		return ""
	}
	
// ***** FILTER FUNCTIONS ************** //
	
	def profileFilter(Long productionId,Map params){
		def sortby = params?.sortby
		def user = getCurrentUser()
		def agencyId = 0
		
		//Auditions stage
		def profiles = CastingProfile.withCriteria {
			if(isAgent()){
				//then we only show them their profiles
				def agency = getAgencyForUser(user.id) //user.id				
				if(agency) agencyId = agency[0].id
				canditate {
					createAlias("canditate.agency",'agency')
					eq("agency.id",agencyId.toLong())				
				}			
			}
			roles{
				if(params?.filter_roles_stage1) 'in'("id",params?.filter_roles_stage1*.toLong())
				if(params?.filter_roles_stage2) 'in'("id",params?.filter_roles_stage2*.toLong())
				if(params?.filter_roles_stage3) 'in'("id",params?.filter_roles_stage3*.toLong())
			}			
			categories{
				if(params?.filter_categories_stage1) 'in'("id",params?.filter_categories_stage1*.toLong())
				if(params?.filter_categories_stage2) 'in'("id",params?.filter_categories_stage2*.toLong())
				if(params?.filter_categories_stage3) 'in'("id",params?.filter_categories_stage3*.toLong())
			}
			//STAGE 1
			params?.filter_invited_stage1?.with{
				if(!equalsIgnoreCase("any")){	eq("isInvited",equalsIgnoreCase("yes")) }
			}
			params?.filter_attended_stage1?.with{
				if(!equalsIgnoreCase("any")) eq("isAuditionAttended",equalsIgnoreCase("yes"))
			}
			params?.filter_available_stage1?.with{
				if(!equalsIgnoreCase("any")) eq("isAuditionAvailable",equalsIgnoreCase("yes"))
			}
			params?.filter_shortlist_stage1?.with{
				if(!equalsIgnoreCase("any")) eq("isShortlist",equalsIgnoreCase("yes"))
			}
			params?.filter_confirmed_stage1?.with{
				if(!equalsIgnoreCase("any")) eq("isConfirmed",equalsIgnoreCase("yes"))
			}
			//STAGE 2
			params?.filter_callback_stage2?.with{
				if(!equalsIgnoreCase("any")){	eq("isCallbackAvailable",equalsIgnoreCase("yes")) }
			}
			params?.filter_callback_attended_stage2?.with{
				if(!equalsIgnoreCase("any")) eq("isAuditionAttended",equalsIgnoreCase("yes"))
			}
			params?.filter_wardrobe_attended_stage2?.with{
				if(!equalsIgnoreCase("any")) eq("isWardrobeAttended",equalsIgnoreCase("yes"))
			}
			params?.filter_wardrobe_stage2?.with{
				if(!equalsIgnoreCase("any")) eq("isWardrobeAvailable",equalsIgnoreCase("yes"))
			}
			params?.filter_shoot_stage2?.with{
				if(!equalsIgnoreCase("any")){	eq("isRoleAvailable",equalsIgnoreCase("yes")) }
			}
			params?.filter_shoot_attended_stage2?.with{
				if(!equalsIgnoreCase("any")) eq("isRoleAttended",equalsIgnoreCase("yes"))
			}
			params?.filter_shortlist_stage2?.with{
				if(!equalsIgnoreCase("any")) eq("isShortlist",equalsIgnoreCase("yes"))
			}
			params?.filter_confirmed_stage2?.with{
				if(!equalsIgnoreCase("any")) eq("isConfirmed",equalsIgnoreCase("yes"))
			}
			//STAGE 3
			params?.filter_callback_stage3?.with{
				if(!equalsIgnoreCase("any")){	eq("isCallbackAvailable",equalsIgnoreCase("yes")) }
			}
			params?.filter_callback_attended_stage3?.with{
				if(!equalsIgnoreCase("any")) eq("isAuditionAttended",equalsIgnoreCase("yes"))
			}
			params?.filter_wardrobe_attended_stage3?.with{
				if(!equalsIgnoreCase("any")) eq("isWardrobeAttended",equalsIgnoreCase("yes"))
			}
			params?.filter_wardrobe_stage3?.with{
				if(!equalsIgnoreCase("any")) eq("isWardrobeAvailable",equalsIgnoreCase("yes"))
			}
			params?.filter_shoot_stage3?.with{
				if(!equalsIgnoreCase("any")){	eq("isRoleAvailable",equalsIgnoreCase("yes")) }
			}
			params?.filter_shoot_attended_stage3?.with{
				if(!equalsIgnoreCase("any")) eq("isRoleAttended",equalsIgnoreCase("yes"))
			}
			params?.filter_shortlist_stage3?.with{
				if(!equalsIgnoreCase("any")) eq("isShortlist",equalsIgnoreCase("yes"))
			}
			params?.filter_confirmed_stage3?.with{
				if(!equalsIgnoreCase("any")) eq("isConfirmed",equalsIgnoreCase("yes"))
			}
			production{
				if(productionId > 0){
					idEq(productionId)
				}
			}
		}.unique().with{				
				sort{ it?.castNo	
					if(params?.sortby?.equalsIgnoreCase("castname"))it?.firstLastName
					else if(params?.sortby?.equalsIgnoreCase("castno")){ it?.castNo	}
					else if(params?.sortby?.equalsIgnoreCase("castdate")) it?.auditionDate				
				}
			}
		
		return profiles
	} //end doStage1Filter
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
