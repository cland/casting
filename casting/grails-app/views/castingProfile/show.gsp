<%@ page import="com.cland.casting.SystemRoles" %>
<%@ page import="com.cland.casting.CastingProfile" %>
<g:set var="pictureSetInstance" value="${castingProfileInstance?.pictures}"/>
<g:set var="videoSetInstance" value="${castingProfileInstance?.videos}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingProfile.label', default: 'CastingProfile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">
		<span class="r-arrow"></span>
		<g:link controller="production" action="list">Productions</g:link>
		<span class="r-arrow"></span>
		<g:link controller="production" action="show" params="${['id':castingProfileInstance?.production?.id]}">Production: ${castingProfileInstance?.production?.name} (Client: ${castingProfileInstance?.production?.client?.encodeAsHTML()})</g:link>
		<span class="r-arrow"></span> 
		<span class="current-crump">
			${castingProfileInstance }
		</span>
	</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:sideMenu default=""></g:sideMenu> 
    </div>	
		<a href="#show-castingProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>		
		<div id="show-castingProfile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:render template="tabs"/>
			<g:form>
				<fieldset class="buttons">
				<g:hiddenField name="id" value="${castingProfileInstance?.id}" />
					<g:link class="edit" action="edit" id="${castingProfileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
					
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<span class="l-arrow"></span> | <span class="r-arrow"></span>
						<g:if test="${ pictureSetInstance}">
							<g:link class="show" controller="pictureSet" action="show" id="${pictureSetInstance?.id}">
							<g:message code="default.manage.label" args="['Photos']"/>
							</g:link>
						</g:if>
						<g:else>
							<g:link class="create" controller="pictureSet" action="create" params="${['castingProfile.id':castingProfileInstance?.id]}">
							<g:message code="default.add.label" args="['Photos']"/>
							</g:link>
						</g:else>
						<g:if test="${ videoSetInstance}">
							<g:link class="show" controller="videoSet" action="show" id="${videoSetInstance?.id}">
							<g:message code="default.manage.label" args="['Videos']"/>
							</g:link>
						</g:if>
						<g:else>
							<g:link class="create" controller="videoSet" action="create" params="${['castingProfile.id':castingProfileInstance?.id]}">
							<g:message code="default.add.label" args="['Videos']"/>
							</g:link>
						</g:else>
					</sec:ifAnyGranted>
					
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
