package com.cland.casting


public enum CastEventType {
	AUDITION("Audition"),
	CALLBACK("Callback"),
	WARDROBE("Wardrobe"),
	SHOOT("Shoot")
	
	final String value
	
	CastEventType(String value) {
		this.value = value;
	}
	
	String toString(){
		value;
	}
	
	String getKey(){
		name()
	}

	static list() {
		[AUDITION,CALLBACK,WARDROBE,SHOOT]
	}
}
