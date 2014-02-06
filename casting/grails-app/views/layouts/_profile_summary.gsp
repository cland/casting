<!-- div SUMMARY structure -->
<%@ page import="com.cland.casting.SystemRoles" %>
<%@ page import="com.cland.casting.Candidate" %>
<%@ page import="com.cland.casting.Rating" %>

<g:set var="adminRating" value="${
	Rating.find("from Rating as r where r.ratingType=:rtype and r.profile.id=:profileid" , [rtype: SystemRoles.ROLE_ADMIN.toString(),profileid:profile?.id?.toLong()])	
	}"/>
<g:set var="directorRating" value="${
Rating.find("from Rating as r where r.ratingType=:rtype and r.profile.id=:profileid" , [rtype: SystemRoles.ROLE_DIRECTOR.toString(),profileid:profile?.id?.toLong()])
}"/>
     <div id="row-${profile?.id }" class="summary-row">
     <g:hiddenField name="profiles" value="${profile.id}"/>
         <div id="cast-details-${profile?.id }" class="cast-details">
         	<div class="cast-details-data-table">
         		<div class="row castnum">
            		<div class="cell"><label>Casting No.:</label></div>
            		<div class="cell"><span class="property-value">${profile?.castNo }</span></div>
            	</div>
            	<div class="row">
           			<div class="cell"><label>Casting Role:</label></div>
            		<div class="cell">
            			<g:each in="${profile.roles}" var="r">
						<span class="property-value">${r?.encodeAsHTML()}</span>
						</g:each>  
					</div>          		           	
            	</div>            	
            	<div class="row name">
            		<div class="cell"><label>Name:</label></div>
            		<div class="cell"><span class="property-value"><g:link target="_new" controller="castingProfile" action="show" id="${profile.id }">${profile?.firstLastName }</g:link></span></div>
            	</div>
            	<div class="row age">
            		<div class="cell"><label>Age:</label></div>
            		<div class="cell"><span class="property-value">${profile?.age }</span></div>
            	</div>
            	<div class="row blank"></div>
            	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
            		<g:hiddenField name="rating.admin.id_${profile?.id}" value="${adminRating?.id }"/>
					<g:hiddenField name="rating.admin.type_${profile?.id}" value="${SystemRoles.ROLE_ADMIN }"/>
	            	<div class="row rating">
	            		<div class="cell"><label for="rating.admin.rating_${profile?.id }"><g:message code="rating.adminrating.label" default="Admin Rating" /></label></div>
	            		<div class="cell">
	            			<g:radioGroup name="rating.admin.rating_${profile?.id }" value='${adminRating?.rating }' values="['1','2','3','4','5','0']" labels="['1','2','3','4','5','none']" class="ratingadmin_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
							</g:radioGroup>
						</div>
	            	</div>
	            	<div class="row comments">	            		
						<div class="cell"><label for="rating.admin.comment_${profile?.id}"><g:message code="rating.admincomment.label" default="Admin Comment" /></label></div>
						<div class="cell">
							<div class="fieldcontain">			
								<g:textArea name="rating.admin.comment_${profile?.id}" value="${adminRating?.comments}" rows="3" cols="40"/>
							</div>			
						</div>
	            	</div>	            	
            	</sec:ifAnyGranted>
            	<sec:ifNotGranted roles="${SystemRoles.ROLE_ADMIN }">
            		<div class="row rating">
	            		<div class="cell"><label for="rating.admin.rating_${profile?.id }"><g:message code="rating.adminrating.label" default="Admin Rating" /></label></div>
	            		<div class="cell">
	            			<span class="property-value"> ${adminRating?.rating }</span>	            			
						</div>
	            	</div>
					<div class="row comments">	            		
						<div class="cell"><label for="rating.admin.comment_${profile?.id}"><g:message code="rating.admincomment.label" default="Admin Comment" /></label></div>
						<div class="cell">
							<span class="property-value">${adminRating?.comments}</span>									
						</div>
	            	</div>	            	
            	</sec:ifNotGranted>
            </div>
            
         </div>
         <div id="cast-actions-${profile?.id }" class="cast-actions">
         
         	<div class="cast-actions-data-table">
         	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
         		<div class="row vstage1_${stage} invited">
					<div class="cell"><label for="invited_${profile?.id }"><g:message code="default.invite.label" default="Request" /></label></div>
					<div class="cell">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
						<g:radioGroup name="invited_${profile?.id }" value='${profile?.isInvited }' values="['true','false']" labels="['yes','no']" class="invite_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_AGENT }">
					<img src='${resource(dir: 'images/icons', file: (profile?.isInvited?'accept.png':'delete.png'), plugin: 'famfamfam')}'/>
					</sec:ifAnyGranted>	
					</div>	
				</div>     
			</sec:ifAnyGranted>    	
         		<div class="row vstage2_${stage} vstage1_${stage} shortlist">
					<div class="cell"><label for="shortlist_${profile?.id }"><g:message code="default.shortlist.label" default="Shortlist" /></label></div>
					<div class="cell">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_DIRECTOR }">
						<g:radioGroup name="shortlist_${profile?.id }" value='${profile?.isShortlist }' values="['true','false']" labels="['yes','no']" class="shortlist_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_AGENT }">
					<img src='${resource(dir: 'images/icons', file: (profile?.isShortlist?'accept.png':'delete.png'), plugin: 'famfamfam')}'/>
					</sec:ifAnyGranted>	
					</div>	
				</div>	
         		<div class="row vstage2_${stage} vstage3_${stage} confirmed">
					<div class="cell"><label for="confirmed_${profile?.id }"><g:message code="default.confirm.label" default="Confirm" /></label></div>
					<div class="cell">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_DIRECTOR }">
						<g:radioGroup name="confirmed_${profile?.id }" value='${profile?.isConfirmed }' values="['true','false']" labels="['yes','no']" class="confirm_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_AGENT }">
					<img src='${resource(dir: 'images/icons', file: (profile?.isConfirmed?'accept.png':'delete.png'), plugin: 'famfamfam')}'/>
					</sec:ifAnyGranted>
					</div>	
				</div>
				<div class="row blank"></div>
				<sec:ifAnyGranted roles="${SystemRoles.ROLE_DIRECTOR }">
					<g:hiddenField name="rating.director.id_${profile?.id}" value="${directorRating?.id }"/>
					<g:hiddenField name="rating.director.type_${profile?.id}" value="${SystemRoles.ROLE_DIRECTOR }"/>
	            	<div class="row rating">
	            		<div class="cell"><label for="rating_director.rating_${profile?.id }"><g:message code="rating.directorrating.label" default="Director Rating" /></label></div>
	            		<div class="cell">
	            			<g:radioGroup name="rating.director.rating_${profile?.id }" value='${directorRating?.rating}' values="['1','2','3','4','5','0']" labels="['1','2','3','4','5','none']" class="ratingdirector_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
							</g:radioGroup>
						</div>
	            	</div>
	            	<div class="row comments">            		
						<div class="cell"><label for="rating.director.comment_${profile?.id}"><g:message code="rating.directorcomment.label" default="Director Comment" /></label></div>
						<div class="cell">
							<div class="fieldcontain">			
								<g:textArea name="rating.director.comment_${profile?.id}" value="${directorRating?.comments}" rows="3" cols="40"/>
							</div>			
						</div>
	            	</div>
            	</sec:ifAnyGranted>
            	<sec:ifNotGranted roles="${SystemRoles.ROLE_DIRECTOR }">
            		<div class="row rating">
	            		<div class="cell"><label for="rating_director.rating_${profile?.id }"><g:message code="rating.directorrating.label" default="Director Rating" /></label></div>
	            		<div class="cell">
	            			<span class="property-value">${directorRating?.rating}</span>	            			
						</div>
	            	</div>
	            	<div class="row comments">            		
						<div class="cell"><label for="rating.director.comment_${profile?.id}"><g:message code="rating.directorcomment.label" default="Director Comment" /></label></div>
						<div class="cell">
							<span class="property-value">${directorRating?.comments}</span>								
						</div>
	            	</div>
            	</sec:ifNotGranted>
			</div>
		
			<br/>
			<div class="data-table">
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
				<div class="row vstage1_${stage} group">
				
					<div class="cell group"><label><g:message code="default.auditiongroup.label" default="AUDITION" />:</label></div>
					<div class="cell"><span class="r-arrow"></span> <label for="audition_${profile.id }">Available</label></div>
					<div class="cell">					
						<g:radioGroup name="audition_${profile?.id }" value='${profile?.isAuditionAvailable }' values="['true','false']" labels="['yes','no']" class="audition_avail_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</div>
					<div class="cell"><label for="audition_attended_${profile.id }">Attended:</label></div>
					<div class="cell">
						<g:radioGroup name="audition_attended_${profile?.id }" value='${profile?.isAuditionAttended }' values="['true','false']" labels="['yes','no']" class="audition_attend_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</div>
				</div>
			</sec:ifAnyGranted>
				<div class="row vstage2_${stage} vstage3_${stage} group">
					<div class="cell group"><label><g:message code="default.callbackgroup.label" default="CALLBACK" />:</label></div>
					<div class="cell"><span class="r-arrow"></span> <label for="callback_${profile?.id }">Available</label></div>
					<div class="cell">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
						<g:radioGroup name="callback_${profile?.id }" value='${profile?.isCallbackAvailable }' values="['true','false']" labels="['yes','no']" class="callback_avail_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_DIRECTOR }">
					<img src='${resource(dir: 'images/icons', file: (profile?.isCallbackAvailable?'accept.png':'delete.png'), plugin: 'famfamfam')}'/>
					</sec:ifAnyGranted>
					</div>
					<div class="cell"><label for="callback_attended_${profile?.id }">Attended:</label></div>
					<div class="cell">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
						<g:radioGroup name="callback_attended_${profile?.id }" value='${profile?.isCallbackAttended }' values="['true','false']" labels="['yes','no']" class="callback_attend_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_DIRECTOR}">
					<img src='${resource(dir: 'images/icons', file: (profile?.isCallbackAttended?'accept.png':'delete.png'), plugin: 'famfamfam')}'/>
					</sec:ifAnyGranted>
					</div>
				</div>
				<div class="row vstage2_${stage} vstage3_${stage} group">
					<div class="cell group"><label><g:message code="default.wardrobegroup.label" default="WARDROBE" />:</label></div>
					<div class="cell"><span class="r-arrow"></span> <label for="wardrobe_${profile?.id }">Available</label></div>
					<div class="cell">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
						<g:radioGroup name="wardrobe_${profile?.id }" value='${profile?.isWardrobeAvailable }' values="['true','false']" labels="['yes','no']" class="wardrobe_avail_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_DIRECTOR }">
					<img src='${resource(dir: 'images/icons', file: (profile?.isWardrobeAvailable?'accept.png':'delete.png'), plugin: 'famfamfam')}'/>
					</sec:ifAnyGranted>
					</div>
					<div class="cell"><label for="wardrobe_attended_${profile?.id }">Attended:</label></div>
					<div class="cell">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
						<g:radioGroup name="wardrobe_attended_${profile?.id }" value='${profile?.isWardrobeAttended }' values="['true','false']" labels="['yes','no']" class="wardrobe_attend_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_DIRECTOR }">
					<img src='${resource(dir: 'images/icons', file: (profile?.isWardrobeAttended?'accept.png':'delete.png'), plugin: 'famfamfam')}'/>
					</sec:ifAnyGranted>
					</div>
				</div>	
				<div class="row vstage2_${stage} vstage3_${stage} group">
					<div class="cell group"><label><g:message code="default.shootgroup.label" default="SHOOT" />:</label></div>
					<div class="cell"><span class="r-arrow"></span> <label for="shoot_${profile?.id }">Available</label></div>
					<div class="cell">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
						<g:radioGroup name="shoot_${profile?.id }" value='${profile?.isRoleAvailable }' values="['true','false']" labels="['yes','no']" class="shoot_avail_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_DIRECTOR }">
					<img src='${resource(dir: 'images/icons', file: (profile?.isRoleAvailable?'accept.png':'delete.png'), plugin: 'famfamfam')}'/>
					</sec:ifAnyGranted>						
					</div>
					<div class="cell"><label for="shoot_attended_${profile?.id }">Attended:</label></div>
					<div class="cell">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
						<g:radioGroup name="shoot_attended_${profile?.id }" value='${profile?.isRoleAttended }' values="['true','false']" labels="['yes','no']" class="shoot_attend_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_DIRECTOR }">
					<img src='${resource(dir: 'images/icons', file: (profile?.isRoleAttended?'accept.png':'delete.png'), plugin: 'famfamfam')}'/>
					</sec:ifAnyGranted>	
					</div>
				</div>											
			</div>
		
         </div>
         <div id="cast-mugshot-${profile?.id }" class="cast-mugshot">
 			<g:set var="hasphoto" value="${false }"/>
		    <attachments:each bean="${profile?.pictures}" inputName="headshot" status="j">	         
				<g:if test="${j==0}">
					<g:set var="hasphoto" value="${true }"/>
					<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>		
				</g:if>			
			</attachments:each>	
			<g:if test="${!hasphoto }">
				<attachments:each bean="${Candidate.get(profile?.candidate?.id)}" inputName="headshot" status="m">	         
				<g:if test="${m==0}">
				<g:set var="hasphoto" value="${true }"/>
					<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>		
				</g:if>			
			</attachments:each>
			<g:if test="${!hasphoto }">				
				<img src="${request.contextPath}/images/noimage.gif"/>
			</g:if>
			</g:if>			
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
				<g:if test="${hasphoto==false}"> 
					<br/>
					<g:if test="${ profile?.pictures}">
						<g:link class="edit" controller="pictureSet" action="edit" id="${profile?.pictures?.id}">
							<g:message code="default.add.label" args="['Photo']"/>
						</g:link>
					</g:if>
					<g:else>
						<g:link class="create" controller="pictureSet" action="create" params="${['castingProfile.id':profile?.id]}">
						<g:message code="default.add.label" args="['Photo']"/>
						</g:link>
					</g:else>
				</g:if>
			</sec:ifAnyGranted>
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_DIRECTOR },${SystemRoles.ROLE_AGENT }">
             	<div class="profile-text"><g:link controller="castingProfile" action="show" id="${profile.id }">${profile?.firstLastName }</g:link></div>
             </sec:ifAnyGranted>                
         </div>            
     </div>     

