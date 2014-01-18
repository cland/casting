<%@page import="com.cland.casting.ProductionStatus"%>
<%@ page import="com.cland.casting.Production" %>
<%@ page import="com.cland.casting.SystemRoles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'production.label', default: 'Production')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

		<g:render template="head"></g:render>	
	</head>
	<body>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="production" action="list">Productions</g:link>
				<span class="r-arrow"></span> <span class="current-crump">
					Production: ${productionInstance?.name } (Client: ${productionInstance?.client?.encodeAsHTML()})
				</span>
		</div>	
	<div id="status1" class="leftbar" role="complementary">
<%--         <g:render template="../layouts/sidenav-admin"></g:render>--%>
			<g:sideMenu default=""></g:sideMenu>  
    </div>
		<a href="#show-production" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-production" class="content scaffold-show" role="main">
			<h1>Production: ${productionInstance?.name } <span class="float-right">${productionInstance?.status}</span></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<!-- The tabs -->
			<g:render template="tabs"/>
			<g:form>
				<fieldset class="buttons">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
						<g:hiddenField name="id" value="${productionInstance?.id}" />
						<g:link class="edit" action="edit" id="${productionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						<span class="l-arrow"></span> | <span class="r-arrow"></span>
					</sec:ifAnyGranted>
					<g:if test="${productionInstance.status.value.equalsIgnoreCase(ProductionStatus.OPEN_CANDIDATES_REQUIRED.value) }">
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
						<g:link class="create" controller="castingProfile" action="create" params="${['production.id':productionInstance?.id]}">
						<g:message code="default.add.label" args="['Casting Profile']"/>
						</g:link>
					</sec:ifAnyGranted>
					</g:if>
				</fieldset>
			</g:form>
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow

$(document).ready(function() {		
	$("#accordion" ).accordion({ active: cland_params.active_sidebar() });
	stageDisplay("stage1")
	stageDisplay("stage2")
	stageDisplay("stage3")
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
					stageDisplay(getCurrentTabText())
				},
				beforeLoad : function(event, ui) {
					ui.jqXHR.error(function() {
						ui.panel
						.html("Couldn't load this tab. We'll try to fix this as soon as possible. ");
					});
				}
		});
});  //end method ready(...)
function setAllRadio(group,value,checked){
	//alert(group + " - " + value)
	$(group).each(function() {
		var el = $(this)
        //alert(el.val() + " - " + el.is(':checked'))
        if(el.val() == value){           
          el.attr("checked",checked)
        }
    });
}
function onSuccessFilterStage1CallbackHander(data, textStatus){
	stageDisplay("stage1")
}
function onSuccessFilterStage2CallbackHander(data, textStatus){
	stageDisplay("stage2")	
}
function onSuccessFilterStage3CallbackHander(data, textStatus){
	stageDisplay("stage3")
}
function onSuccessStage1CallbackHander(data,textStatus){
	stageDisplay("stage1")
}
function onSuccessStage2CallbackHander(data,textStatus){
	stageDisplay("stage2")
}
function onSuccessStage3CallbackHander(data,textStatus){
	stageDisplay("stage3")
}
function onLoading(){
	$(".wait").show()
	//$(".action_wait").attr("disabled",true)
}
function onComplete(){
	$(".wait").hide()
	//$(".action_wait").attr("disabled",false)
}
function onFailure(data,textStatus){
	$(".wait").hide()
	alert("Operation failed with status '" + textStatus + "'")
}
function beforeSubmit(){
	if (!confirm('sure?')) {return false;}
}
function submitForm(form_id,action,update){
	var form = $(form_id)
	var b4_action = form.attr("action")
	var b4_onsubmit = form.attr("onsubmit")
	var onsubmit = b4_onsubmit.replace(b4_action,action)
	
	form.attr("action",action)
	form.attr("onsubmit",onsubmit)
//	form.submit()

//	form.attr("action",b4_action)
//	form.attr("onsubmit",b4_onsubmit)
}
function filterDialog(){
  	 var $dialog = $('<div></div>')

             .load('../dialogfilter/'+cland_params.this_id)
             .dialog({
                 autoOpen: false,
                 width:450,
                 beforeClose: function(event,ui){
                 	
                 },
                 close: function(event){     
                 	loadProfiles()
                 },
                 title: 'Profile Filter'                         
             });
                 
    $dialog.dialog('open');
  }


</script>
	</body>
	
</html>
