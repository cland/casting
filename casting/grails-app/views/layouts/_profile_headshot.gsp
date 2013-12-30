<!-- div HEADSHOT structure -->
<%@ page import="com.cland.casting.SystemRoles" %>
<g:set var="data_table" value=""/>
<g:set var="tmp" value=""/>
<g:set var="count_per_row" value="${4 }"/>
<g:set var="total_count" value="${profileList?.size() }"/>

<g:each in="${profileList }"  var="profile" status="i">
	<g:set var="entry">
		<div id="entry-${profile?.id }" class="mugshot">
			<g:hiddenField name="profiles" value="${profile.id}"/>
	        <attachments:each bean="${profile?.pictures}" inputName="headshot" status="j">	         
				<g:if test="${j==0}">
					<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>		
				</g:if>			
			</attachments:each>
			<div class="data-table">
				<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
					<div class="row">
						<div class="cell"><label class="profile-text">Name:</label></div>
						<div class="cell">							
							<g:link controller="castingProfile" action="show" id="${profile.id }">${profile.getName() }</g:link> [ ${profile.castNo } ]
						</div>
					</div>
				</sec:ifAnyGranted>
				<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
					<div class="row invited vstage1" id="invited_${profile?.id }">
						<div class="cell"><label class="profile-text">Invite:</label></div>
						<div class="cell">
							<g:radioGroup name="invited_${profile?.id }" value='${profile?.isInvited }' values="['true','false']" labels="['yes','no']" class="mugshot_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
							</g:radioGroup>			
						</div>
					</div>				
					<div class="row vstage1 vstage2 shortlist" id="shortlist_${profile?.id }">
						<div class="cell"><label class="profile-text">Shortlist:</label></div>
						<div class="cell">
							<g:radioGroup name="shortlist_${profile?.id }" value='${profile?.isShortlist }' values="['true','false']" labels="['yes','no']" class="mugshot_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
							</g:radioGroup>			
						</div>
					</div>
					<div class="row confirm vstage2 vstage3" id="confirm_${profile?.id }">
						<div class="cell"><label class="profile-text">Confirm:</label></div>
						<div class="cell">
							<g:radioGroup name="confirmed_${profile?.id }" value='${profile?.isConfirmed }' values="['true','false']" labels="['yes','no']" class="mugshot_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
							</g:radioGroup>			
						</div>
					</div>
				</sec:ifAnyGranted>	
				<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">	
					<div class="row group">
						<div class="cell"></div>
						<div class="cell group"><label>AVAILABILITY</label></div>
					</div>		
					<div class="row callback vstage1" id="audition_${profile?.id }">
						<div class="cell"><label class="profile-text">Audition:</label></div>
						<div class="cell">
							<g:radioGroup name="audition_${profile?.id }" value='${profile?.isAuditionAvailable }' values="['true','false']" labels="['yes','no']" class="mugshot_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
							</g:radioGroup>			
						</div>
					</div>
					<div class="row callback vstage2 vstage3" id="callback_${profile?.id }">
						<div class="cell"><label class="profile-text">Callback:</label></div>
						<div class="cell">
							<g:radioGroup name="callback_${profile?.id }" value='${profile?.isCallbackAvailable }' values="['true','false']" labels="['yes','no']" class="mugshot_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
							</g:radioGroup>			
						</div>
					</div>	
					<div class="row wardrobe vstage2 vstage3" id="wardrobe_${profile?.id }">
						<div class="cell"><label class="profile-text">Wardrobe:</label></div>
						<div class="cell">
							<g:radioGroup name="wardrobe_${profile?.id }" value='${profile?.isWardrobeAvailable }' values="['true','false']" labels="['yes','no']" class="mugshot_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
							</g:radioGroup>			
						</div>
					</div>	
					<div class="row shoot vstage2 vstage3" id="shoot_${profile?.id }">
						<div class="cell"><label class="profile-text">Shoot:</label></div>
						<div class="cell">
							<g:radioGroup name="shoot_${profile?.id }" value='${profile?.isRoleAvailable }' values="['true','false']" labels="['yes','no']" class="mugshot_radio_group">
								<span class="mugshot_radio">${it.radio } ${it.label } </span>
							</g:radioGroup>			
						</div>
					</div>	
				</sec:ifAnyGranted>									
			</div>    
	    </div>					
	</g:set>
	
	<g:set var="tmp" value="${tmp } ${entry }"/>
	
	<g:if test="${((i+1)%count_per_row) ==0 }">
		<g:set var="data_table">
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
