
<%@ page import="com.cland.casting.Candidate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-candidate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-candidate" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="candidate.agency.label" default="Agency" /></th>
					
						<g:sortableColumn property="clothing" title="${message(code: 'candidate.clothing.label', default: 'Clothing')}" />
					
						<g:sortableColumn property="eyes" title="${message(code: 'candidate.eyes.label', default: 'Eyes')}" />
					
						<g:sortableColumn property="hair" title="${message(code: 'candidate.hair.label', default: 'Hair')}" />
					
						<g:sortableColumn property="height" title="${message(code: 'candidate.height.label', default: 'Height')}" />
					
						<th><g:message code="candidate.person.label" default="Person" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${candidateInstanceList}" status="i" var="candidateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${candidateInstance.id}">${fieldValue(bean: candidateInstance, field: "agency")}</g:link></td>
					
						<td>${fieldValue(bean: candidateInstance, field: "clothing")}</td>
					
						<td>${fieldValue(bean: candidateInstance, field: "eyes")}</td>
					
						<td>${fieldValue(bean: candidateInstance, field: "hair")}</td>
					
						<td>${fieldValue(bean: candidateInstance, field: "height")}</td>
					
						<td>${fieldValue(bean: candidateInstance, field: "person")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${candidateInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
