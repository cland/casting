
<%@ page import="com.cland.casting.CastingProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingProfile.label', default: 'CastingProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">
		<span class="r-arrow"></span> <span class="current-crump">
			Casting Profile List </span>
	</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:render template="../layouts/sidenav-admin"></g:render>
    </div>
		<a href="#list-castingProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-castingProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>		
						<th><g:message code="castingProfile.canditate.label" default="Canditate" /></th>					
						<g:sortableColumn property="castDate" title="${message(code: 'castingProfile.castDate.label', default: 'Cast Date')}" />					
						<g:sortableColumn property="averating" title="${message(code: 'castingProfile.averating.label', default: 'Ave Rating')}" />
						<g:sortableColumn property="castNo" title="${message(code: 'castingProfile.castNo.label', default: 'Cast No')}" />
						<g:sortableColumn property="outcome" title="${message(code: 'castingProfile.outcome.label', default: 'Outcome')}" />						
					</tr>
				</thead>
				<tbody>
				<g:each in="${castingProfileInstanceList}" status="i" var="castingProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${castingProfileInstance.id}">${fieldValue(bean: castingProfileInstance, field: "canditate")}</g:link></td>			
						<td><g:formatDate date="${castingProfileInstance.castDate}" /></td>					
						<td>${fieldValue(bean: castingProfileInstance, field: "castNo")}</td>
						<td>${fieldValue(bean: castingProfileInstance, field: "averating")}</td>	
						<td>${fieldValue(bean: castingProfileInstance, field: "outcome")}</td>										
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${castingProfileInstanceTotal}" />
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
