<%@ page import="com.cland.casting.CastingProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingProfile.label', default: 'CastingProfile')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
		<a href="#edit-castingProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="edit-castingProfile" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${castingProfileInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${castingProfileInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${castingProfileInstance?.id}" />
				<g:hiddenField name="version" value="${castingProfileInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:link class="cancel" action="show" id="${castingProfileInstance?.id}"><g:message code="default.button.cancel.label" default="Cancel" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow

$(document).ready(function() {		
	$("#accordion" ).accordion({ active: cland_params.active_sidebar() });
	$(".datepicker-reset").live("click",function(){
		cland_datepickers.reset_picker($(this).attr("picker"),$(this).attr("altfield"), 'picked')
	});

	var frmdate = new Date(cland_params.production.start_date)
	var todate = new Date(cland_params.production.end_date)

	cland_datepickers.init_datepicker_single_future("#cast-date","dd-M-yy",frmdate,todate);
	cland_datepickers.init_datepicker_single_future("#audition-date","dd-M-yy",frmdate,todate);
	cland_datepickers.init_datepicker_single_future("#callback-date","dd-M-yy",frmdate,todate);
	cland_datepickers.init_datepicker_single_future("#wardrobe-date","dd-M-yy",frmdate,todate);
	cland_datepickers.init_datepicker_single_future("#shoot-date","dd-M-yy",frmdate,todate);
	

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
