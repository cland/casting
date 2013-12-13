package com.cland.casting

class UserTagTagLib {
	def castingApiService
	def userFullname = { attrs, body ->
			Long id = attrs?.id?.toLong()
			def value = castingApiService.getUserFullname(id)
			if(value.equals("")) value = attrs?.default
		  out << value
		
	  }
}
