<%@ page import="com.cland.casting.Agency" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agency.label', default: 'Agency')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>	
	</head>
	<body>
	<div class="bread-crump">
		<span class="r-arrow"></span>
		<g:link controller="agency" action="list">Agency</g:link>
		<span class="r-arrow"></span> <span class="current-crump">
			Agency: ${agencyInstance?.id } (Company: ${agencyInstance?.company?.encodeAsHTML()})
		</span>
	</div>
	<div id="status1" class="leftbar" role="complementary">
         <g:render template="../layouts/sidenav-admin"></g:render>
    </div>
		<a href="#edit-agency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="edit-agency" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${agencyInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${agencyInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${agencyInstance?.id}" />
				<g:hiddenField name="version" value="${agencyInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:link class="cancel" action="show" id="${agencyInstance?.id}"><g:message code="default.button.cancel.label" default="Cancel" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow

$(document).ready(function() {		
	$("#accordion" ).accordion();

	       
}); 
</script>
	</body>
</html>
