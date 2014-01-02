<!-- div DETAILED structure -->
<%@ page import="com.cland.casting.SystemRoles" %>
<g:set var="candidate" value="${profile?.candidate }"/>
<div id="row-${profile?.id }" class="detailed-row">	
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
	       	<div class="cell"><span class="property-value">
	       		<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
             	<div class="profile-text"><g:link controller="castingProfile" action="show" id="${profile.id }">${profile?.firstLastName }</g:link></div>
            	 </sec:ifAnyGranted>
	       		<sec:ifNotGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">${profile?.firstLastName }</sec:ifNotGranted>
	       	</span>
	       </div>
	       </div>
           	<div class="row age">
           		<div class="cell"><label>Age:</label></div>
           		<div class="cell"><span class="property-value">${profile?.age }</span></div>
           	</div>
	       <div class="row height">
	       	<div class="cell"><label>Height:</label> </div>
	       	<div class="cell"><span class="property-value">${candidate?.height }</span> </div>
	       </div>
	       <div class="row contactno">
	       	<div class="cell"><label>Contact No.:</label></div>
	       	<div class="cell"><span class="property-value">${candidate?.person?.contactNo }</span> </div>
	       </div>
	       <div class="row agency">
	       	<div class="cell"><label>Agency:</label></div>
	       	<div class="cell"> <span class="property-value">${candidate?.agency }</span></div>
	       </div>
	       <div class="row castdate">
	       	<div class="cell"> <label>Date Cast:</label></div>
	       	<div class="cell"> <span class="property-value"><g:formatDate date="${profile?.castDate }" format="dd-MMM-yyyy"/></span></div>
	       </div>
	       <div class="row agencyno">
	       	<div class="cell"><label>Agency Tel.:</label></div>
	       	<div class="cell"><span class="property-value">${candidate?.agency?.company?.phoneNo }</span> </div>
	       </div>
	       <div class="row clothing">
	       	<div class="cell"><label>Dress/Suit</label></div>
	       	<div class="cell"><span class="property-value">${candidate?.clothing }</span> </div>
	       </div>
	
	       <div class="row waist">
	       	<div class="cell"><label>Waist</label></div>
	       	<div class="cell"> <span class="property-value">${candidate?.waist }</span></div>
	       </div>
	       <div class="row shoe">
	       	<div class="cell"><label>Shoe</label></div>
	       	<div class="cell"><span class="property-value">${candidate?.shoe }</span> </div>
	       </div>
	       <div class="row average-rating">
	       	<div class="cell"><label>Director's rating:</label></div>
	       	<div class="cell"><span class="property-value">${profile?.averating }</span> </div>
	       </div>
	       	       
	    </div>
	    
	    <fieldset class="comments-container"><legend>Comments</legend>
   		<p class="advice">No comments!</p>
	</fieldset>
    </div>
    
    <div id="cast-actions-${profile?.id }" class="cast-actions">
       	
    </div>
    
    <div id="cast-mugshot-${profile?.id }" class="cast-mugshot-container">
    <div class="cast-mugshot">
       <g:set var="hasphoto" value="${false }"/>
		    <attachments:each bean="${profile?.pictures}" inputName="headshot" status="j">	         
				<g:if test="${j==0}">
					<g:set var="hasphoto" value="${true }"/>
					<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>		
				</g:if>			
			</attachments:each>	
			
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
				<g:if test="${hasphoto==false}"> 
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
            
	</div>
	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
	<div class="cast-actions-data-table">

         		<div class="row vstage1 invited">
					<div class="cell"><label for="invited_${profile?.id }"><g:message code="default.invited.label" default="Invited" />:</label></div>
					<div class="cell">
						<g:radioGroup name="invited_${profile?.id }" value='${profile?.isInvited }' values="['true','false']" labels="['yes','no']" class="invite_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</div>	
				</div>         	
         		<div class="row vstage1 vstage2 shortlist">
					<div class="cell"><label for="shortlist_${profile?.id }"><g:message code="default.shortlist.label" default="Shortlist" />:</label></div>
					<div class="cell">
						<g:radioGroup name="shortlist_${profile?.id }" value='${profile?.isShortlist }' values="['true','false']" labels="['yes','no']" class="shortlist_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
							</g:radioGroup>
					</div>	
				</div>	
         		<div class="row vstage2 vstage3 confirmed">
					<div class="cell"><label for="confirmed_${profile?.id }"><g:message code="default.confirmed.label" default="Confirmed" />:</label></div>
					<div class="cell">
						<g:radioGroup name="confirmed_${profile?.id }" value='${profile?.isConfirmed }' values="['true','false']" labels="['yes','no']" class="confirm_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</div>	
				</div>
			</div>
			</sec:ifAnyGranted>
			<div class="data-table">
				<div class="row vstage1 group">
					<div class="cell group"><label><g:message code="default.auditiongroup.label" default="AUDITION" />:</label></div>
					<div class="cell"><span class="r-arrow"></span> <label for="audition_${profile.id }">Available:</label></div>
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
				<div class="row vstage2 vstage3 group">
					<div class="cell group"><label><g:message code="default.callbackgroup.label" default="CALLBACK" />:</label></div>
					<div class="cell"><span class="r-arrow"></span> <label for="callback_${profile?.id }">Available:</label></div>
					<div class="cell">
						<g:radioGroup name="callback_${profile?.id }" value='${profile?.isCallbackAvailable }' values="['true','false']" labels="['yes','no']" class="callback_avail_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</div>
					<div class="cell"><label for="callback_attended_${profile?.id }">Attended:</label></div>
					<div class="cell">
						<g:radioGroup name="callback_attended_${profile?.id }" value='${profile?.isCallbackAttended }' values="['true','false']" labels="['yes','no']" class="callback_attend_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</div>
				</div>
				<div class="row vstage2 vstage3 group">
					<div class="cell group"><label><g:message code="default.wardrobegroup.label" default="WARDROBE" />:</label></div>
					<div class="cell"><span class="r-arrow"></span> <label for="wardrobe_${profile?.id }">Available:</label></div>
					<div class="cell">
						<g:radioGroup name="wardrobe_${profile?.id }" value='${profile?.isWardrobeAvailable }' values="['true','false']" labels="['yes','no']" class="wardrobe_avail_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</div>
					<div class="cell"><label for="wardrobe_attended_${profile?.id }">Attended:</label></div>
					<div class="cell">
						<g:radioGroup name="wardrobe_attended_${profile?.id }" value='${profile?.isWardrobeAttended }' values="['true','false']" labels="['yes','no']" class="wardrobe_attend_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</div>
				</div>	
				<div class="row vstage2 vstage3 group">
					<div class="cell group"><label><g:message code="default.shootgroup.label" default="SHOOT" />:</label></div>
					<div class="cell"><span class="r-arrow"></span> <label for="shoot_${profile?.id }">Available:</label></div>
					<div class="cell">
						<g:radioGroup name="shoot_${profile?.id }" value='${profile?.isRoleAvailable }' values="['true','false']" labels="['yes','no']" class="shoot_avail_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</div>
					<div class="cell"><label for="shoot_attended_${profile?.id }">Attended:</label></div>
					<div class="cell">
						<g:radioGroup name="shoot_attended_${profile?.id }" value='${profile?.isRoleAttended }' values="['true','false']" labels="['yes','no']" class="shoot_attend_radio_group">
							<span class="mugshot_radio">${it.radio } ${it.label } </span>
						</g:radioGroup>
					</div>
				</div>											
			</div>

                        
    </div>  
          
</div>     

