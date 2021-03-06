
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
         <g:sideMenu default=""></g:sideMenu> 
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
						<g:sortableColumn property="candidate.person.firstName" title="${message(code: 'castingProfile.candidate.label', default: 'Candidate')}"/> 										
						<g:sortableColumn property="castNo" title="${message(code: 'castingProfile.castNo.label', default: 'Cast No')}" />					
						<g:sortableColumn property="production.name" title="${message(code: 'castingProfile.production.label', default: 'Production')}"/> 						
						<g:sortableColumn property="isConfirmed" title="${message(code: 'castingProfile.isconfirmed.label', default: 'Confirmed')}" />						
					</tr>
				</thead>
				<tbody>
				<g:each in="${castingProfileInstanceList}" status="i" var="castingProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">					
						<td><g:link action="show" id="${castingProfileInstance.id}">${fieldValue(bean: castingProfileInstance, field: "canditate")}</g:link></td>							
						<td>${fieldValue(bean: castingProfileInstance, field: "castNo")}</td>
						<td>${fieldValue(bean: castingProfileInstance, field: "production.name")}</td>
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
