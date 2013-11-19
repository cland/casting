
<%@ page import="com.cland.casting.Production" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'production.label', default: 'Production')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-production" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<tmpl:sidenav/>
		<div id="list-production" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="production.client.label" default="Client" /></th>
					<th><g:message code="production.client.label" default="Client" /></th>
						<g:sortableColumn property="name" title="${message(code: 'production.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productionInstanceList}" status="i" var="productionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productionInstance.id}">${fieldValue(bean: productionInstance, field: "client")}</g:link></td>
					<td><g:link action="show" id="${productionInstance.id}">${fieldValue(bean: productionInstance, field: "client")}</g:link></td>
						<td>${fieldValue(bean: productionInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productionInstanceTotal}" />
			</div>
			
		</div>
	</body>
</html>
