<%@ page import="com.cland.casting.SystemRoles" %>
<%@ page import="com.cland.casting.Portfolio" %>
<g:set var="profileList" value ="${portfolioInstance?.profiles?.sort{
			if(params?.sortby?.equalsIgnoreCase("castname"))it?.firstLastName
			else if(params?.sortby?.equalsIgnoreCase("castdate")) it?.auditionDate
			else {it?.castNo}
		}}"/>
<g:set  var="productionInstance" value="${portfolioInstance?.production}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'portfolio.label', default: 'Portfolio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
		<div class="bread-crump">
			<span class="r-arrow"></span>
			<g:link controller="production" action="list">Productions</g:link>
			<span class="r-arrow"></span>
			<g:link controller="production" action="show" params="${['id':portfolioInstance?.production?.id]}">Production: ${portfolioInstance?.production?.name} (Client: ${portfolioInstance?.production?.client?.encodeAsHTML()})</g:link>
			<span class="r-arrow"></span> 
			<span class="current-crump">
				${portfolioInstance }
			</span>
		</div>	
		<div id="status1" class="leftbar" role="complementary">
	         <g:sideMenu default=""></g:sideMenu> 
	    </div>
		<a href="#show-portfolio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-portfolio" class="content scaffold-show" role="main">
			<h1>
				<g:message code="default.show.label" args="[entityName]" />: 
				<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${portfolioInstance}" field="name"/></span>
			</h1>
			<h4><g:fieldValue bean="${portfolioInstance}" field="comments"/></h4>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<div class="wait">PROCESSING....PLEASE WAIT!!!</div>
			<div class="cast-list">
			<g:formRemote name="cast_form" url="[controller:'portfolio',action:'display_profiles']" 
				update="cast-list" 
				onLoading="onLoading()"
				onComplete="onComplete()"
				onFailure="onFailure(data,textStatus)"
				onSuccess="onSuccessCastCallbackHander(data,textStatus)">
				<fieldset class="no-print"><legend>Display Options</legend>
					<g:render template="../layouts/display_options" model="[stage:'stage2',viewvalue:'list',sortvalue:'castno']"/>
				</fieldset>
				<g:hiddenField name="id" value="${portfolioInstance?.id }"/>
				<g:hiddenField name="stage" value="2"/>
				<div class="cell float-left"> </div>
				<div class="cell float-right"> </div>
				<div class="" id="cast-list">
					<table>
						<thead><tr>
							<th class="cell head">Cast No.</th>
				         	<th class="cell head">Name</th>
				         	<th class="cell head">Age</th>
				         	<th class="cell head">Production</th>
				         	<th class="cell head">Role</th>
				         	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
			         		<th class="cell head center">Invited</th>            
			         	</sec:ifAnyGranted>                	
				         	<th class="cell head center ">Shortlisted</th>
				         	<th class="cell head center">Confirmed</th>
				         </tr>
				         <tbody>
							<g:render template="../layouts/profile_list2" collection="${profileList}" var="profile"></g:render>			
						</tbody>         
					</table>
				</div>
				
			</g:formRemote>	
			</div>
		<div style="clear: both;"></div>
			<br/>	
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">		
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${portfolioInstance?.id}" />
					<g:link class="edit" action="edit" id="${portfolioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</sec:ifAnyGranted>
			
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow
function onSuccessCastCallbackHander(data,textStatus){
	stageDisplay("stage2")
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
