<%@ page import="com.cland.casting.Organisation" %>



<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="organisation.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${organisationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'phoneNo', 'error')} ">
	<label for="phoneNo">
		<g:message code="organisation.phoneNo.label" default="Phone No" />
		
	</label>
	<g:textField name="phoneNo" value="${organisationInstance?.phoneNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="organisation.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${organisationInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'phyAddress', 'error')} ">
	<label for="phyAddress">
		<g:message code="organisation.phyAddress.label" default="Phy Address" />
		
	</label>
	<g:textField name="phyAddress" value="${organisationInstance?.phyAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'region', 'error')} ">
	<label for="region">
		<g:message code="organisation.region.label" default="Region" />
		
	</label>
	<g:select id="region" name="region.id" from="${com.cland.casting.Region.list()}" optionKey="id" value="${organisationInstance?.region?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="organisation.country.label" default="Country" />
		
	</label>
	<g:select id="country" name="country.id" from="${com.cland.casting.Country.list()}" optionKey="id" value="${organisationInstance?.country?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="organisation.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${organisationInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'contactPerson', 'error')} ">
	<label for="contactPerson">
		<g:message code="organisation.contactPerson.label" default="Contact Person" />
		
	</label>
	<g:textField name="contactPerson" value="${organisationInstance?.contactPerson}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'postalAddress', 'error')} ">
	<label for="postalAddress">
		<g:message code="organisation.postalAddress.label" default="Postal Address" />
		
	</label>
	<g:textField name="postalAddress" value="${organisationInstance?.postalAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'postalPostCode', 'error')} ">
	<label for="postalPostCode">
		<g:message code="organisation.postalPostCode.label" default="Postal Post Code" />
		
	</label>
	<g:textField name="postalPostCode" value="${organisationInstance?.postalPostCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'phyPostCode', 'error')} ">
	<label for="phyPostCode">
		<g:message code="organisation.phyPostCode.label" default="Phy Post Code" />
		
	</label>
	<g:textField name="phyPostCode" value="${organisationInstance?.phyPostCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="organisation.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${organisationInstance?.comments}"/>
</div>

