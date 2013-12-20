
<%@ page import="com.cland.casting.CastingCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingCategory.label', default: 'CastingCategory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">
		<span class="r-arrow"></span>
		<g:link controller="production" action="list">Productions</g:link>
		<span class="r-arrow"></span>
		<g:link controller="production" action="show" params="${['id':castingCategoryInstance?.production?.id]}">Production: ${castingCategoryInstance?.production?.name} (Client: ${castingCategoryInstance?.production?.client?.encodeAsHTML()})</g:link>
		<span class="r-arrow"></span> 
		<span class="current-crump">
			${castingCategoryInstance }
		</span>
	</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:render template="../layouts/sidenav-admin"></g:render>
    </div>
		<a href="#show-castingCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="show-castingCategory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list castingCategory">
			
				<g:if test="${castingCategoryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="castingCategory.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${castingCategoryInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${castingCategoryInstance?.production}">
				<li class="fieldcontain">
					<span id="production-label" class="property-label"><g:message code="castingCategory.production.label" default="Production" /></span>
					
						<span class="property-value" aria-labelledby="production-label"><g:link controller="production" action="show" id="${castingCategoryInstance?.production?.id}">${castingCategoryInstance?.production?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${castingCategoryInstance?.id}" />
					<g:link class="edit" action="edit" id="${castingCategoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
