<%@ page import="com.cland.casting.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${userInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${userInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="user.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" value="${userInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'homeLanguage', 'error')} ">
	<label for="homeLanguage">
		<g:message code="user.homeLanguage.label" default="Home Language" />
		
	</label>
	<g:textField name="homeLanguage" value="${userInstance?.homeLanguage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'salutation', 'error')} ">
	<label for="salutation">
		<g:message code="user.salutation.label" default="Salutation" />
		
	</label>
	<g:select name="salutation" from="${userInstance.constraints.salutation.inList}" value="${userInstance?.salutation}" valueMessagePrefix="user.salutation" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'idNo', 'error')} ">
	<label for="idNo">
		<g:message code="user.idNo.label" default="Id No" />
		
	</label>
	<g:textField name="idNo" value="${userInstance?.idNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="user.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${userInstance?.dateOfBirth}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="user.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${userInstance.constraints.gender.inList}" value="${userInstance?.gender}" valueMessagePrefix="user.gender" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'race', 'error')} ">
	<label for="race">
		<g:message code="user.race.label" default="Race" />
		
	</label>
	<g:select id="race" name="race.id" from="${com.cland.casting.Race.list()}" optionKey="id" value="${userInstance?.race?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'maritalStatus', 'error')} ">
	<label for="maritalStatus">
		<g:message code="user.maritalStatus.label" default="Marital Status" />
		
	</label>
	<g:select name="maritalStatus" from="${userInstance.constraints.maritalStatus.inList}" value="${userInstance?.maritalStatus}" valueMessagePrefix="user.maritalStatus" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'communicationMode', 'error')} ">
	<label for="communicationMode">
		<g:message code="user.communicationMode.label" default="Communication Mode" />
		
	</label>
	<g:select name="communicationMode" from="${userInstance.constraints.communicationMode.inList}" value="${userInstance?.communicationMode}" valueMessagePrefix="user.communicationMode" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="user.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${userInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="user.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${userInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'region', 'error')} ">
	<label for="region">
		<g:message code="user.region.label" default="Region" />
		
	</label>
	<g:select id="region" name="region.id" from="${com.cland.casting.Region.list()}" optionKey="id" value="${userInstance?.region?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="user.country.label" default="Country" />
		
	</label>
	<g:select id="country" name="country.id" from="${com.cland.casting.Country.list()}" optionKey="id" value="${userInstance?.country?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'contactNo', 'error')} ">
	<label for="contactNo">
		<g:message code="user.contactNo.label" default="Contact No" />
		
	</label>
	<g:textField name="contactNo" value="${userInstance?.contactNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'company', 'error')} ">
	<label for="company">
		<g:message code="user.company.label" default="Company" />
		
	</label>
	<g:select id="company" name="company.id" from="${com.cland.casting.Organisation.list()}" optionKey="id" value="${userInstance?.company?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />
</div>
<tmpl:editRoles />
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
</div>

