<%@ page import="com.cland.casting.AgencyPortfolioSet" %>
<%@ page import="com.cland.casting.SystemRoles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">		
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_DEVELOPER }">	
			<span class="r-arrow"></span>			
			<g:link controller="agency" action="list">Agencies</g:link>
			</sec:ifAnyGranted>
			<g:if test="${candidateInstance?.agency }">
			<span class="r-arrow"></span>
			<g:link controller="agency" action="show" params="${['id':candidateInstance?.agency?.id]}">Agency: ${candidateInstance?.agency?.encodeAsHTML()}</g:link>
			</g:if>
			<span class="r-arrow"></span>
			<g:link controller="candidate" action="show" params="${['id':candidateInstance?.id] }"> ${candidateInstance?.encodeAsHTML() }</g:link>
			<span class="r-arrow"></span> <span class="current-crump">
				New Picture Portfolio Set
			</span>
		</div>
	<div id="status1" class="leftbar" role="complementary">
         <g:sideMenu default=""></g:sideMenu> 
    </div>	
		<a href="#create-agencyPortfolioSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="create-agencyPortfolioSet" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${agencyPortfolioSetInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${agencyPortfolioSetInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:uploadForm action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:uploadForm>
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
