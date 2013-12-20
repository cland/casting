
<%@ page import="com.cland.casting.CastingRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingRole.label', default: 'CastingRole')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">
		<span class="r-arrow"></span>
		<g:link controller="production" action="list">Productions</g:link>
		<span class="r-arrow"></span>
		<g:link controller="production" action="show" params="${['id':castingRoleInstance?.production?.id]}">Production: ${castingRoleInstance?.production?.name} (Client: ${castingRoleInstance?.production?.client?.encodeAsHTML()})</g:link>
		<span class="r-arrow"></span> 
		<span class="current-crump">
			${castingRoleInstance }
		</span>
	</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:render template="../layouts/sidenav-admin"></g:render>
    </div>
		<a href="#show-castingRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-castingRole" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list castingRole">
			
				<g:if test="${castingRoleInstance?.maxRequiredAuditionCount}">
				<li class="fieldcontain">
					<span id="maxRequiredAuditionCount-label" class="property-label"><g:message code="castingRole.maxRequiredAuditionCount.label" default="Max Required Audition Count" /></span>
					
						<span class="property-value" aria-labelledby="maxRequiredAuditionCount-label"><g:fieldValue bean="${castingRoleInstance}" field="maxRequiredAuditionCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingRoleInstance?.minRequiredAuditionCount}">
				<li class="fieldcontain">
					<span id="minRequiredAuditionCount-label" class="property-label"><g:message code="castingRole.minRequiredAuditionCount.label" default="Min Required Audition Count" /></span>
					
						<span class="property-value" aria-labelledby="minRequiredAuditionCount-label"><g:fieldValue bean="${castingRoleInstance}" field="minRequiredAuditionCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingRoleInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="castingRole.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${castingRoleInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingRoleInstance?.production}">
				<li class="fieldcontain">
					<span id="production-label" class="property-label"><g:message code="castingRole.production.label" default="Production" /></span>
					
						<span class="property-value" aria-labelledby="production-label"><g:link controller="production" action="show" id="${castingRoleInstance?.production?.id}">${castingRoleInstance?.production?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingRoleInstance?.requiredCount}">
				<li class="fieldcontain">
					<span id="requiredCount-label" class="property-label"><g:message code="castingRole.requiredCount.label" default="Required Count" /></span>
					
						<span class="property-value" aria-labelledby="requiredCount-label"><g:fieldValue bean="${castingRoleInstance}" field="requiredCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingRoleInstance?.requiredFemaleCount}">
				<li class="fieldcontain">
					<span id="requiredFemaleCount-label" class="property-label"><g:message code="castingRole.requiredFemaleCount.label" default="Required Female Count" /></span>
					
						<span class="property-value" aria-labelledby="requiredFemaleCount-label"><g:fieldValue bean="${castingRoleInstance}" field="requiredFemaleCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingRoleInstance?.requiredMaleCount}">
				<li class="fieldcontain">
					<span id="requiredMaleCount-label" class="property-label"><g:message code="castingRole.requiredMaleCount.label" default="Required Male Count" /></span>
					
						<span class="property-value" aria-labelledby="requiredMaleCount-label"><g:fieldValue bean="${castingRoleInstance}" field="requiredMaleCount"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${castingRoleInstance?.id}" />
					<g:link class="edit" action="edit" id="${castingRoleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow

$(document).ready(function() {		
	$("#accordion" ).accordion({ active: cland_params.active_sidebar() });

	//Main tabs	
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
