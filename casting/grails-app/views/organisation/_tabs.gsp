<!-- The tabs -->
<div id="tabs" style="display: none;">
	<ul>
	    <li><a href="#tab-agency">Details</a></li>
		<li><a href="#tab-other">Other</a></li>
	</ul>
	<div id="tab-agency">
				<ol class="property-list organisation">
			
				<g:if test="${organisationInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="organisation.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${organisationInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.phoneNo}">
				<li class="fieldcontain">
					<span id="phoneNo-label" class="property-label"><g:message code="organisation.phoneNo.label" default="Phone No" /></span>
					
						<span class="property-value" aria-labelledby="phoneNo-label"><g:fieldValue bean="${organisationInstance}" field="phoneNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="organisation.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${organisationInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.phyAddress}">
				<li class="fieldcontain">
					<span id="phyAddress-label" class="property-label"><g:message code="organisation.phyAddress.label" default="Phy Address" /></span>
					
						<span class="property-value" aria-labelledby="phyAddress-label"><g:fieldValue bean="${organisationInstance}" field="phyAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.region}">
				<li class="fieldcontain">
					<span id="region-label" class="property-label"><g:message code="organisation.region.label" default="Region" /></span>
					
						<span class="property-value" aria-labelledby="region-label"><g:link controller="region" action="show" id="${organisationInstance?.region?.id}">${organisationInstance?.region?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="organisation.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:link controller="country" action="show" id="${organisationInstance?.country?.id}">${organisationInstance?.country?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="organisation.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${organisationInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="organisation.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${organisationInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.contactPerson}">
				<li class="fieldcontain">
					<span id="contactPerson-label" class="property-label"><g:message code="organisation.contactPerson.label" default="Contact Person" /></span>
					
						<span class="property-value" aria-labelledby="contactPerson-label"><g:fieldValue bean="${organisationInstance}" field="contactPerson"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.postalAddress}">
				<li class="fieldcontain">
					<span id="postalAddress-label" class="property-label"><g:message code="organisation.postalAddress.label" default="Postal Address" /></span>
					
						<span class="property-value" aria-labelledby="postalAddress-label"><g:fieldValue bean="${organisationInstance}" field="postalAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.postalPostCode}">
				<li class="fieldcontain">
					<span id="postalPostCode-label" class="property-label"><g:message code="organisation.postalPostCode.label" default="Postal Post Code" /></span>
					
						<span class="property-value" aria-labelledby="postalPostCode-label"><g:fieldValue bean="${organisationInstance}" field="postalPostCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.phyPostCode}">
				<li class="fieldcontain">
					<span id="phyPostCode-label" class="property-label"><g:message code="organisation.phyPostCode.label" default="Phy Post Code" /></span>
					
						<span class="property-value" aria-labelledby="phyPostCode-label"><g:fieldValue bean="${organisationInstance}" field="phyPostCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="organisation.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${organisationInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
			</ol>		
	</div>

	<div id="tab-other">

	</div>
</div>

<!--  End tabs -->