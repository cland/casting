package com.cland.casting


public enum CastEventType {
	AUDITION("Audition"),
	CALLBACK("Callback"),
	WARDROPE("Wardrope"),
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
		[AUDITION,CALLBACK,WARDROPE,SHOOT]
	}
}
