
<%@ page import="com.cland.casting.CastingProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingProfile.label', default: 'CastingProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-castingProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-castingProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="outcome" title="${message(code: 'castingProfile.outcome.label', default: 'Outcome')}" />
					
						<g:sortableColumn property="averating" title="${message(code: 'castingProfile.averating.label', default: 'Averating')}" />
					
						<th><g:message code="castingProfile.canditate.label" default="Canditate" /></th>
					
						<g:sortableColumn property="castDate" title="${message(code: 'castingProfile.castDate.label', default: 'Cast Date')}" />
					
						<g:sortableColumn property="castNo" title="${message(code: 'castingProfile.castNo.label', default: 'Cast No')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'castingProfile.comments.label', default: 'Comments')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${castingProfileInstanceList}" status="i" var="castingProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${castingProfileInstance.id}">${fieldValue(bean: castingProfileInstance, field: "outcome")}</g:link></td>
					
						<td>${fieldValue(bean: castingProfileInstance, field: "averating")}</td>
					
						<td>${fieldValue(bean: castingProfileInstance, field: "canditate")}</td>
					
						<td><g:formatDate date="${castingProfileInstance.castDate}" /></td>
					
						<td>${fieldValue(bean: castingProfileInstance, field: "castNo")}</td>
					
						<td>${fieldValue(bean: castingProfileInstance, field: "comments")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${castingProfileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
