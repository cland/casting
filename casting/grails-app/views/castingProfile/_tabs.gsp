<!-- The tabs -->
<%@ page import="com.cland.casting.SystemRoles" %>
<g:set var="pictureSetInstance" value="${castingProfileInstance?.pictures}"/>
<g:set var="videoSetInstance" value="${castingProfileInstance?.videos}"/>
<g:set var="candidate" value="${castingProfileInstance?.canditate }"/>
<div id="tabs" style="display: none;">
	<ul>
		<li><a href="#tab-details">Details</a></li>
		<li><a href="#tab-photos">Photos</a></li>
		<li><a href="#tab-videos">Videos</a></li>

	</ul>

	<!-- DETAILS -->	
<div id="tab-details">
	
	
	<div id="row-${castingProfileInstance?.id }" class="profile-row"> <!--  start candidate profile details -->
		<div id="cast-details-${castingProfileInstance?.id }" class="cast-details">
			<div class="cast-details-data-table">
         		<div class="row castnum">
            		<div class="cell"><label>Cast No.:</label></div>
            		<div class="cell"><span class="property-value">${castingProfileInstance?.castNo}</span></div>
            	</div>
            	<div class="row name">
            		<div class="cell"><label>Name:</label></div>
            		<div class="cell"><span class="property-value">${candidate?.person?.encodeAsHTML() }</span></div>
            	</div>
            	<div class="row contactno">
            		<div class="cell"><label>Contact No.:</label></div>
            		<div class="cell"><span class="property-value">${candidate?.person?.contactNo }</span></div>
            	</div>             	
            	<div class="row gender">
            		<div class="cell"><label>Gender:</label></div>
            		<div class="cell"><span class="property-value">${candidate?.person?.gender }</span></div>
            	</div>  
             	<div class="row race">
            		<div class="cell"><label>Race:</label></div>
            		<div class="cell"><span class="property-value">${candidate?.person?.race }</span></div>
            	</div>           	          	
            	<div class="row age">
            		<div class="cell"><label>Age:</label></div>
            		<div class="cell"><span class="property-value">${castingProfileInstance?.age }</span></div>
            	</div>
            	<div class="row casting-role">
            		<div class="cell"><label>Casting Role:</label></div>
            		<div class="cell">
            			<g:each in="${castingProfileInstance.roles}" var="r">
						<span class="property-value">${r?.encodeAsHTML()}</span>
						</g:each>
            		</div>
            	</div>
            	<div class="row casting-category">
            		<div class="cell"><label>Casting Category:</label></div>
            		<div class="cell">
            			<g:each in="${castingProfileInstance.categories}" var="r">
						<span class="property-value">${r?.encodeAsHTML()}</span>
						</g:each>
            		</div>
            	</div>           	   
            	<div class="row castdate">
            		<div class="cell"><label>Cast Date:</label></div>
            		<div class="cell"><span class="property-value"><g:formatDate date="${castingProfileInstance?.castDate}" format="dd-MMM-yyyy"/></span></div>
            	</div>	 
             	<div class="row auditiondate">
            		<div class="cell"><label>Audition Date:</label></div>
            		<div class="cell"><span class="property-value"><g:formatDate date="${castingProfileInstance?.auditionDate}" format="dd-MMM-yyyy"/></span></div>
            	</div>  
				<g:if test="${castingProfileInstance?.averating}">
	             	<div class="row averating">
	            		<div class="cell"><label>Audition Date:</label></div>
	            		<div class="cell"><span class="property-value"><g:message code="castingProfile.averating.label" default="Averating" /></span></div>
	            	</div> 								
				</g:if>  
            	<div class="row production">
            		<div class="cell"><label>Production:</label></div>
            		<div class="cell"><span class="property-value"><g:link controller="production" action="show" id="${castingProfileInstance?.production?.id}">${castingProfileInstance?.production?.name?.encodeAsHTML()}</g:link></span></div>
            	</div>
				<g:if test="${castingProfileInstance?.comments}">
            	<div class="row comments">
            		<div class="cell"><label>Production:</label></div>
            		<div class="cell"><span class="property-value">${castingProfileInstance?.comments?.encodeAsHTML()}</span></div>
            	</div>				
				</g:if>            									          	         	       
            </div>
		</div>
		
		<div id="cast-actions-${profile?.id }" style="display:none;" class="cast-actions">&nbsp;</div>
	
		<div id="cast-mugshot-${castingProfileInstance?.id }" class="cast-mugshot">
			<g:set var="hasphoto" value="${false }"/>
		    <attachments:each bean="${castingProfileInstance?.pictures}" inputName="headshot" status="j">	         
				<g:if test="${j==0}">
					<g:set var="hasphoto" value="${true }"/>
					<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>		
				</g:if>			
			</attachments:each>	
			
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
				<g:if test="${hasphoto==false}"> 
					<g:if test="${ castingProfileInstance?.pictures}">
							<g:link class="edit" controller="pictureSet" action="edit" id="${castingProfileInstance?.pictures?.id}">
							<g:message code="default.add.label" args="['Photo']"/>
							</g:link>
					</g:if>
					<g:else>
						<g:link class="create" controller="pictureSet" action="create" params="${['castingProfile.id':castingProfileInstance?.id]}">
						<g:message code="default.add.label" args="['Photo']"/>
						</g:link>
					</g:else>
				</g:if>
			</sec:ifAnyGranted>
		</div>
		<br/>
		<div class="clear"></div>
	</div>	<!-- end profile details row -->

		
		<fieldset><legend>Characteristics</legend>	
		<ol class="property-list candidate">
				<g:if test="${castingProfileInstance?.canditate?.clothing}">
				<li class="fieldcontain">
					<span id="clothing-label" class="property-label"><g:message code="candidate.clothing.label" default="Clothing" /></span>
					
						<span class="property-value" aria-labelledby="clothing-label"><g:fieldValue bean="${castingProfileInstance?.canditate}" field="clothing"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.canditate?.eyes}">
				<li class="fieldcontain">
					<span id="eyes-label" class="property-label"><g:message code="candidate.eyes.label" default="Eyes" /></span>
					
						<span class="property-value" aria-labelledby="eyes-label"><g:fieldValue bean="${castingProfileInstance?.canditate}" field="eyes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.canditate?.hair}">
				<li class="fieldcontain">
					<span id="hair-label" class="property-label"><g:message code="candidate.hair.label" default="Hair" /></span>
					
						<span class="property-value" aria-labelledby="hair-label"><g:fieldValue bean="${castingProfileInstance?.canditate}" field="hair"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.canditate?.height}">
				<li class="fieldcontain">
					<span id="height-label" class="property-label"><g:message code="candidate.height.label" default="Height" /></span>
					
						<span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${castingProfileInstance?.canditate}" field="height"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.canditate?.shoe}">
				<li class="fieldcontain">
					<span id="shoe-label" class="property-label"><g:message code="candidate.shoe.label" default="Shoe" /></span>
					
						<span class="property-value" aria-labelledby="shoe-label"><g:fieldValue bean="${castingProfileInstance?.canditate}" field="shoe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.canditate?.waist}">
				<li class="fieldcontain">
					<span id="waist-label" class="property-label"><g:message code="candidate.waist.label" default="Waist" /></span>
					
						<span class="property-value" aria-labelledby="waist-label"><g:fieldValue bean="${castingProfileInstance?.canditate}" field="waist"/></span>
					
				</li>
				</g:if>
				</ol>
		</fieldset>
		<fieldset><legend>Progress Indicators</legend>
			<ol class="property-list castingProfile">
				<g:if test="${castingProfileInstance?.isAuditionAvailable}">
				<li class="fieldcontain">
					<span id="isAuditionAvailable-label" class="property-label"><g:message code="castingProfile.isAuditionAvailable.label" default="Is Audition Available" /></span>
					
						<span class="property-value" aria-labelledby="isAuditionAvailable-label"><g:formatBoolean boolean="${castingProfileInstance?.isAuditionAvailable}" true="Yes" false="No"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.isInvited}">
				<li class="fieldcontain">
					<span id="isInvited-label" class="property-label"><g:message code="castingProfile.isInvited.label" default="Is Invited" /></span>
					
						<span class="property-value" aria-labelledby="isInvited-label"><g:formatBoolean boolean="${castingProfileInstance?.isInvited}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.isRoleAvailable}">
				<li class="fieldcontain">
					<span id="isRoleAvailable-label" class="property-label"><g:message code="castingProfile.isRoleAvailable.label" default="Is Role Available" /></span>
					
						<span class="property-value" aria-labelledby="isRoleAvailable-label"><g:formatBoolean boolean="${castingProfileInstance?.isRoleAvailable}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.isShortlist}">
				<li class="fieldcontain">
					<span id="isShortlist-label" class="property-label"><g:message code="castingProfile.isShortlist.label" default="Is Shortlist" /></span>
					
						<span class="property-value" aria-labelledby="isShortlist-label"><g:formatBoolean boolean="${castingProfileInstance?.isShortlist}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.ratings}">
				<li class="fieldcontain">
					<span id="ratings-label" class="property-label"><g:message code="castingProfile.ratings.label" default="Ratings" /></span>
					
						<g:each in="${castingProfileInstance.ratings}" var="r">
						<span class="property-value" aria-labelledby="ratings-label"><g:link controller="rating" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.round}">
				<li class="fieldcontain">
					<span id="round-label" class="property-label"><g:message code="castingProfile.round.label" default="Round" /></span>
					
						<span class="property-value" aria-labelledby="round-label"><g:fieldValue bean="${castingProfileInstance}" field="round"/></span>
					
				</li>
				</g:if>
				<g:if test="${castingProfileInstance?.outcome}">
				<li class="fieldcontain">
					<span id="outcome-label" class="property-label"><g:message code="castingProfile.outcome.label" default="Outcome" /></span>
					
						<span class="property-value" aria-labelledby="outcome-label"><g:fieldValue bean="${castingProfileInstance}" field="outcome"/></span>
					
				</li>
				</g:if>		
			</ol>
		</fieldset>
		<fieldset><legend>Ratings and Comments</legend>
		<g:render template="ratingsTable"/>
		</fieldset>	
</div>
	
	
	<!-- PHOTOS -->
<div id="tab-photos">
		<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
			<g:if test="${castingProfileInstance?.pictures}">
				<div class="float-right property-value" aria-labelledby="pictures-label">
				<g:link controller="pictureSet" action="show" id="${castingProfileInstance?.pictures?.id}">
				<g:message code="default.manage.label" args=" " />${message(code: 'pictureSet.label', default: 'PictureSet')} </g:link>
				</div>
			</g:if> <br/>
		</sec:ifAnyGranted>	
		<fieldset><legend>Headshot</legend>
			<div id="attachments-photos-headshot" class="attachments">
				<attachments:each bean="${pictureSetInstance}" inputName="headshot" status="j">	
				<div class="photo-display float-left">
				<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
					<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />				
					<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
					${attachment.niceLength}
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_DEVELOPER},${SystemRoles.ROLE_ADMIN }">
					<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
						returnPageURI="${createLink(action:'show', id:castingProfileInstance?.id,absolute:true,params:'#tab-photos')}" />
					</sec:ifAnyGranted>
				</div>	
					<g:if test="${j%2==0 & j!=0 }"><br/></g:if>
				
				</attachments:each>
				<div style="clear:both"></div>
		</div>
		</fieldset>
		<br/>
		<fieldset><legend>Other Pictures</legend>
		<div id="attachments-photos" class="attachments">
				<attachments:each bean="${pictureSetInstance}" inputName="pictures" status="i">	
				<div class="photo-display float-left">
				<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
					<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />				
					<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
					${attachment.niceLength}
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_DEVELOPER},${SystemRoles.ROLE_ADMIN }">
					<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
						returnPageURI="${createLink(action:'show', id:castingProfileInstance?.id,absolute:true,params:'#tab-photos')}" />
					</sec:ifAnyGranted>
				</div>	
					<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
				
				</attachments:each>
				<div style="clear:both"></div>
		</div>
		</fieldset>
		
</div>	



<!-- VIDEOS -->
<div id="tab-videos">

	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
		
		<div class="float-right property-value" aria-labelledby="videos-label">
			<g:if test="${castingProfileInstance?.videos}">
				<g:link controller="videoSet" action="show" id="${castingProfileInstance?.videos?.id}">			
				<g:message code="default.manage.label" args=" " />${message(code: 'videoSet.label', default: 'VideoSet')} </g:link>
			</g:if>
			<g:else>
				<g:link class="create" controller="videoSet" action="create" params="${['castingProfile.id':castingProfileInstance?.id]}">
					<g:message code="default.add.label" args="['Videos']"/>
				</g:link>
			</g:else>
		</div>
		
	</sec:ifAnyGranted>	
		<div id="attachments-videos" class="attachments">
				<attachments:each bean="${videoSetInstance}" status="i">	
				<div class="photo-display float-left">
				<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
					<img src="${resource(dir:'images/icons',file:'film.png',plugin:'famfamfam')}" />				
					<attachments:downloadLink attachment="${attachment}" inline="false" withContentType="false" />
					${attachment.niceLength}
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_DEVELOPER},${SystemRoles.ROLE_ADMIN }">
					<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
						returnPageURI="${createLink(action:'show', id:castingProfileInstance?.id,absolute:true,params:'#tab-videos')}" />
					</sec:ifAnyGranted>
				</div>	
					<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
				
				</attachments:each>
				<div style="clear:both"></div>
		</div>		
	</div>
	
</div>
<!--  End tabs -->