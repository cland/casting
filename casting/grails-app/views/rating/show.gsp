
<%@ page import="com.cland.casting.Rating" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'rating.label', default: 'Rating')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-rating" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-rating" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list rating">
				<g:if test="${ratingInstance?.profile}">
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="rating.profile.label" default="Profile" /></span>
					
						<span class="property-value" aria-labelledby="profile-label"><g:link controller="castingProfile" action="show" id="${ratingInstance?.profile?.id}">${ratingInstance?.profile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				<g:if test="${ratingInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="rating.rating.label" default="Rating" /></span>
					
						<span class="property-value" aria-labelledby="rating-label"><g:fieldValue bean="${ratingInstance}" field="rating"/></span>
					
				</li>
				</g:if>				
				<g:if test="${ratingInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="rating.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${ratingInstance}" field="comments"/></span>
					
				</li>
				</g:if>		
			</ol>
<fieldset>
			<legend>Audit</legend>
			<ol class="property-list rating">
				<g:if test="${ratingInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="rating.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label">${com.cland.casting.User.get(ratingInstance?.createdBy)}</span>
					
				</li>
				</g:if>
			
				<g:if test="${ratingInstance?.createdDate}">
				<li class="fieldcontain">
					<span id="createdDate-label" class="property-label"><g:message code="rating.createdDate.label" default="Created Date" /></span>
					
						<span class="property-value" aria-labelledby="createdDate-label"><g:formatDate date="${ratingInstance?.createdDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ratingInstance?.editedBy}">
				<li class="fieldcontain">
					<span id="editedBy-label" class="property-label"><g:message code="rating.editedBy.label" default="Edited By" /></span>
					
						<span class="property-value" aria-labelledby="editedBy-label">${com.cland.casting.User.get(ratingInstance?.createdBy)}</span>
					
				</li>
				</g:if>
			
				<g:if test="${ratingInstance?.editedDate}">
				<li class="fieldcontain">
					<span id="editedDate-label" class="property-label"><g:message code="rating.editedDate.label" default="Edited Date" /></span>
					
						<span class="property-value" aria-labelledby="editedDate-label"><g:formatDate date="${ratingInstance?.editedDate}" /></span>
					
				</li>
				</g:if>
				</ol>
			</fieldset>			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ratingInstance?.id}" />
					<g:link class="edit" action="edit" id="${ratingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
