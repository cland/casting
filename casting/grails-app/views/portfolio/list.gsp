
<%@ page import="com.cland.casting.Portfolio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'portfolio.label', default: 'Portfolio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-portfolio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-portfolio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="comments" title="${message(code: 'portfolio.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'portfolio.name.label', default: 'Name')}" />
					
						<th><g:message code="portfolio.production.label" default="Production" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${portfolioInstanceList}" status="i" var="portfolioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${portfolioInstance.id}">${fieldValue(bean: portfolioInstance, field: "comments")}</g:link></td>
					
						<td>${fieldValue(bean: portfolioInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: portfolioInstance, field: "production")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${portfolioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
