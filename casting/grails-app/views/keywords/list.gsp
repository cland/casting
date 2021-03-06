
<%@ page import="com.cland.casting.Keywords" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'keywords.label', default: 'Keywords')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-keywords" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-keywords" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'keywords.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="category" title="${message(code: 'keywords.category.label', default: 'Category')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'keywords.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'keywords.value.label', default: 'Values')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'keywords.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'keywords.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${keywordsInstanceList}" status="i" var="keywordsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${keywordsInstance.id}">${fieldValue(bean: keywordsInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: keywordsInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: keywordsInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: keywordsInstance, field: "value")}</td>
					
						<td>${fieldValue(bean: keywordsInstance, field: "createdBy")}</td>
					
						<td><g:formatDate date="${keywordsInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${keywordsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
