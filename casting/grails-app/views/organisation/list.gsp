
<%@ page import="com.cland.casting.Organisation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organisation.label', default: 'Organisation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
<div class="bread-crump">

				<span class="r-arrow"></span> <span class="current-crump">
					Organisation List
				</span>
		</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:render template="../layouts/sidenav-admin"></g:render>
    </div>		
		<a href="#list-organisation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-organisation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'organisation.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="phoneNo" title="${message(code: 'organisation.phoneNo.label', default: 'Phone No')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'organisation.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="phyAddress" title="${message(code: 'organisation.phyAddress.label', default: 'Phy Address')}" />
					
						<th><g:message code="organisation.region.label" default="Region" /></th>
					
						<th><g:message code="organisation.country.label" default="Country" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${organisationInstanceList}" status="i" var="organisationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${organisationInstance.id}">${fieldValue(bean: organisationInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: organisationInstance, field: "phoneNo")}</td>
					
						<td>${fieldValue(bean: organisationInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: organisationInstance, field: "phyAddress")}</td>
					
						<td>${fieldValue(bean: organisationInstance, field: "region")}</td>
					
						<td>${fieldValue(bean: organisationInstance, field: "country")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${organisationInstanceTotal}" />
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
