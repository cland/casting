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
		return alldata?.unique()
	} //
	
	def getProductions(long agencyId, int offset, int max){
		def user = springSecurityService?.currentUser
		def productionList = []
		if(isAdmin()){
			productionList = Production.withCriteria { isEmpty("agencyACL") }
			def tmpList = Production.withCriteria {
				if(agencyId > 0) agencyACL { idEq(agencyId) }
				//firstResult(offset)
				maxResults(max)
				order("status", "asc")
			}
			productionList.addAll(tmpList)
		}else if(isDirector()){
		
			def clientId = 0	//force agencyId to something that returns empty results
			def clientInstance = getClientForUser(user.id)?.find{true}			
			if(clientInstance){
				 clientId = clientInstance?.id 
			}
			
			def tmpList = Production.withCriteria {
				client { idEq(clientId) }
				//firstResult(offset)
				maxResults(max)
				order("startDate", "desc")
			}
			
			productionList.addAll(tmpList)
		}else{
			productionList = Production.withCriteria { isEmpty("agencyACL") }
			agencyId = 0	//force agencyId to something that returns empty results
			def agency = getAgencyForUser(user.id)?.find{true}
			//if an agency entity exists, then set the id so that he/she can only see her own list of candidates.
			if(agency){			
				 agencyId = agency?.id //?.get(0)
			}
			def tmpList = Production.withCriteria {
				agencyACL { idEq(agencyId) }
				//firstResult(offset)
				maxResults(max)
				order("status", "asc")
			}
			productionList.addAll(tmpList)
		}
		return productionList.sort{it.name}?.unique() //.reverse() // Production.list() //
	} //end function
	def getPortfoliosAllowed(Production prod){
		def portfolioList = prod?.portfolios
		if(isAdmin() || isDirector()){
			return portfolioList
		}
		//else agency we check if they are in the acl list
		long agencyId = 0
		def user = getCurrentUser()
		def agency = getAgencyForUser(user.id)?.find{true}
		def tmpList = [:]
		if(agency){
			agencyId = agency?.id
			tmpList = Portfolio.withCriteria {
				agencyAcl { idEq(agencyId) }
				//firstResult(offset)
				//maxResults(max)
				order("name", "asc")
			}
		}
		return tmpList
	} //end 
	def getAllowedRoles(Production prod, long agencyId){
		def productionRoles = prod?.roles
		
		if(isAdmin() || isDirector()){		
			return productionRoles
		}
		
		def user = getCurrentUser()
		agencyId = 0	//force agencyId to something that returns empty results
		def agency = getAgencyForUser(user.id)?.find{true}

		//First get all the allowed roles
		//def test1  =  CastingRole.withCriteria { isEmpty("allowedCategories") eq("production.id",prod.id.toLong()) }.unique()
		def rolesList = productionRoles?.findAll { it.allowedCategories.isEmpty()}
		
		//if an agency entity exists, then set the id so that he/she can only see her own list of candidates.		
		if(agency){
			 agencyId = agency.id
			 def agencyCategories = agency?.categories
			 def restrictedRoles = productionRoles?.findAll { !(it.allowedCategories.isEmpty())}
			 restrictedRoles.each{role ->
				 //if agency is in the allowed agencyACL list then add, else test the categories
				 if(role?.agencyACL?.contains(agency)) {
					 rolesList.add(role)
				 }else {
					 //if role.allowedCategories contains 1 or more categories of given agency then include
					 agencyCategories.each{cat ->
	
						 if(role?.allowedCategories?.contains(cat)) rolesList.add(role)
					 }
				 }		 
			 } //end each restrictedRoles
		} //end if agency
		return rolesList?.unique()?.sort{it.name}
	}
	/*
	 * Given a production, it computes all the key dates defined on the roles if any
	 * These are: AUDITION_DATES, CALLBACK_DATES, WARDROBE_DATES, SHOOT_DATES
	 * Returns: an array of unique dates as defined by all the roles for the production
	 */
	def getProductionDates(Production production){
		List auditionDates = []
		List callbackDates = []
		List wardrobeDates = []
		List shootDates = []
		//loop through the available roles
		production?.roles?.each {role->
			auditionDates.addAll(role?.auditionDates)
			callbackDates.addAll(role?.callbackDates)
			wardrobeDates.addAll(role?.wardrobeDates)
			shootDates.addAll(role?.shootDates)
		}
		return [auditionDates:auditionDates?.sort()?.unique(),
			callbackDates:callbackDates?.sort()?.unique(),
			wardrobeDates:wardrobeDates?.sort()?.unique(),
			shootDates:shootDates?.sort()?.unique()]
	} //end function
	
	def getCandidates(long productionId, long agencyId, def params){
		return getCandidates(productionId,agencyId, true,params)		
	} //end function getAgencyCandidates
	
	def getCandidates(long productionId, long agencyId, boolean with_profiles,def params){
		def user = getCurrentUser() //springSecurityService.currentUser
		def candidateList = []
		def max = (params?.max ? params?.max:100)
		def offset = (params?.offset ? params?.offset : 0)
		def sortItem =(params?.sort ? params?.sort:null)
		def byorder =  (params?.order ? params?.order:null)
		if(isAdmin()){
			//if admin return all candidates for a given agencyId
			candidateList = Candidate.createCriteria().list(offset:offset, max:max){
				createAlias('agency','agency')
				createAlias('person','person')
				if(!sortItem){
					order('agency.company','desc')
					order('person.firstName','asc')
				}else{				
					order(sortItem,byorder)
				}
				if(agencyId > 0) eq('agency.id',agencyId)  //if not valid id is provided ignore this rule so that all candidates will be returned.
				if(max > 0) maxResults(max)
				//ilike('hair','black')
			}
		}else{
			//current user is not admin, check if he/she is agency contact
			agencyId = 0	//force agencyId to something that returns empty results
			def agency = getAgencyForUser(user.id)?.find{true}
			//if an agency entity exists, then set the id so that he/she can only see her own list of candidates.
			if(agency) agencyId = agency.id
			candidateList = Candidate.createCriteria().list(offset:offset, max:max){
				createAlias('person','person')
				createAlias('agency','agency')
				if(!sortItem){
					order('agency.company','desc')
					order('person.firstName','asc')
				}else{
					order(sortItem,byorder)
				}
				eq('agency.id',agencyId)
				if(max > 0) maxResults(max)
				//ilike('hair','black')
			}
		}
		
		if(!with_profiles){
			//remove candidates that are already in the production list ??
			def list_to_remove = []
			candidateList.each{ candidate ->
				def tmpProfiles = getProfiles(productionId,candidate.id,0,1)
				if(tmpProfiles.size()>0){
					//we need to exclude this candidate, already has a profile for this production
					list_to_remove.add(candidate)
				}
			}
			//remove the items
			candidateList.removeAll(list_to_remove)
		}
		
		return candidateList
	}
	def getCandidatesCount(long productionId, long agencyId, boolean with_profiles,def params){
		def user = getCurrentUser() //springSecurityService.currentUser
		def candidateList = []
		
		if(isAdmin()){
			//if admin return all candidates for a given agencyId
			candidateList = Candidate.createCriteria().list(){
				createAlias('agency','agency')
				createAlias('person','person')				
				if(agencyId > 0) eq('agency.id',agencyId)  //if not valid id is provided ignore this rule so that all candidates will be returned.
			}
		}else{
			//current user is not admin, check if he/she is agency contact
			agencyId = 0	//force agencyId to something that returns empty results
			def agency = getAgencyForUser(user.id)?.find{true}
			//if an agency entity exists, then set the id so that he/she can only see her own list of candidates.
			if(agency) agencyId = agency.id
			candidateList = Candidate.createCriteria().list(){
				createAlias('person','person')
				createAlias('agency','agency')
				
				eq('agency.id',agencyId)				
			}
		}
		
		if(!with_profiles){
			//remove candidates that are already in the production list ??
			def list_to_remove = []
			candidateList.each{ candidate ->
				def tmpProfiles = getProfiles(productionId,candidate.id,0,1)
				if(tmpProfiles.size()>0){
					//we need to exclude this candidate, already has a profile for this production
					list_to_remove.add(candidate)
				}
			}
			//remove the items
			candidateList.removeAll(list_to_remove)
		}
		
		return candidateList.size()
	}
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
		def status = ""
		if(isAdmin()) return "/production/list"
		if(isAgent()){
			//work out the agency that this user belongs to
			def agency = getAgencyForUser(userId)?.find{true}			
			if(agency?.id){
				//return agency's details link
				return "/agency/show/" + agency?.id + "?sidebar=0"
			}else{
			status="agencylinked=0"
			}
		}
		if (isClient()){
			//work out the client that this user belongs to
			def client = getClientForUser(userId)?.find{true}
			
			if(client){
				//return client's details link
				//return "/client/show/" + client?.id + "?sidebar=0"
				return "/production/list?sidebar=0"
			}else{
				status="clientlinked=0"
			}
		}
		
		//else we return the user back to home page.
		return "/?" + status
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
	boolean canViewProduction(Production productionInstance, User user){
		if(!user){
			user = getCurrentUser()
		}
		//if director, check if this belongs to the login in 'client'
		if(isClient()){
			def client = getClientForUser(user?.id)?.find{true}
			if(!client | client?.id != productionInstance?.client?.id){				
				return false
			}
		}
		if(isAgent()){
			
			def agency = getAgencyForUser(user.id)?.find{true}
			if(!productionInstance?.agencyACL.isEmpty()){
				if(!productionInstance?.agencyACL?.contains(agency)){					
					return false
				}
			}
		}
		return true
	} //end method canViewProduction
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
				def agency = getAgencyForUser(user.id)?.find{true} //user.id				
				if(agency) agencyId = agency.id
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
		}.unique().
				sort{
					if(params?.sortby?.equalsIgnoreCase("castname"))it?.firstLastName
					else if(params?.sortby?.equalsIgnoreCase("castdate")) it?.auditionDate
					else {it?.castNo}
				}
			//}
		
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
