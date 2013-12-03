<%@ page import="com.cland.casting.Client" %>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="client.company.label" default="Select Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${com.cland.casting.Organisation.list()}" optionKey="id"  value="${clientInstance?.company?.id}" class="many-to-one" noSelection="['': '--Add New Company--']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: clientInstance?.company, field: 'company.name', 'error')} ">
	<label for="company.phoneNo">
		<g:message code="organisation.name.label" default="Company Name" />		
	</label>
	<g:textField name="company.name" value="${clientInstance?.company?.name}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: clientInstance?.company, field: 'company.phoneNo', 'error')} ">
	<label for="company.phoneNo">
		<g:message code="organisation.phoneNo.label" default="Phone No" />
		
	</label>
	<g:textField name="company.phoneNo" value="${clientInstance?.company?.phoneNo}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: clientInstance?.company, field: 'company.email', 'error')} ">
	<label for="company.email">
		<g:message code="organisation.email.label" default="Email" />		
	</label>
	<g:textField name="company.email" value="${clientInstance?.company?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'contacts', 'error')} ">
	<label for="contacts">
		<g:message code="client.contacts.label" default="Authorised Users" />
		
	</label>
	<g:select name="contacts" from="${directorList}" multiple="multiple" optionKey="id" size="5" value="${clientInstance?.contacts*.id}" class="many-to-many"/>
</div>


