
<%@ page import="com.cland.casting.Production" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'production.label', default: 'Production')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	<script type="text/javascript">
//<![CDATA[
var cland_params = {
		active_tab : function(){ if (${params.tab==null}) return 0; else return ${params.tab};}
	}
//]]>
</script>		
	</head>
	<body>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="production" action="list">Productions</g:link>
				<span class="r-arrow"></span> <span class="current-crump">
					Production: ${productionInstance?.name } (Client: ${productionInstance?.client?.encodeAsHTML()})
				</span>
		</div>	
		<a href="#show-production" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<tmpl:sidenav/>
		<div id="show-production" class="content scaffold-show" role="main">
			<h1>Production: ${productionInstance?.name }</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<!-- The tabs -->
			<tmpl:tabs/>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productionInstance?.id}" />
					<g:link class="edit" action="edit" id="${productionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		<script type="text/javascript">
// when the page has finished loading.. execute the follow

$(document).ready(function() {		
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
