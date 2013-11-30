<%@ page import="com.cland.casting.Production" %>

<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="production.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${productionInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'shootDate', 'error')} required">
	<label for="shootDate">
		<g:message code="production.shootDate.label" default="Shoot Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="shootDate" class="datepick" id="shoot-date" value="${productionInstance?.shootDate?.format('dd-MMM-yyyy')}"/>	
	
</div>
<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'status', 'error')} required">
	<label for="type">
		<g:message code="production.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.cland.casting.Production$ProductionStatus?.values()}" keys="${com.cland.casting.Production$ProductionStatus.values()*.name()}" required="" value="${productionInstance?.status?.name()}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="production.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${productionInstance?.description}" rows="5" cols="40"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'client', 'error')} required">
	<label for="client">
		<g:message code="production.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${com.cland.casting.Client.list()}" optionKey="id" required="" value="${productionInstance?.client?.id}" class="many-to-one"/>
</div>


<div
	class="fieldcontain ${hasErrors(bean: productionInstance, field: 'profiles', 'error')} ">
	<label for="profiles"> <g:message
			code="production.profiles.label" default="Profiles" />
	</label>
	<ul class="one-to-many">
		<g:each in="${productionInstance?.profiles?}" var="p">
			<li><g:link controller="castingProfile" action="show"
					id="${p.id}">
					${p?.encodeAsHTML()}
				</g:link></li>
		</g:each>
		
	</ul>
</div>

<g:render template="categoriesTable"/>
<g:render template="portfoliosTable"/>
<g:render template="rolesTable"/>

<br/>
<h5>Which agencies can access this production</h5>
<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'agencyACL', 'error')} ">
		<label for="agencyACL">
			<g:message code="production.agencyacl.label" default="Agency Access List" />		
		</label>
		<g:select name="agencyACL" from="${com.cland.casting.Agency.list()}" multiple="multiple" optionKey="id" size="5" value="${productionInstance?.agencyACL*.id}" class="many-to-many"/>
</div>



