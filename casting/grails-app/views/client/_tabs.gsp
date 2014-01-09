<!-- The tabs -->
<%@ page import="com.cland.casting.SystemRoles" %>
<div id="tabs" style="display: none;">
	<ul>
	    <li><a href="#tab-client">Details</a></li>
	    <sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
		<li><a href="#tab-productions">Productions</a></li>
		</sec:ifAnyGranted>
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
					<span id="contacts-label" class="property-label"><g:message code="client.contacts.label" default="Authorised users" /></span>
					
						<g:each in="${clientInstance.contacts}" var="c">
						<span class="property-value" aria-labelledby="contacts-label"><g:link controller="user" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>							
			
			</ol>			
	</div>
<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
	<div id="tab-productions">
	<g:if test="${clientInstance?.productions}">
		<table>
			<thead>
				<tr>
				<g:sortableColumn property="name" title="${message(code: 'production.name.label', default: 'Name')}" />
				<g:sortableColumn property="status" title="${message(code: 'production.status.label', default: 'Status')}" />	
				<g:sortableColumn property="startDate" title="${message(code: 'production.startdate.label', default: 'Start Date')}" />
				<g:sortableColumn property="endDate" title="${message(code: 'production.enddate.label', default: 'End Date')}" />					
				</tr>
			</thead>
			<tbody>
			<g:each in="${clientInstance?.productions}" status="i" var="productionInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				
					<td><g:link controller="production" action="show" id="${productionInstance.id}">${fieldValue(bean: productionInstance, field: "name")}</g:link></td>
					<td>${fieldValue(bean: productionInstance, field: "status")}</td>
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