<%@ page import="com.cland.casting.CastingRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'castingRole.label', default: 'CastingRole')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
		<a href="#edit-castingRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="edit-castingRole" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
			<g:form method="post" >
				<g:hiddenField name="id" value="${castingRoleInstance?.id}" />
				<g:hiddenField name="version" value="${castingRoleInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow

$(document).ready(function() {		
	$("#accordion" ).accordion({ active: cland_params.active_sidebar() });

	$(".datepicker-reset").live("click",function(){
		resetPicker($(this).attr("picker"),$(this).attr("altfield"), 'picked')
	});
	
	
	function resetPicker(picker_id,altfield_id, type){
		$("#" + picker_id).multiDatesPicker('resetDates',type);
		$("#" + altfield_id).attr("value","")
	}
	function initDatePicker(picker_id,altfield_id){
		var datelist = $("#" + altfield_id).attr("value")
		$("#" + picker_id).multiDatesPicker({
			dateFormat: "yy-mm-dd",
			altField: '#' + altfield_id,			
			altFormat:"yy-mm-dd",
			minDate:"+0",
			maxDate:"+3M +5D"
			//beforeShowDay: $.datepicker.noWeekends
			//maxPicks: 1		
		});
		//alert(datelist)
		if(datelist != "") {
			$("#" + altfield_id).attr("value",datelist)
			datelist = datelist.split(",");			
			$("#" + picker_id).multiDatesPicker('addDates',datelist);
		}	
	}
	
	initDatePicker("audition-datepicker","audition-date");
	initDatePicker("callback-datepicker","callback-date");
	initDatePicker("wardrope-datepicker","wardrope-date");
	initDatePicker("shoot-datepicker","shoot-date");
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
