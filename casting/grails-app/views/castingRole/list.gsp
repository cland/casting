
<%@ page import="com.cland.casting.CastingRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingRole.label', default: 'CastingRole')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">
		<span class="r-arrow"></span> <span class="current-crump">
			Casting Roles List </span>
	</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:render template="../layouts/sidenav-admin"></g:render>
    </div>
		<a href="#list-castingRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-castingRole" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					<g:sortableColumn property="name" title="${message(code: 'castingRole.name.label', default: 'Name')}" />		
						<th><g:message code="castingRole.production.label" default="Production" /></th>
						<g:sortableColumn property="requiredCount" title="${message(code: 'castingRole.requiredCount.label', default: 'Required Count')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${castingRoleInstanceList}" status="i" var="castingRoleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>${fieldValue(bean: castingRoleInstance, field: "name")}</td>
						<td>${fieldValue(bean: castingRoleInstance, field: "production")}</td>
					
						<td>${fieldValue(bean: castingRoleInstance, field: "requiredCount")}</td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${castingRoleInstanceTotal}" />
			</div>
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow
$(document).ready(function() {		
	$("#accordion" ).accordion({ active: cland_params.active_sidebar() });	
});  //end method ready(...)	
</script>
	</body>
</html>
