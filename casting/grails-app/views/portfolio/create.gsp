<%@ page import="com.cland.casting.Portfolio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'portfolio.label', default: 'Portfolio')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="production" action="list">Productions</g:link>
				<span class="r-arrow"></span>
				<g:link controller="production" action="show" id="${productionInstance?.id}">Production: ${productionInstance?.name }</g:link>
				<span class="r-arrow"></span> <span class="current-crump">
					New Portfolio
				</span>
		</div>		
		<a href="#create-portfolio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<g:render template="/production/sidenav" /> 
		<div id="create-portfolio" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${portfolioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${portfolioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<g:link class="cancel" action="show" controller="production" id="${productionInstance?.id}"><g:message code="default.button.cancel.label" default="Cancel" /></g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
