
<%@ page import="com.cland.casting.Production" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'production.label', default: 'Production')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>		
	</head>
	<body>
	<div class="bread-crump">
		<span class="r-arrow"></span> <span class="current-crump">
			Production List </span>
	</div>
	<div id="status1" class="leftbar" role="complementary">
         <g:sideMenu default=""></g:sideMenu> 
    </div>
		<a href="#list-production" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-production" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					<g:sortableColumn property="name" title="${message(code: 'production.name.label', default: 'Name')}" />
					<g:sortableColumn property="status" title="${message(code: 'production.status.label', default: 'Status')}" />	
					<g:sortableColumn property="client.company.name" title="${message(code: 'production.client.label', default: 'Client')}" />					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productionInstanceList}" status="i" var="productionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productionInstance.id}">${fieldValue(bean: productionInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: productionInstance, field: "status")}</td>
						<td>${fieldValue(bean: productionInstance, field: "client")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productionInstanceTotal}" />
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
