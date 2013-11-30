<%@ page import="com.cland.casting.Candidate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
		<div class="bread-crump">			
			<span class="r-arrow"></span>
			<g:link controller="agency" action="list">Agencies</g:link>
			<g:if test="${agencyInstance }">
			<span class="r-arrow"></span>
				<g:link controller="agency" action="show" params="${['id':agencyInstance.id]}">Agency: ${agencyInstance.encodeAsHTML()}</g:link>
			</g:if>
			<span class="r-arrow"></span> <span class="current-crump">
				New Candidate
			</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
	         <g:render template="../layouts/sidenav-admin"></g:render>
	    </div>	
		<a href="#create-candidate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="create-candidate" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${candidateInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${candidateInstance}" var="error">
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
			       
		});
		</script>		
	</body>
</html>
