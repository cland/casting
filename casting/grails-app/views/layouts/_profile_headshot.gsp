<!-- div HEADSHOT structure -->
<%@ page import="com.cland.casting.SystemRoles" %>
<%@ page import="com.cland.casting.Candidate" %>
<g:set var="data_table" value=""/>
<g:set var="tmp" value=""/>
<g:set var="count_per_row" value="${3 }"/>
<g:set var="total_count" value="${profileList?.size() }"/>
<div> 
	<span class="r-arrow"></span> Displaying: <b>${total_count }</b> profiles!	
	<g:if test="${total_count > 0 && prod_id }">
		[ <g:link controller="production" action="downloadProfilesZip" params="[prod_id:prod_id,profiles:profileList?.id,portfolioId:portfolioId ]"><g:message code="default.download.media.label" default="Download" /></g:link> ]
	</g:if>
</div>
<g:each in="${profileList }"  var="profile" status="i">
	<g:set var="entry">
		<div id="entry-${profile?.id }" class="mugshot">
			<g:hiddenField name="profiles" value="${profile.id}"/>
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
			<div class="data-table">
				<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
					<div class="row">
						<div class="cell"><label class="profile-text">Name:</label></div>
						<div class="cell">							
							<g:link controller="castingProfile" action="show" id="${profile.id }">${profile.getName() }</g:link> [ ${profile.castNo } ]
						</div>
					</div>
				</sec:ifAnyGranted>
				<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
					<div class="row invited vstage1_${stage }" id="invited_${profile?.id }">
						<div class="cell"><label class="profile-text"><g:message code="default.invite.label" default="Request" />:</label></div>
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
					<div class="row vstage1_${stage} vstage2_${stage} shortlist" id="shortlist_${profile?.id }">
						<div class="cell"><label class="profile-text"><g:message code="default.shortlist.label" default="Shortlist" />:</label></div>
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
					<div class="row confirm vstage2_${stage} vstage3_${stage}" id="confirm_${profile?.id }">
						<div class="cell"><label class="profile-text"><g:message code="default.confirm.label" default="Confirm" />:</label></div>
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
				
				<br/>
					
					<div class="row group">
						<div class="cell"></div>
						<div class="cell group"><label>AVAILABILITY</label></div>
					</div>		
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
					<div class="row callback vstage1_${stage}" id="audition_${profile?.id }">
						<div class="cell"><label class="profile-text"><g:message code="default.audition.label" default="Audition" />:</label></div>
						<div class="cell">
							<g:radioGroup name="audition_${profile?.id }" value='${profile?.isAuditionAvailable }' values="['true','false']" labels="['yes','no']" class="audition_avail_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
							</g:radioGroup>			
						</div>
					</div>
					</sec:ifAnyGranted>
					<div class="row callback vstage2_${stage} vstage3_${stage}" id="callback_${profile?.id }">
						<div class="cell"><label class="profile-text"><g:message code="default.callback.label" default="Callback" />:</label></div>
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
					</div>	
					<div class="row wardrobe vstage2_${stage} vstage3_${stage}" id="wardrobe_${profile?.id }">
						<div class="cell"><label class="profile-text"><g:message code="default.wardrobe.label" default="Wardrobe" />:</label></div>
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
					</div>	
					<div class="row shoot vstage2_${stage} vstage3_${stage}" id="shoot_${profile?.id }">
						<div class="cell"><label class="profile-text"><g:message code="default.shoot.label" default="Shoot" />:</label></div>
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
					</div>	
													
			</div>    
	    </div>					
	</g:set>
	
	<g:set var="tmp" value="${tmp } ${entry }"/>
	
	<g:if test="${((i+1)%count_per_row) ==0 }">
		<g:set var="data_table">
			${data_table }
			<div id="row-${i}" class="headshot-row">
				${tmp }
			</div>
		</g:set>
		<g:set var="tmp" value=""/>
	</g:if>
	<!-- Add the last bit -->
	<g:if test="${(total_count == (i+1)) & tmp != "" }">
		<g:set var="data_table">
			${data_table }
			<div id="row-${i}" class="headshot-row">
				${tmp }
			</div>
		</g:set>
	</g:if>
</g:each>

${data_table }
