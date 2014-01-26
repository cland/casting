// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format
//grails.config.locations = [ "classpath:${appName}-config.properties",
//	"classpath:${appName}-config.groovy",
//	"file:${userHome}/.grails/${appName}-config.properties",
//	"file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format	change to false if weceem is enabled
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml'],
	pdf: 'application/pdf',
	rtf: 'application/rtf',
	excel: 'application/vnd.ms-excel',
	ods: 'application/vnd.oasis.opendocument.spreadsheet'
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false
//attachments

//grails.attachmentable.uploadDir = "C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\temp" //YOUR_USER_HOME/APP_NAME
grails.attachmentable.poster.evaluator = { getPrincipal() } //
environments {
    development {
		casting {
			theme {
				name = "" //"" == DEFAULT:ui-lightnes | OTHER OPTIONS: "black-tie"|"blitzer"|"south-street"|"smoothness"|"redmond"
				if(casting.theme.name != ""){
					maincss =casting.theme.name + "/main.css"
					printcss =casting.theme.name + "/print.css"		
				}else{
					maincss="main.css"
					printcss="print.css"
				}	
			}			
		}
		grails.resources.modules = {
			if(casting.theme.name != "" ){
			overrides {
				'jquery-theme' {
					resource id:'theme', url:'/css/'+casting.theme.name+'/jquery-ui-1.10.4.custom.css'
				}
			}
			}
		}

		ckeditor {
			config = "/js/ckeditor/ckconfig.js"
				skipAllowedItemsCheck = false
			defaultFileBrowser = "ofm"
			upload {
				basedir = "C:" + File.separator + "Users" + File.separator + "Cland" + File.separator + "temp" + File.separator + "ckeditor" + File.separator + "uploads"
					overwrite = false
					link {
						browser = true
						upload = false
						allowed = []
						denied = ['html', 'htm', 'php', 'php2', 'php3', 'php4', 'php5',
								  'phtml', 'pwml', 'inc', 'asp', 'aspx', 'ascx', 'jsp',
								  'cfm', 'cfc', 'pl', 'bat', 'exe', 'com', 'dll', 'vbs', 'js', 'reg',
								  'cgi', 'htaccess', 'asis', 'sh', 'shtml', 'shtm', 'phtm']
					}
					image {
						browser = true
						upload = true
						allowed = ['jpg', 'gif', 'jpeg', 'png']
						denied = []
					}
					flash {
						browser = false
						upload = false
						allowed = ['swf']
						denied = []
					}
			}
		}
	
//		weceem {
//			tools.prefix = 'wcm-tools'
//			admin.prefix = 'wcm-admin'
//			upload.dir = "C:" + File.separator + "Users" + File.separator + "Cland" + File.separator + "temp" + File.separator + "weceem" + File.separator + "uploads"
//			weceem.logout.url = [controller:'admin', action:'logout']
//			weceem.login.url = [controller:'admin',action:'login']
//			weceem.profile.url = [controller:'register', action:'edit']
//			//weceem.admin.layout="mylayout" //This stops Weceem from using the standard "weceemadmin" GSP layout and uses yours instead.
//			weceem.security.policy.path = "C:" + File.separator + "Users" + File.separator + "Cland" + File.separator + "temp" + File.separator + "weceem" + File.separator + "policy" + File.separator + "weceem-policy.groovy"
//			springsecurity.details.mapper = { ->
//				[ // Stuff required by weceem spring sec
//					username: username,
//					password: password,
//					enabled: enabled,
//					authorities: authorities,
//					// optional stuff we add
//					email: email,
//					//description: description,
//					firstName: firstName,
//					lastName: lastName,
//					id: id
//				]
//			}
//		}
		grails.attachmentable.maxInMemorySize = 1024
		grails.attachmentable.maxUploadSize = 31457280
        grails.logging.jul.usebridge = true
		grails.attachmentable.uploadDir = "C:" + File.separator + "Users" + File.separator + "Cland" + File.separator + "temp"
		grails{
			mail {
			     host = "smtp.gmail.com"
			     port = 465
			     username = "droid.cleverland@gmail.com"
			     password = "G3ttyNyangani10"
			     props = ["mail.smtp.auth":"true", 					   
			              "mail.smtp.socketFactory.port":"465",
			              "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
			              "mail.smtp.socketFactory.fallback":"false"]
			
			}
        }
    }
    production {
        grails.logging.jul.usebridge = false
        //grails.serverURL = "http://www.changeme.com"
		
//		grails.attachmentable.maxInMemorySize = 1024
//		grails.attachmentable.maxUploadSize = 31457280
//		grails.attachmentable.uploadDir = "/var/grails/uploads/taglets/${appName}"
		
		if (System.properties["os.name"] == "Linux") {
			grails.config.locations = ["file:" + File.separator + "var" + File.separator + "grails" + File.separator + "app-conf" + File.separator + "${appName}-config.groovy"]
		}else{
			grails.config.locations = ["file:C:" + File.separator + "grails" + File.separator + "app-conf" + File.separator + "${appName}-Config.groovy"]
		}
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.cland.casting.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.cland.casting.UserRole'
grails.plugins.springsecurity.authority.className = 'com.cland.casting.Role'
grails.plugins.springsecurity.ui.encodePassword = false //added manually, jd - 19/05/2013

//grails.plugins.springsecurity.securityConfigType = "Annotation"
//grails.plugins.springsecurity.rejectIfNoRule = true

/** ORDERING: REALLY-SECURE FIRST to LESS SECURE **/
grails.plugins.springsecurity.controllerAnnotations.staticRules=[
	//'/**': ['IS_AUTHENTICATED_FULLY'],
	//** ADMIN ONLY
	'/admin/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/personRole/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/userRole/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/organisation/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/organisation/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],	
	'/organisation/list/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/role/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/user/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/user/list/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/user/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/production/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/production/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/image/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/image/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/document/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/document/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/keywords/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/keywords/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/category/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/category/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/region/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/region/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/country/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/country/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],	
	'/castingRole/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/castingRole/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/castingRole/list/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/agency/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/agency/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/agency/list/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	'/client/create/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	 '/client/edit/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	 '/client/list/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	 '/searchable/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	 '/search/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY'],
	//** GENERAL AUTHENTICATED USER
	//'/home/**': ['IS_AUTHENTICATED_FULLY'],
	'/production/show/**': ['IS_AUTHENTICATED_FULLY'],
	'/organisation/show/**': ['IS_AUTHENTICATED_FULLY'],
	'/user/show/**': ['IS_AUTHENTICATED_FULLY'],
	'/production/list/**': ['IS_AUTHENTICATED_FULLY'],
	'/home/casting/**': ['IS_AUTHENTICATED_FULLY'],
	'/agency/show**': ['IS_AUTHENTICATED_FULLY'],
	'/agencyPortfolioSet/**': ['IS_AUTHENTICATED_FULLY'],
	'/candidate/**': ['IS_AUTHENTICATED_FULLY'],
	'/castingCategory/**': ['IS_AUTHENTICATED_FULLY'],
	'/castingProfile/**': ['IS_AUTHENTICATED_FULLY'],
	'/castingRole/show/**': ['IS_AUTHENTICATED_FULLY'],
	
	'/category/**': ['IS_AUTHENTICATED_FULLY'],
	'/client/show/**': ['IS_AUTHENTICATED_FULLY'],
	'/pictureSet/**': ['IS_AUTHENTICATED_FULLY'],
	'/portfolio/**': ['IS_AUTHENTICATED_FULLY'],
	'/videoSet/**': ['IS_AUTHENTICATED_FULLY'],
	'/login/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/logout/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
	
	'/ck/**': ["hasRole('ROLE_ADMIN')",'IS_AUTHENTICATED_FULLY']
//	/ck/standard/filemanager
//	/ck/standard/uploader
//	/ck/ofm/filemanager
//	/ck/ofm/filetree
]

//Audit Trail Config

//grails{
//	plugin{
//		audittrail{
//			createdBy.field = "createdBy"
//			editedBy.field = "editedBy"
//			createdDate.field = "createdDate"
//			editedDate.field = "editedDate"
//			/*
//			// ** if field is not specified then it will default to 'createdBy'
//			createdBy.field = "createdBy"  // createdBy is default
//			// ** fully qualified class name for the type
//			createdBy.type   = "java.lang.Long" //Long is the default
//			// ** the constraints settings
//			createdBy.constraints = "nullable:false,display:false,editable:false"
//			// ** the mapping you want setup
//			createdBy.mapping = "column: 'inserted_by'" //<-example as there are NO defaults for mapping
//
//			createdDate.field = "createdDate"
//			createdDate.type  = "java.util.Date"
//			createdDate.constraints = "nullable:false,display:false,editable:false"
//			createdDate.mapping = "column: 'date_created'" //<-example as there are NO defaults for mapping
//
//			// ** Last updated by
//			editedBy.field = "lastUpdatedBy"  // createdBy is default
//			// ** fully qualified class name for the type
//			editedBy.type   = "java.lang.Long" //Long is the default
//			// ** the constraints settings
//			editedBy.constraints = "nullable:false,display:false,editable:false"
//			// ** the mapping you want setup
//			editedBy.mapping = "column: 'updated_by'" //<-example as there are NO defaults for mapping
//			
//			editedDate.field = "lastUpdatedDate"
//			editedDate.type  = "java.util.Date"
//			editedDate.constraints = "nullable:false,display:false,editable:false"
//			editedDate.mapping = "column: 'date_updated'" //<-example as there are NO defaults for mapping
//			
//			//custom closure to return the current user who is logged in
//			currentUserClosure = {ctx->
//				//ctx is the applicationContext
//				//default is basically
//				return springSecurityService.principal?.id
//			}
//			//there are NO defaults for companyId.
//			//companyId.field   = "companyId" //used for multi-tenant apps and is just the name of the field to use
//			 
//	
//			 */
//		}
//	}
//}

