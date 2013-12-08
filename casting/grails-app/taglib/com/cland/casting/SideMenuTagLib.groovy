package com.cland.casting


class SideMenuTagLib {
	def castingApiService
	def sideMenu = {attrs, body ->
		
		def menuLink = "../layouts/" + castingApiService.getSideMenuName()
		out << render(template:menuLink)
		
	}
}
