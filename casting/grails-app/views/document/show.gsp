
<%@ page import="com.cland.casting.Document" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-document" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list document">
			
				<g:if test="${documentInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="document.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${documentInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="document.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label">
							${documentInstance?.content?.decodeHTML()} 
						</span>
					
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="document.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${documentInstance}" field="lastUpdatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="document.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${documentInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="document.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${documentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.docType}">
				<li class="fieldcontain">
					<span id="docType-label" class="property-label"><g:message code="document.docType.label" default="Doc Type" /></span>
					
						<span class="property-value" aria-labelledby="docType-label"><g:fieldValue bean="${documentInstance}" field="docType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="document.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${documentInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${documentInstance?.id}" />
					<g:link class="edit" action="edit" id="${documentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
