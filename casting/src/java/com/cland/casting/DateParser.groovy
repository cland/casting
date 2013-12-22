package com.cland.casting

class DateParser {
	def static fromString = {fmt, str -> 
		if(fmt.equals("")) fmt = "yyyy-M-d"
		Date.parse(fmt,str)
	}
}
