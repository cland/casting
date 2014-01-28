<%@ page import="com.cland.casting.CastingRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingRole.label', default: 'CastingRole')}" />
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
			New Casting Role
		</span>
	</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:sideMenu default=""></g:sideMenu> 
    </div>
		<a href="#create-castingRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="create-castingRole" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${castingRoleInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${castingRoleInstance}" var="error">
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
				</fieldset>
			</g:form>
		</div>
	<script type="text/javascript">
// when the page has finished loading.. execute the follow
$(document).ready(function() {		
	$("#accordion" ).accordion({ active: cland_params.active_sidebar() });	
	//$(element_or_selector).multiDatesPicker(options_to_initialize_datepicker_and_multidatepicker);
	$(".datepicker-reset").on("click",function(){
		cland_datepickers.reset_picker($(this).attr("picker"),$(this).attr("altfield"), 'picked')
	});
	
	$("#audition-date").attr("value",cland_params.production.audition_dates)
	$("#callback-date").attr("value",cland_params.production.callback_dates)
	$("#wardrobe-date").attr("value",cland_params.production.wardrobe_dates)
	$("#shoot-date").attr("value",cland_params.production.shoot_dates)
	
	var frmdate = new Date(cland_params.production.start_date)
	var todate = new Date(cland_params.production.end_date)
	cland_datepickers.init_datepicker("audition-datepicker","audition-date",frmdate,todate);
	cland_datepickers.init_datepicker("callback-datepicker","callback-date",frmdate,todate);
	cland_datepickers.init_datepicker("wardrobe-datepicker","wardrobe-date",frmdate,todate);
	cland_datepickers.init_datepicker("shoot-datepicker","shoot-date",frmdate,todate);
});  //end method ready(...)

</script>	
	</body>
</html>
