package com.cland.casting
import org.codehaus.groovy.grails.plugins.springsecurity.*
import org.springframework.security.core.GrantedAuthority 
import org.springframework.security.core.userdetails.User

class CustomUserDetails  extends GrailsUser {
	final String fullName
	
	CustomUserDetails(
		String username, 
		String password, 
		boolean enabled, 
		boolean accountNonExpired, 
		boolean credentialsNonExpired, 
		boolean accountNonLocked, 
		Collection<GrantedAuthority> authorities, 
		long id, 
		String fullName) 
	{ 
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities, id)	
		this.fullName = fullName 
	}
} //end class
