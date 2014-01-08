package com.cland.casting

class CastingMailService {
	static transactional = false
	def mailService
    def sendProductionMail(Production production) {
		def _subject = "Production ${production?.name} has been created. Status: ${production?.status}"
		def _body = '<b>${production?name}</b> requires candidates. Please visiting http://new.castingcapetown.com/casting/production/${production?.id}'
		try{
		mailService.sendMail {
			to "dembaremba@gmail.com"
			from "droid.cleverland@gmail.com"
			subject _subject
			html _body
		}
		}catch(Exception ex){
			println("Failed to send mail: ...")
			ex.printStackTrace()
		}
    }
} //end service
