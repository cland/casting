<%@ page import="com.cland.casting.Agency" %>

<div class="fieldcontain ${hasErrors(bean: agencyInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="agency.company.label" default="Select Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select onChange="onChangeCompany();" id="company" name="company.id" from="${com.cland.casting.Organisation.list()}" optionKey="id" value="${agencyInstance?.company?.id}" class="many-to-one" noSelection="['': '--Add New Company--']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: agencyInstance?.company, field: 'company.name', 'error')} ">
	<label for="company.name">
		<g:message code="organisation.name.label" default="Company Name" />		
	</label>
	<g:textField name="company.name" value="${agencyInstance?.company?.name}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: agencyInstance?.company, field: 'phoneNo', 'error')} ">
	<label for="company.phoneNo">
		<g:message code="organisation.phoneNo.label" default="Phone No" />
		
	</label>
	<g:textField name="company.phoneNo" value="${agencyInstance?.company?.phoneNo}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: agencyInstance?.company, field: 'email', 'error')} ">
	<label for="company.email">
		<g:message code="organisation.email.label" default="Email" />		
	</label>
	<g:textField name="company.email" value="${agencyInstance?.company?.email}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: agencyInstance?.company, field: 'contactPerson', 'error')} ">
	<label for="company.contactPerson">
		<g:message code="organisation.contactPerson.label" default="Contact person" />
		
	</label>
	<g:textField name="company.contactPerson" value="${agencyInstance?.company?.contactPerson}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agencyInstance, field: 'contacts', 'error')} ">
	<label for="contacts">
		<g:message code="agency.contacts.label" default="Authorised Users" />
		
	</label>
	<g:select name="contacts" from="${agencyList}" multiple="multiple" optionKey="id" size="5" value="${agencyInstance?.contacts*.id}" optionValue="mediumDetails" class="many-to-many"/>
</div>

