
<%@ page import="com.cland.casting.CastingProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingProfile.label', default: 'CastingProfile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-castingProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-castingProfile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list castingProfile">
			
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
				</g:if>
			
				<g:if test="${castingProfileInstance?.castDate}">
				<li class="fieldcontain">
					<span id="castDate-label" class="property-label"><g:message code="castingProfile.castDate.label" default="Cast Date" /></span>
					
						<span class="property-value" aria-labelledby="castDate-label"><g:formatDate date="${castingProfileInstance?.castDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.castNo}">
				<li class="fieldcontain">
					<span id="castNo-label" class="property-label"><g:message code="castingProfile.castNo.label" default="Cast No" /></span>
					
						<span class="property-value" aria-labelledby="castNo-label"><g:fieldValue bean="${castingProfileInstance}" field="castNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.categories}">
				<li class="fieldcontain">
					<span id="categories-label" class="property-label"><g:message code="castingProfile.categories.label" default="Categories" /></span>
					
						<g:each in="${castingProfileInstance.categories}" var="c">
						<span class="property-value" aria-labelledby="categories-label"><g:link controller="castingCategory" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="castingProfile.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${castingProfileInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.isAuditionAvailable}">
				<li class="fieldcontain">
					<span id="isAuditionAvailable-label" class="property-label"><g:message code="castingProfile.isAuditionAvailable.label" default="Is Audition Available" /></span>
					
						<span class="property-value" aria-labelledby="isAuditionAvailable-label"><g:formatBoolean boolean="${castingProfileInstance?.isAuditionAvailable}" /></span>
					
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
			
				<g:if test="${castingProfileInstance?.pictures}">
				<li class="fieldcontain">
					<span id="pictures-label" class="property-label"><g:message code="castingProfile.pictures.label" default="Pictures" /></span>
					
						<span class="property-value" aria-labelledby="pictures-label"><g:link controller="pictureSet" action="show" id="${castingProfileInstance?.pictures?.id}">${castingProfileInstance?.pictures?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.production}">
				<li class="fieldcontain">
					<span id="production-label" class="property-label"><g:message code="castingProfile.production.label" default="Production" /></span>
					
						<span class="property-value" aria-labelledby="production-label"><g:link controller="production" action="show" id="${castingProfileInstance?.production?.id}">${castingProfileInstance?.production?.encodeAsHTML()}</g:link></span>
					
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
			
				<g:if test="${castingProfileInstance?.roles}">
				<li class="fieldcontain">
					<span id="roles-label" class="property-label"><g:message code="castingProfile.roles.label" default="Roles" /></span>
					
						<g:each in="${castingProfileInstance.roles}" var="r">
						<span class="property-value" aria-labelledby="roles-label"><g:link controller="castingRole" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.round}">
				<li class="fieldcontain">
					<span id="round-label" class="property-label"><g:message code="castingProfile.round.label" default="Round" /></span>
					
						<span class="property-value" aria-labelledby="round-label"><g:fieldValue bean="${castingProfileInstance}" field="round"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingProfileInstance?.videos}">
				<li class="fieldcontain">
					<span id="videos-label" class="property-label"><g:message code="castingProfile.videos.label" default="Videos" /></span>
					
						<span class="property-value" aria-labelledby="videos-label"><g:link controller="videoSet" action="show" id="${castingProfileInstance?.videos?.id}">${castingProfileInstance?.videos?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${castingProfileInstance?.id}" />
					<g:link class="edit" action="edit" id="${castingProfileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
