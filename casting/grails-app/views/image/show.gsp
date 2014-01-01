
<%@ page import="com.cland.casting.Image" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-image" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<fieldset><legend>Image</legend>
			<div id="headshot" class="attachments">
					<attachments:each bean="${imageInstance}" inputName="image" status="i">	
					<div class="photo-display float-left">
					<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
						<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
						<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
						${attachment.niceLength}
						<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
							returnPageURI="${createLink(action:'show', id:imageInstance.id,absolute:true)}" />
					</div>	
						<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
					
					</attachments:each>
					<div style="clear:both"></div>
			</div>
		</fieldset>
			<ol class="property-list image">
			
				<g:if test="${imageInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="image.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${imageInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imageInstance?.caption}">
				<li class="fieldcontain">
					<span id="caption-label" class="property-label"><g:message code="image.caption.label" default="Caption" /></span>
					
						<span class="property-value" aria-labelledby="caption-label"><g:fieldValue bean="${imageInstance}" field="caption"/></span>
					
				</li>
				</g:if>
			<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="image.locations.label" default="locations" /></span>
					
						<span class="property-value" aria-labelledby="name-label">${imageInstance?.locations?.join(",")}</span>
					
				</li>
				<g:if test="${imageInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="image.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${imageInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imageInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="image.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${imageInstance}" field="lastUpdatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imageInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="image.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${imageInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imageInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="image.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${imageInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${imageInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="image.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${imageInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${imageInstance?.id}" />
					<g:link class="edit" action="edit" id="${imageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
