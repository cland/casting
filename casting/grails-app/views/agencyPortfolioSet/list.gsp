
<%@ page import="com.cland.casting.AgencyPortfolioSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">		
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_DEVELOPER }"></sec:ifAnyGranted>	
			<span class="r-arrow"></span>			
			
			
			<span class="r-arrow"></span> <span class="current-crump">
				List of Candidate Portfolios
			</span>
		</div>
	<div id="status1" class="leftbar" role="complementary">
         <g:sideMenu default=""></g:sideMenu> 
    </div>	
		<a href="#list-agencyPortfolioSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-agencyPortfolioSet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'agencyPortfolioSet.lastUpdatedBy.label', default: 'Last Updated By')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'agencyPortfolioSet.createdBy.label', default: 'Created By')}" />
					
						<th><g:message code="agencyPortfolioSet.candidate.label" default="Candidate" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'agencyPortfolioSet.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'agencyPortfolioSet.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'agencyPortfolioSet.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${agencyPortfolioSetInstanceList}" status="i" var="agencyPortfolioSetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${agencyPortfolioSetInstance.id}">${fieldValue(bean: agencyPortfolioSetInstance, field: "lastUpdatedBy")}</g:link></td>
					
						<td>${fieldValue(bean: agencyPortfolioSetInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: agencyPortfolioSetInstance, field: "candidate")}</td>
					
						<td><g:formatDate date="${agencyPortfolioSetInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${agencyPortfolioSetInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: agencyPortfolioSetInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${agencyPortfolioSetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
