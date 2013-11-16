
import com.cland.casting.*
import grails.util.*
import org.springframework.web.context.support.*;
import org.codehaus.groovy.grails.commons.*;
import groovy.ui.Console;

class BootStrap {

	def init = { servletContext ->
		/**
		 * Launch the console to allow us to run scripts etc while site is running
		 */

		boolean showGroovyConsole = false

		if (Environment.getCurrent() == Environment.DEVELOPMENT && showGroovyConsole) {

			def appCtx = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext)

			def grailsApp = appCtx.getBean(GrailsApplication.APPLICATION_ID);

			Binding b = new Binding();

			b.setVariable("ctx", appCtx);

			def console = new Console(grailsApp.classLoader, b);

			console.run()

		}

		println "Bootstrap > environment: " + Environment.getCurrent()
		switch(Environment.getCurrent()){
			case "DEVELOPMENT":
//				def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true, failOnError:true)
//				def directorRole = new Role(authority: 'ROLE_DIRECTOR').save(flush: true, failOnError:true)
//				def agentRole = new Role(authority: 'ROLE_AGENT').save(flush: true, failOnError:true)
//				def reviewerRole = new Role(authority: 'ROLE_REVIEWER').save(flush: true, failOnError:true)
//
//				def sa = new Country(name:"South Africa")
//				sa.addToRegions(new Region(name:"Western Cape"))
//				sa.addToRegions(new Region(name:"KZN"))
//				sa.addToRegions(new Region(name:"Limpopo"))
//				sa.addToRegions(new Region(name:"Mpumalanga"))
//				sa.addToRegions(new Region(name:"Gauteng"))
//				sa.addToRegions(new Region(name:"North West"))
//				sa.addToRegions(new Region(name:"Free State"))
//				sa.addToRegions(new Region(name:"Eastern Cape"))
//				sa.addToRegions(new Region(name:"Northern Cape"))
//				sa.save()
//				if(sa.hasErrors()){
//					println(sa.errors)
//				}
//				
//				new Race(name:"Black").save()
//				new Race(name:"White").save()
//				new Race(name:"Indian").save()
//				new Race(name:"Other").save()
//				
//			//* Admin user
//				def adminUser = new User(username: 'admin',
//				enabled: true,
//				password: 'password',
//				firstName: 'System',
//				lastName: 'Admin',
//				idNo :"3456753463453",
//				contactNo : "021334232",
//				dateOfBirth:(new Date() - 365*30),
//				gender:"Male",
//				address:"123 Main St",
//				city:"Cape Town",
//				email:"jay@whereever.com")
//
//				adminUser.save()
//				if(adminUser.hasErrors()){
//					println adminUser.errors
//				}
//				UserRole.create(adminUser, adminRole, true)
//
//			//** ordinary user
//				def directorUser1 = new User(username: 'mary',
//				enabled: true,
//				password: 'password',
//				firstName: 'Mary',
//				lastName: 'Brown',
//				idNo :"1234567890123",
//				contactNo : "011834232",
//				dateOfBirth:(new Date() - 365*30),
//				gender:"Female",
//				address:"12 Main1 St",
//				city:"Gauteng",
//				email:"user1@whereever.com")
//
//				directorUser1.save()
//				if(directorUser1.hasErrors()){
//					println directorUser1.errors
//				}
//				UserRole.create(directorUser1, directorRole, true)
//				def directorUser2 = new User(username: 'john',
//					enabled: true,
//					password: 'password',
//					firstName: 'John',
//					lastName: 'Smith',
//					idNo :"6234887800123",					
//					contactNo : "011834232",
//					dateOfBirth:(new Date() - 365*30),
//					gender:"Female",
//					address:"12 Main1 St",
//					city:"Gauteng",
//					email:"user1@whereever.com")
//	
//					directorUser2.save()
//					if(directorUser2.hasErrors()){
//						println directorUser2.errors
//					}
//					UserRole.create(directorUser2, directorRole, true)
//
//			//** candidates
//					def candidate1 = new User(username: 'candidate1',
//						enabled: true,
//						password: 'password',
//						firstName: 'Kay',
//						lastName: 'Candidate1',
//						idNo :"44444",
//						contactNo : "0000",
//						dateOfBirth:(new Date() - 365*30),
//						gender:"Female",
//						address:"none",
//						city:"Durban",
//						email:"c1@whereever.com")
//					
//						candidate1.save()
//						if(candidate1.hasErrors()){
//							println candidate1.errors
//						}
//					
//				def cand1 = new Candidate(person:candidate1,clothing:"34",shoe:"8",waist:"32",height:"5.6ft",hair:"black",eyes:"blue")
//				def picset1 = new PictureSet(name:"Pic set1")
//				def picset2 = new PictureSet(name:"Pic set2")
//				def vidset1 = new VideoSet(name:"Vid set1")
//				def vidset2 = new VideoSet(name:"Vid set2")
//				cand1.addToPictures(picset1)
//				cand1.addToPictures(picset2)
//				cand1.addToVideos(vidset1)
//				cand1.addToVideos(vidset2)
//				cand1.save()
//				if(cand1.hasErrors()){
//					println cand1.errors
//				}
//				
//				
//				def candiate2 = new User(username: 'candidate2',
//				enabled: true,
//				password: 'password',
//				firstName: 'Zuma',
//				lastName: 'Candidate2',				
//				idNo :"1234567890123",
//				contactNo : "0314334232",
//				dateOfBirth:(new Date() - 365*30),
//				gender:"Female",
//				address:"12 Main1 St",
//				city:"Durban",
//				email:"c2@whereever.com")
//
//				candiate2.save()
//				if(candiate2.hasErrors()){
//					println candiate2.errors
//				}
//				
//				
//				def reviewer1 = new User(username: 'reviewer',
//					enabled: true,
//					password: 'password',
//					firstName: 'Tom',
//					lastName: 'Reviewer1',	
//					idNo :"9234567890123",
//					contactNo : "0314334232",
//					dateOfBirth:(new Date() - 365*30),
//					gender:"Female",
//					address:"12 Main1 St",
//					city:"Pretoria",
//					email:"t1@whereever.com")
//	
//					reviewer1.save()
//					if(reviewer1.hasErrors()){
//						println reviewer1.errors
//					}
//					UserRole.create(reviewer1, reviewerRole, true)
//
//					def org1 = new Organisation(name:"Cape Agency",type:"Agency")
//					org1.save()
//					if(org1.hasErrors()){
//						println org1.errors
//					}
//					def org2 = new Organisation(name:"Coke",type:"Client")
//					org2.save()
//					if(org2.hasErrors()){
//						println org2.errors
//					}
//					def agency = new Agency(company:org1)
//					agency.save()
//					if(agency.hasErrors()){
//						println agency.errors
//					}
//					def client = new Client(company:org2)
//					def production = new Production(name:"Cape Advert",description:"This is the Cape Advert Description")
//					client.addToProductions(production) 
//					client.save()
//					if(client.hasErrors()){
//						println client.errors
//					}
//					
					
				break
			case "PRODUCTION" :
				

				break
		}
	} //end init


	def destroy = {
	}
} //end class
