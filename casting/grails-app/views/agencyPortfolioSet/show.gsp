<%@ page import="com.cland.casting.SystemRoles" %>
<%@ page import="com.cland.casting.AgencyPortfolioSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agencyPortfolioSet.label', default: 'AgencyPortfolioSet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
		<div class="bread-crump">		
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_DEVELOPER }">	
			<span class="r-arrow"></span>			
			<g:link controller="agency" action="list">Agencies</g:link>
			</sec:ifAnyGranted>
			<g:if test="${candidateInstance?.agency }">
			<span class="r-arrow"></span>
			<g:link controller="agency" action="show" params="${['id':candidateInstance?.agency?.id]}">Agency: ${candidateInstance?.agency?.encodeAsHTML()}</g:link>
			</g:if>
			<span class="r-arrow"></span>
			<g:link controller="candidate" action="show" params="${['id':candidateInstance?.id] }"> ${candidateInstance?.encodeAsHTML() }</g:link>
			<span class="r-arrow"></span> <span class="current-crump">
				${candidateInstance?.person }
			</span>
		</div>
	<div id="status1" class="leftbar" role="complementary">
         <g:render template="../layouts/sidenav-admin"></g:render>
    </div>	
		<a href="#show-agencyPortfolioSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-agencyPortfolioSet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list agencyPortfolioSet">
			
				<g:if test="${agencyPortfolioSetInstance?.candidate}">
				<li class="fieldcontain">
					<span id="candidate-label" class="property-label"><g:message code="agencyPortfolioSet.candidate.label" default="Candidate" /></span>
					
						<span class="property-value" aria-labelledby="candidate-label"><g:link controller="candidate" action="show" id="${agencyPortfolioSetInstance?.candidate?.id}">${agencyPortfolioSetInstance?.candidate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${agencyPortfolioSetInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="agencyPortfolioSet.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${agencyPortfolioSetInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
				<g:if test="${agencyPortfolioSetInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="agencyPortfolioSet.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${agencyPortfolioSetInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agencyPortfolioSetInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="agencyPortfolioSet.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${agencyPortfolioSetInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${agencyPortfolioSetInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="agencyPortfolioSet.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${agencyPortfolioSetInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<div id="attachments" class="attachments">	
			<h3>Pictures</h3>
			<attachments:each bean="${agencyPortfolioSetInstance}" inputName="pictures" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:agencyPortfolioSetInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
		</div>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${agencyPortfolioSetInstance?.id}" />
					<g:link class="edit" action="edit" id="${agencyPortfolioSetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
