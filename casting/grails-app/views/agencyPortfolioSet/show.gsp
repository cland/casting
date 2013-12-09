
<%@ page import="com.cland.casting.AgencyPortfolioSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-agencyPortfolioSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-agencyPortfolioSet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list agencyPortfolioSet">
			
				<g:if test="${agencyPortfolioSetInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="agencyPortfolioSet.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${agencyPortfolioSetInstance}" field="lastUpdatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agencyPortfolioSetInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="agencyPortfolioSet.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${agencyPortfolioSetInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agencyPortfolioSetInstance?.candidate}">
				<li class="fieldcontain">
					<span id="candidate-label" class="property-label"><g:message code="agencyPortfolioSet.candidate.label" default="Candidate" /></span>
					
						<span class="property-value" aria-labelledby="candidate-label"><g:link controller="candidate" action="show" id="${agencyPortfolioSetInstance?.candidate?.id}">${agencyPortfolioSetInstance?.candidate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${agencyPortfolioSetInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="agencyPortfolioSet.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${agencyPortfolioSetInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${agencyPortfolioSetInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="agencyPortfolioSet.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${agencyPortfolioSetInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${agencyPortfolioSetInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="agencyPortfolioSet.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${agencyPortfolioSetInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${agencyPortfolioSetInstance?.id}" />
					<g:link class="edit" action="edit" id="${agencyPortfolioSetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
