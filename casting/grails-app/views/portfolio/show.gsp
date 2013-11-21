
<%@ page import="com.cland.casting.Portfolio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'portfolio.label', default: 'Portfolio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-portfolio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-portfolio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list portfolio">
			
				<g:if test="${portfolioInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="portfolio.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${portfolioInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${portfolioInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="portfolio.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${portfolioInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${portfolioInstance?.production}">
				<li class="fieldcontain">
					<span id="production-label" class="property-label"><g:message code="portfolio.production.label" default="Production" /></span>
					
						<span class="property-value" aria-labelledby="production-label"><g:link controller="production" action="show" id="${portfolioInstance?.production?.id}">${portfolioInstance?.production?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${portfolioInstance?.profiles}">
				<li class="fieldcontain">
					<span id="profiles-label" class="property-label"><g:message code="portfolio.profiles.label" default="Profiles" /></span>
					
						<g:each in="${portfolioInstance.profiles}" var="p">
						<span class="property-value" aria-labelledby="profiles-label"><g:link controller="castingProfile" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${portfolioInstance?.id}" />
					<g:link class="edit" action="edit" id="${portfolioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
