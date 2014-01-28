<%@ page import="com.cland.casting.CastingProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingProfile.label', default: 'CastingProfile')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>			
	</head>
	<body>	
	<div class="bread-crump">
		<span class="r-arrow"></span>
		<g:link controller="production" action="list">Productions</g:link>
		<span class="r-arrow"></span>
		<g:link controller="production" action="show" params="${['id':productionInstance?.id]}">Production: ${productionInstance?.name} (Client: ${productionInstance?.client?.encodeAsHTML()})</g:link>
		<span class="r-arrow"></span> 
		<span class="current-crump">
			New Casting Profile
		</span>
	</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:sideMenu default=""></g:sideMenu> 
    </div>		
		<a href="#create-castingProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="create-castingProfile" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<g:if test="${productionInstance }">
					<g:link class="cancel" action="show" controller="production" id="${productionInstance.id}"><g:message code="default.button.cancel.label" default="Cancel" /></g:link>
					</g:if>
				</fieldset>
			</g:form>
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow
$(document).ready(function() {	
	//alert(cland_params.production.start_date + "\n" + cland_params.production.end_date + "\n" + cland_params.production.audition_dates)
	$("#accordion" ).accordion({ active: cland_params.active_sidebar() });	
	$(".datepicker-reset").on("click",function(){
		cland_datepickers.reset_picker($(this).attr("picker"),$(this).attr("altfield"), 'picked')
	});
	var frmdate = new Date(cland_params.production.start_date)
	var todate = new Date(cland_params.production.end_date)
	cland_datepickers.init_datepicker_single_future("#cast-date","dd-M-yy",frmdate,todate);
	cland_datepickers.init_datepicker_single_future("#audition-date","dd-M-yy",frmdate,todate);
	cland_datepickers.init_datepicker_single_future("#callback-date","dd-M-yy",frmdate,todate);
	cland_datepickers.init_datepicker_single_future("#wardrobe-date","dd-M-yy",frmdate,todate);
	cland_datepickers.init_datepicker_single_future("#shoot-date","dd-M-yy",frmdate,todate);
});  //end method ready(...)

</script>		
	</body>
</html>
