
<%@ page import="com.cland.casting.Keywords" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'keywords.label', default: 'Keywords')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-keywords" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-keywords" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list keywords">
			
				<g:if test="${keywordsInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="keywords.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${keywordsInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${keywordsInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="keywords.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${keywordsInstance}" field="category"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${keywordsInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="keywords.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${keywordsInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${keywordsInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="keywords.value.label" default="Values" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${keywordsInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${keywordsInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="keywords.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${keywordsInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${keywordsInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="keywords.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${keywordsInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${keywordsInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="keywords.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${keywordsInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${keywordsInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="keywords.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${keywordsInstance}" field="lastUpdatedBy"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${keywordsInstance?.id}" />
					<g:link class="edit" action="edit" id="${keywordsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
