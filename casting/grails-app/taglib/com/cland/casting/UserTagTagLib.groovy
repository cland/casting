package com.cland.casting

class UserTagTagLib {
	def castingApiService
	def userFullname = { attrs, body ->
			Long id = attrs?.id?.toLong()
			def value = castingApiService.getUserFullname(id)
			if(value.equals("")) value = attrs?.default
		  out << value
		
	  }
	
	def agencyId = {attrs, body ->
		def result = 0
		if(castingApiService.isAgent()){
			result = castingApiService.getAgencyForUser(castingApiService.getCurrentUserId())?.find{true}?.id
		}
		out << result
	}
	def clientId = {attrs,body ->
		def result = 0
		if(castingApiService.isClient()){
			result = castingApiService.getClientForUser(castingApiService.getCurrentUserId())?.find{true}?.id
		}
		out << result
	}
} //
