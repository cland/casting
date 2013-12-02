<!-- The tabs -->
<div id="tabs" style="display: none;">
	<ul>
		<li><a href="#tab-person">Personal Details</a></li>
		<li><a href="#tab-employee">Employee Details</a></li>
		<li id='tab_learner_head'><a href="#tab-learner">Other</a></li>
		<li><a href="#tab-attachments">Supporting Documents</a></li>
	</ul>
	<div id="tab-person">
			<ol class="property-list user">
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				
				<g:if test="${userInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="user.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="user.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${userInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.homeLanguage}">
				<li class="fieldcontain">
					<span id="homeLanguage-label" class="property-label"><g:message code="user.homeLanguage.label" default="Home Language" /></span>
					
						<span class="property-value" aria-labelledby="homeLanguage-label"><g:fieldValue bean="${userInstance}" field="homeLanguage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.salutation}">
				<li class="fieldcontain">
					<span id="salutation-label" class="property-label"><g:message code="user.salutation.label" default="Salutation" /></span>
					
						<span class="property-value" aria-labelledby="salutation-label"><g:fieldValue bean="${userInstance}" field="salutation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.idNo}">
				<li class="fieldcontain">
					<span id="idNo-label" class="property-label"><g:message code="user.idNo.label" default="Id No" /></span>
					
						<span class="property-value" aria-labelledby="idNo-label"><g:fieldValue bean="${userInstance}" field="idNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="user.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${userInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="user.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${userInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.race}">
				<li class="fieldcontain">
					<span id="race-label" class="property-label"><g:message code="user.race.label" default="Race" /></span>
					
						<span class="property-value" aria-labelledby="race-label"><g:link controller="race" action="show" id="${userInstance?.race?.id}">${userInstance?.race?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.maritalStatus}">
				<li class="fieldcontain">
					<span id="maritalStatus-label" class="property-label"><g:message code="user.maritalStatus.label" default="Marital Status" /></span>
					
						<span class="property-value" aria-labelledby="maritalStatus-label"><g:fieldValue bean="${userInstance}" field="maritalStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.communicationMode}">
				<li class="fieldcontain">
					<span id="communicationMode-label" class="property-label"><g:message code="user.communicationMode.label" default="Communication Mode" /></span>
					
						<span class="property-value" aria-labelledby="communicationMode-label"><g:fieldValue bean="${userInstance}" field="communicationMode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="user.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${userInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="user.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${userInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.region}">
				<li class="fieldcontain">
					<span id="region-label" class="property-label"><g:message code="user.region.label" default="Region" /></span>
					
						<span class="property-value" aria-labelledby="region-label"><g:link controller="region" action="show" id="${userInstance?.region?.id}">${userInstance?.region?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="user.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:link controller="country" action="show" id="${userInstance?.country?.id}">${userInstance?.country?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.contactNo}">
				<li class="fieldcontain">
					<span id="contactNo-label" class="property-label"><g:message code="user.contactNo.label" default="Contact No" /></span>
					
						<span class="property-value" aria-labelledby="contactNo-label"><g:fieldValue bean="${userInstance}" field="contactNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="user.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:link controller="organisation" action="show" id="${userInstance?.company?.id}">${userInstance?.company?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="user.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${userInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			</ol>
			<fieldset><legend>Login Details</legend>
			<ol  class="property-list user">
				<li class="fieldcontain">
				<span id="roles-label" class="property-label"><g:message code="user.roles.label" default="Roles" /></span>
				
				<g:each var="auth" in="${roleMap}">
					&nbsp;<span class="r-arrow"></span> ${auth } 
				</g:each>				
				</li>
				<g:if test="${userInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span>					
					<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></span>					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			</fieldset>
	</div>
	<div id="tab-employee">
		
	</div>
	<div id="tab-learner">
		
	</div>
	<div id="tab-attachments">
		<div id="attachments" class="attachments">
			<attachments:each bean="${userInstance}">
				<attachments:icon attachment="${attachment}" />
				<attachments:deleteLink attachment="${attachment}" label="${'[X]'}"
					returnPageURI="${createLink(action: 'show', id: userInstance.id,absolute:true)}" />
				<attachments:downloadLink attachment="${attachment}" />
				${attachment.niceLength}
			</attachments:each>
		</div>
	</div>
</div>
<!--  End tabs -->