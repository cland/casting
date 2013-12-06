<!-- The tabs -->
<%@ page import="com.cland.casting.SystemRoles" %>
<g:set var="pictureSetInstance" value="${castingProfileInstance?.pictures}"/>
<g:set var="videoSetInstance" value="${castingProfileInstance?.videos}"/>
<div id="tabs" style="display: none;">
	<ul>
		<li><a href="#tab-details">Details</a></li>
		<li><a href="#tab-photos">Photos</a></li>
		<li><a href="#tab-videos">Videos</a></li>

	</ul>

	<!-- DETAILS -->	
	<div id="tab-details">
		<ol class="property-list castingProfile">
				<g:if test="${castingProfileInstance?.production}">
				<li class="fieldcontain">
					<span id="production-label" class="property-label"><g:message code="castingProfile.production.label" default="Production" /></span>
					
						<span class="property-value" aria-labelledby="production-label"><g:link controller="production" action="show" id="${castingProfileInstance?.production?.id}">${castingProfileInstance?.production?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>			
				<g:if test="${castingProfileInstance?.outcome}">
				<li class="fieldcontain">
					<span id="outcome-label" class="property-label"><g:message code="castingProfile.outcome.label" default="Outcome" /></span>
					
						<span class="property-value" aria-labelledby="outcome-label"><g:fieldValue bean="${castingProfileInstance}" field="outcome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.averating}">
				<li class="fieldcontain">
					<span id="averating-label" class="property-label"><g:message code="castingProfile.averating.label" default="Averating" /></span>
					
						<span class="property-value" aria-labelledby="averating-label"><g:fieldValue bean="${castingProfileInstance}" field="averating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.canditate}">
				<li class="fieldcontain">
					<span id="canditate-label" class="property-label"><g:message code="castingProfile.canditate.label" default="Canditate" /></span>
					
						<span class="property-value" aria-labelledby="canditate-label"><g:link controller="candidate" action="show" id="${castingProfileInstance?.canditate?.id}">${castingProfileInstance?.canditate?.encodeAsHTML()}</g:link></span>
					
				</li>
				<li class="fieldcontain">
					<span id="person-gender-label" class="property-label"><g:message code="candidate.person.gender.label" default="Gender" /></span>					
					<span class="property-value" aria-labelledby="person-gender-label"> ${castingProfileInstance?.canditate?.person?.gender?.encodeAsHTML()}</span>					
				</li>
				<li class="fieldcontain">
					<span id="person-race-label" class="property-label"><g:message code="candidate.person.race.label" default="Race" /></span>					
					<span class="property-value" aria-labelledby="person-race-label"> ${castingProfileInstance?.canditate?.person?.race?.encodeAsHTML()}</span>					
				</li>
				<li class="fieldcontain">
					<span id="person-contactno-label" class="property-label"><g:message code="candidate.person.contactno.label" default="Contact No." /></span>					
					<span class="property-value" aria-labelledby="person-contactno-label"> ${castingProfileInstance?.canditate?.person?.contactNo?.encodeAsHTML()}</span>					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.castDate}">
				<li class="fieldcontain">
					<span id="castDate-label" class="property-label"><g:message code="castingProfile.castDate.label" default="Cast Date" /></span>
					
						<span class="property-value" aria-labelledby="castDate-label"><g:formatDate date="${castingProfileInstance?.castDate}" format="dd-MMM-yyyy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.castNo}">
				<li class="fieldcontain">
					<span id="castNo-label" class="property-label"><g:message code="castingProfile.castNo.label" default="Cast No" /></span>
					
						<span class="property-value" aria-labelledby="castNo-label"><g:fieldValue bean="${castingProfileInstance}" field="castNo"/></span>
					
				</li>
				</g:if>
				<g:if test="${castingProfileInstance?.roles}">
				<li class="fieldcontain">
					<span id="roles-label" class="property-label"><g:message code="castingProfile.roles.label" default="Role" /></span>
					
						<g:each in="${castingProfileInstance.roles}" var="r">
						<span class="property-value" aria-labelledby="roles-label"><g:link controller="castingRole" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>	
				<g:if test="${castingProfileInstance?.categories}">
				<li class="fieldcontain">
					<span id="categories-label" class="property-label"><g:message code="castingProfile.categories.label" default="Category" /></span>
					
						<g:each in="${castingProfileInstance.categories}" var="c">
						<span class="property-value" aria-labelledby="categories-label"><g:link controller="castingCategory" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				<g:if test="${castingProfileInstance?.auditionDate}">
				<li class="fieldcontain">
					<span id="auditionDate-label" class="property-label"><g:message code="castingProfile.auditionDate.label" default="Audition Date" /></span>
					
						<span class="property-value" aria-labelledby="auditionDate-label"><g:formatDate date="${castingProfileInstance?.auditionDate}" format="dd-MMM-yyyy"/></span>
					
				</li>
				</g:if>			
			
				<g:if test="${castingProfileInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="castingProfile.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${castingProfileInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			</ol>
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
		<div id="attachments-photos" class="attachments">
				<attachments:each bean="${pictureSetInstance}" status="i">	
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
	</div>	
	<!-- VIDEOS -->
	<div id="tab-videos">

<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
		<g:if test="${castingProfileInstance?.pictures}">
			<div class="float-right property-value" aria-labelledby="videos-label">
			<g:link controller="videoSet" action="show" id="${castingProfileInstance?.videos?.id}">
			<g:message code="default.manage.label" args=" " />${message(code: 'videoSet.label', default: 'VideoSet')} </g:link>
			</div>
		</g:if> <br/>
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