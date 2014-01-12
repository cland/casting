<!-- The tabs -->
<%@ page import="com.cland.casting.SystemRoles" %>
<div id="tabs" style="display: none;">
	<ul>
	    <li><a href="#tab-agency">Details</a></li>
	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">    
		<li><a href="#tab-candidates">Candidates</a></li>
		<li><a href="#tab-productions">Productions</a></li>
	</sec:ifAnyGranted>
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
						
						<span class="property-value" aria-labelledby="contacts-label">${agencyInstance?.company?.contactPerson?.encodeAsHTML()}</span>
										
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
	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
	<div id="tab-candidates">
			<table>
				<thead>
					<tr>
						<th><g:message code="candidate.person.label" default="Candidate" /></th>
						<th><g:message code="candidate.agency.label" default="Agency" /></th>					
						<g:sortableColumn property="clothing" title="${message(code: 'candidate.clothing.label', default: 'Clothing')}" />
						<g:sortableColumn property="eyes" title="${message(code: 'candidate.eyes.label', default: 'Eyes')}" />					
						<g:sortableColumn property="hair" title="${message(code: 'candidate.hair.label', default: 'Hair')}" />					
						<g:sortableColumn property="height" title="${message(code: 'candidate.height.label', default: 'Height')}" />
					</tr>
				</thead>
				<tbody>	
				<g:each in="${agencyInstance?.candidates}" status="i" var="candidateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${candidateInstance.id}">${fieldValue(bean: candidateInstance, field: "person")}</g:link></td>
						<td>${fieldValue(bean: candidateInstance, field: "agency")}</td>				
						<td>${fieldValue(bean: candidateInstance, field: "clothing")}</td>				
						<td>${fieldValue(bean: candidateInstance, field: "eyes")}</td>				
						<td>${fieldValue(bean: candidateInstance, field: "hair")}</td>					
						<td>${fieldValue(bean: candidateInstance, field: "height")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
				
	</div>
	<div id="tab-productions">
		
		<g:if test="${productionList}">
		<table>
			<thead>
				<tr>
				<g:sortableColumn property="name" title="${message(code: 'production.name.label', default: 'Name')}" />
				<g:sortableColumn property="status" title="${message(code: 'production.status.label', default: 'Status')}" />	
				<g:sortableColumn property="client.company.name" title="${message(code: 'production.client.label', default: 'Client')}" />
				<g:sortableColumn property="startDate" title="${message(code: 'production.startdate.label', default: 'Start Date')}" />
				<g:sortableColumn property="endDate" title="${message(code: 'production.enddate.label', default: 'End Date')}" />					
				</tr>
			</thead>
			<tbody>
			<g:each in="${productionList}" status="i" var="productionInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				
					<td><g:link controller="production" action="show" id="${productionInstance.id}">${fieldValue(bean: productionInstance, field: "name")}</g:link></td>
					<td>${fieldValue(bean: productionInstance, field: "status")}</td>
					<td>${fieldValue(bean: productionInstance, field: "client")}</td>
					<td>${productionInstance?.startDate.format("dd-MMM-yyyy") }</td>
					<td>${productionInstance?.endDate.format("dd-MMM-yyyy") }</td>
				</tr>
			</g:each>
			</tbody>
			</table>
							
	
		</g:if>
		
	</div>
	</sec:ifAnyGranted>
</div>

<!--  End tabs -->