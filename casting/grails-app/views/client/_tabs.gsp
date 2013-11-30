<!-- The tabs -->
<div id="tabs" style="display: none;">
	<ul>
	    <li><a href="#tab-client">Details</a></li>
		<li><a href="#tab-productions">Productions</a></li>
	</ul>
	<div id="tab-client">
			<ol class="property-list client">
			
				<g:if test="${clientInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="client.company.label" default="Company" /></span>	
						<span class="property-value" aria-labelledby="company-label"><g:link controller="organisation" action="show" id="${clientInstance?.company?.id}">${clientInstance?.company?.encodeAsHTML()}</g:link></span>	
				</li>
				</g:if>
				<g:if test="${clientInstance?.company?.phoneNo}">
				<li class="fieldcontain">
					<span id="company-phoneno-label" class="property-label"><g:message code="organisation.phoneno.label" default="Contact No." /></span>	
						<span class="property-value" aria-labelledby="company-label">${clientInstance?.company?.phoneNo?.encodeAsHTML()}</span>	
				</li>
				</g:if>	
				<g:if test="${clientInstance?.company?.email}">
				<li class="fieldcontain">
					<span id="company-email-label" class="property-label"><g:message code="organisation.email.label" default="Email" /></span>	
						<span class="property-value" aria-labelledby="company-label">${clientInstance?.company?.email?.encodeAsHTML()}</span>	
				</li>
				</g:if>						
				<g:if test="${clientInstance?.contacts}">
				<li class="fieldcontain">
					<span id="contacts-label" class="property-label"><g:message code="client.contacts.label" default="Contacts" /></span>
					
						<g:each in="${clientInstance.contacts}" var="c">
						<span class="property-value" aria-labelledby="contacts-label"><g:link controller="user" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.productions}">
				<li class="fieldcontain">
					<span id="productions-label" class="property-label"><g:message code="client.productions.label" default="Productions" /></span>
					
						<g:each in="${clientInstance.productions}" var="p">
						<span class="property-value" aria-labelledby="productions-label"><g:link controller="production" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>			
	</div>

	<div id="tab-productions">
	-- list of productions that this client has --
	</div>
</div>

<!--  End tabs -->