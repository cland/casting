
<%@ page import="com.cland.casting.CastingCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingCategory.label', default: 'CastingCategory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">
		<span class="r-arrow"></span> <span class="current-crump">
			Casting Category List </span>
	</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:render template="../layouts/sidenav-admin"></g:render>
    </div>
		<a href="#list-castingCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-castingCategory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'castingCategory.name.label', default: 'Name')}" />
					
						<th><g:message code="castingCategory.production.label" default="Production" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${castingCategoryInstanceList}" status="i" var="castingCategoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${castingCategoryInstance.id}">${fieldValue(bean: castingCategoryInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: castingCategoryInstance, field: "production")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${castingCategoryInstanceTotal}" />
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
