<%@ page import="com.cland.casting.SystemRoles" %>
<%@ page import="com.cland.casting.PictureSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pictureSet.label', default: 'PictureSet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
         <g:render template="../layouts/sidenav-admin"></g:render>
    </div>
		<a href="#show-pictureSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="show-pictureSet" class="content scaffold-show" role="main">
			<h1><g:message code="default.manage.label" args="[entityName]" /> <g:if test="${castingProfileInstance }">for ${castingProfileInstance }</g:if></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
		<div id="headshot" class="attachments">
			<h3>Headshot Picture (Only 1 Required)</h3>
			<attachments:each bean="${pictureSetInstance}" inputName="headshot" status="j">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:pictureSetInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${j%2==0 & j!=0 }"><br/></g:if>
			
			</attachments:each>
			<div class="clear"></div>
		</div>
		
		<div id="attachments" class="attachments">	
			<h3>Other Pictures</h3>
			<attachments:each bean="${pictureSetInstance}" inputName="pictures" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:pictureSetInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
		</div>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pictureSetInstance?.id}" />
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
						<g:link class="edit" action="edit" id="${pictureSetInstance?.id}"><g:message code="default.button.add.label" default="Add" /></g:link>
						<g:link class="cancel" controller="castingProfile" action="show" id="${castingProfileInstance?.id}"><g:message code="default.button.close.label" default="Close" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</sec:ifAnyGranted>
				</fieldset>
			</g:form>
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
