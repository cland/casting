package com.cland.casting

import grails.plugins.springsecurity.Secured

class HomeController {
	def index = {
//		if (!isLoggedIn()) {
//			redirect(controller:"Login")
//			return false;
//		}
		//redirect(action: "inde", params: params)
		
	}

	def casting = {
		//determine who is currently logged in and redirect them to the appropriate section:
		//agency: To the login agency's profile
		//client: to the login in client's profile
		//admin: to the admin section
		redirect(uri:"/admin/")
	}
} //end of class
