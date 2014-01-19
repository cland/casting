
<%@ page import="com.cland.casting.Candidate" %>
<g:set var="agencyId"><g:agencyId/></g:set>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">			

			<span class="r-arrow"></span> <span class="current-crump">
				Candidates List
			</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
	         <g:sideMenu default=""></g:sideMenu> 
	    </div>		
		<a href="#list-candidate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-candidate" class="content scaffold-list" role="main">
		<export:formats formats="['excel', 'pdf']" />
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<fieldset class="buttons">
				<g:link class="create" controller="candidate" action="create" params="${['agency.id':agencyId]}">
					<g:message code="default.new.label" args="['Candidate']"/>
				</g:link>
			</fieldset>
			<div id="local-search" style="display:none;">
				<g:form url='[controller: "candidate", action: "search"]'
					id="candidateSearchForm"
					name="candidateSearchForm"
					method="get">
				<g:textField name="q" value="${params.q}" />
				<input type="submit" value="Find a candidate" />
				</g:form>
			</div>
			<br/>
			<table>
				<thead>
					<tr>
						<th><g:message code="candidate.person.label" default="Candidate" /></th>
						<th><g:message code="candidate.agency.label" default="Agency" /></th>					
						<g:sortableColumn property="clothing" title="${message(code: 'candidate.clothing.label', default: 'Clothing')}" />
						<g:sortableColumn property="eyes" title="${message(code: 'candidate.eyes.label', default: 'Eyes')}" />					
						<g:sortableColumn property="hair" title="${message(code: 'candidate.hair.label', default: 'Hair')}" />					
						<g:sortableColumn property="height" title="${message(code: 'candidate.height.label', default: 'Height')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${candidateInstanceList}" status="i" var="candidateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${candidateInstance.id}">${fieldValue(bean: candidateInstance, field: "person")}</g:link></td>
						<td>${fieldValue(bean: candidateInstance, field: "agency")}</td>				
						<td>${fieldValue(bean: candidateInstance, field: "clothing")}</td>					
						<td>${fieldValue(bean: candidateInstance, field: "eyes")}</td>					
						<td>${fieldValue(bean: candidateInstance, field: "hair")}</td>					
						<td>${fieldValue(bean: candidateInstance, field: "height")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${candidateInstanceTotal}" />
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
