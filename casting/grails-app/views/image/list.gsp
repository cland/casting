
<%@ page import="com.cland.casting.Image" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-image" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'image.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="caption" title="${message(code: 'image.caption.label', default: 'Caption')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'image.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'image.lastUpdatedBy.label', default: 'Last Updated By')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'image.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'image.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${imageInstanceList}" status="i" var="imageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${imageInstance.id}">${fieldValue(bean: imageInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: imageInstance, field: "caption")}</td>
					
						<td>${fieldValue(bean: imageInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: imageInstance, field: "lastUpdatedBy")}</td>
					
						<td>${fieldValue(bean: imageInstance, field: "createdBy")}</td>
					
						<td><g:formatDate date="${imageInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${imageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
