<!-- The tabs -->
<div id="tabs" style="display: none;">
	<ul>
	    <li><a href="#tab-agency">Details</a></li>
		<li><a href="#tab-candidates">Candidates</a></li>
		<li><a href="#tab-productions">Productions</a></li>
	</ul>
	<div id="tab-agency">
			<ol class="property-list agency">			
				<g:if test="${agencyInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="agency.company.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:link controller="organisation" action="show" id="${agencyInstance?.company?.id}">${agencyInstance?.company?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			<g:if test="${agencyInstance?.categories}">
				<li class="fieldcontain">
					<span id="categories-label" class="property-label"><g:message code="agency.categories.label" default="Category" /></span>
					
						<g:each in="${agencyInstance.categories}" var="c">
						<span class="property-value" aria-labelledby="categories-label">${c.encodeAsHTML()}</span>
						</g:each>					
				</li>
				</g:if>
				<g:if test="${agencyInstance?.company}">
				<li class="fieldcontain">
					<span id="contacts-label" class="property-label"><g:message code="agency.contacts.label" default="Phone number" /></span>
					
						<g:each in="${agencyInstance.company}" var="c">
						<span class="property-value" aria-labelledby="contacts-label"><g:link controller="user" action="show" id="${c.id}">${c?.phoneNo?.encodeAsHTML()}</g:link></span>
						</g:each>					
				</li>
				<li class="fieldcontain">
					<span id="contacts-label" class="property-label"><g:message code="agency.contacts.label" default="Primary contact" /></span>
						
						<span class="property-value" aria-labelledby="contacts-label"><g:link controller="user" action="show" id="${agencyInstance.company.id}">${agencyInstance?.company?.contactPerson?.encodeAsHTML()}</g:link></span>
										
				</li>				
				</g:if>
				<g:if test="${agencyInstance?.contacts}">
				<li class="fieldcontain">
					<span id="contacts-label" class="property-label"><g:message code="agency.contacts.label" default="System users" /></span>
					
						<g:each in="${agencyInstance.contacts}" var="c">
						<span class="property-value" aria-labelledby="contacts-label"><g:link controller="user" action="show" id="${c.id}">${c.getShortDetails().encodeAsHTML()}</g:link></span>
						</g:each>					
				</li>
				</g:if>
			
			</ol>
	</div>
	<div id="tab-candidates">
					<ol>
					<g:if test="${agencyInstance?.candidates}">
				
						<g:each in="${agencyInstance.candidates}" var="c">
						<span class="property-value" aria-labelledby="candidates-label"><g:link controller="candidate" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						<span class="property-value" aria-labelledby="candidates-label">${c?.clothing?.encodeAsHTML()}</span>
						<span class="property-value" aria-labelledby="candidates-label">${c?.clothing?.encodeAsHTML()}</span>
						<span class="property-value" aria-labelledby="candidates-label">${c?.eyes?.encodeAsHTML()}</span>
						<span class="property-value" aria-labelledby="candidates-label">${c?.hair?.encodeAsHTML()}</span>
						<span class="property-value" aria-labelledby="candidates-label">${c?.height?.encodeAsHTML()}</span><br/>
						</g:each>					
			
				</g:if>
					</ol>
	</div>
	<div id="tab-productions">
		<ol>
			<g:if test="${productionList}">
			
					<g:each in="${productionList}" var="p">
					<span class="property-value" aria-labelledby="production-label"><g:link controller="production" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
					<span class="property-value" aria-labelledby="production-label">${p?.status?.encodeAsHTML()}</span>
					<span class="property-value" aria-labelledby="production-label">${p?.shootDate?.encodeAsHTML()}</span>
					<span class="property-value" aria-labelledby="production-label">${p?.roles}</span>
					<span class="property-value" aria-labelledby="production-label">${p?.categories}</span>
					<br/>
					</g:each>					
		
			</g:if>
		</ol>
	</div>
</div>

<!--  End tabs -->