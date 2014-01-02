
<%@ page import="com.cland.casting.VideoSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'videoSet.label', default: 'VideoSet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">
				<span class="r-arrow"></span> <span class="current-crump">
					Video Sets
				</span>
		</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:sideMenu default=""></g:sideMenu> 
    </div>	
		<a href="#list-videoSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-videoSet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="videoSet.candidate.label" default="Candidate" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'videoSet.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'videoSet.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${videoSetInstanceList}" status="i" var="videoSetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${videoSetInstance.id}">${fieldValue(bean: videoSetInstance, field: "castingProfile")}</g:link></td>
					
						<td><g:formatDate date="${videoSetInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: videoSetInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${videoSetInstanceTotal}" />
			</div>
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow

$(document).ready(function() {		
	$("#accordion" ).accordion({ active: cland_params.active_sidebar() });
	$("#tabs").tabs(
					{
					active:cland_params.active_tab(),
					create: function (event,ui){	
						//executed after is created								
						$('#tabs').show()
					},
					show: function(event,ui){
						//on every tabs clicked
					},
					beforeLoad : function(event, ui) {
							ui.jqXHR.error(function() {
								ui.panel
								.html("Couldn't load this tab. We'll try to fix this as soon as possible. ");
							});
						}
			});		                
});  //end method ready(...)

</script>		
	</body>
</html>
