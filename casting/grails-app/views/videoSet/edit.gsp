<%@ page import="com.cland.casting.VideoSet" %>
<%@ page import="com.cland.casting.SystemRoles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'videoSet.label', default: 'VideoSet')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
		<div class="bread-crump">
		<span class="r-arrow"></span>
		<g:link controller="production" action="show" id="${castingProfileInstance?.production?.id }">Production: ${castingProfileInstance?.production?.name }</g:link>
		<span class="r-arrow"></span>
		<g:link controller="castingProfile" action="show" id="${castingProfileInstance?.id }">${castingProfileInstance }</g:link>
		<span class="r-arrow"></span> <span class="current-crump">
			${entityName }
		</span>
	</div>
		<div id="status1" class="leftbar" role="complementary">
	         <g:sideMenu default=""></g:sideMenu> 
	    </div>	
		<a href="#edit-videoSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="edit-videoSet" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /> <g:if test="${castingProfileInstance }">for ${castingProfileInstance }</g:if></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${videoSetInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${videoSetInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:uploadForm method="post" >
				<g:hiddenField name="id" value="${videoSetInstance?.id}" />
				<g:hiddenField name="version" value="${videoSetInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset><legend>Existing</legend>
	<div id="attachments" class="attachments">
			<attachments:each bean="${videoSetInstance}" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'film.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="false" withContentType="false" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:videoSetInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
		</div>				
				</fieldset>				
				<fieldset class="buttons">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:link class="cancel" controller="castingProfile" action="show" id="${castingProfileInstance?.id}"><g:message code="default.button.cancel.label" default="Cancel" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</sec:ifAnyGranted>	
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
