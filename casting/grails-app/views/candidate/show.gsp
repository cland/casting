
<%@ page import="com.cland.casting.Candidate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-candidate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-candidate" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list candidate">
			
				<g:if test="${candidateInstance?.agency}">
				<li class="fieldcontain">
					<span id="agency-label" class="property-label"><g:message code="candidate.agency.label" default="Agency" /></span>
					
						<span class="property-value" aria-labelledby="agency-label"><g:link controller="agency" action="show" id="${candidateInstance?.agency?.id}">${candidateInstance?.agency?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.clothing}">
				<li class="fieldcontain">
					<span id="clothing-label" class="property-label"><g:message code="candidate.clothing.label" default="Clothing" /></span>
					
						<span class="property-value" aria-labelledby="clothing-label"><g:fieldValue bean="${candidateInstance}" field="clothing"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.eyes}">
				<li class="fieldcontain">
					<span id="eyes-label" class="property-label"><g:message code="candidate.eyes.label" default="Eyes" /></span>
					
						<span class="property-value" aria-labelledby="eyes-label"><g:fieldValue bean="${candidateInstance}" field="eyes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.hair}">
				<li class="fieldcontain">
					<span id="hair-label" class="property-label"><g:message code="candidate.hair.label" default="Hair" /></span>
					
						<span class="property-value" aria-labelledby="hair-label"><g:fieldValue bean="${candidateInstance}" field="hair"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.height}">
				<li class="fieldcontain">
					<span id="height-label" class="property-label"><g:message code="candidate.height.label" default="Height" /></span>
					
						<span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${candidateInstance}" field="height"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="candidate.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="user" action="show" id="${candidateInstance?.person?.id}">${candidateInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.pictures}">
				<li class="fieldcontain">
					<span id="pictures-label" class="property-label"><g:message code="candidate.pictures.label" default="Pictures" /></span>
					
						<g:each in="${candidateInstance.pictures}" var="p">
						<span class="property-value" aria-labelledby="pictures-label"><g:link controller="pictureSet" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.shoe}">
				<li class="fieldcontain">
					<span id="shoe-label" class="property-label"><g:message code="candidate.shoe.label" default="Shoe" /></span>
					
						<span class="property-value" aria-labelledby="shoe-label"><g:fieldValue bean="${candidateInstance}" field="shoe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.videos}">
				<li class="fieldcontain">
					<span id="videos-label" class="property-label"><g:message code="candidate.videos.label" default="Videos" /></span>
					
						<g:each in="${candidateInstance.videos}" var="v">
						<span class="property-value" aria-labelledby="videos-label"><g:link controller="videoSet" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.waist}">
				<li class="fieldcontain">
					<span id="waist-label" class="property-label"><g:message code="candidate.waist.label" default="Waist" /></span>
					
						<span class="property-value" aria-labelledby="waist-label"><g:fieldValue bean="${candidateInstance}" field="waist"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${candidateInstance?.id}" />
					<g:link class="edit" action="edit" id="${candidateInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
