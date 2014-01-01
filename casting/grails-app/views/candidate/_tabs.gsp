<!-- The tabs -->
<%@ page import="com.cland.casting.SystemRoles" %>
<div id="tabs" style="display: none;">
	<ul>
	    <li><a href="#tab-candidate">Details</a></li>
		<li><a href="#tab-profiles">Casting Profiles</a></li>
		<li><a href="#tab-photos">Photos</a></li>
	</ul>
	<div id="tab-candidate">
	<fieldset><legend>Person Details</legend>
	<div id="candidate-mugshot-${castingProfileInstance?.id }" class="candidate-mugshot">
			<g:set var="hasphoto" value="${false }"/>
		    <attachments:each bean="${candidateInstance}" inputName="headshot" status="j">	         
				<g:if test="${j==0}">
					<g:set var="hasphoto" value="${true }"/>
					<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>		
				</g:if>			
			</attachments:each>	
			
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
				<g:if test="${hasphoto==false}"> 
					<g:if test="${ candidateInstance}">
							<g:link class="edit" action="edit" id="${candidateInstance?.id}">
							<g:message code="default.add.label" args="['Headshot']"/>
							</g:link>
					</g:if>
					
				</g:if>
			</sec:ifAnyGranted>
		</div>
		<ol class="property-list candidate">
		
				<g:if test="${candidateInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="candidate.person.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="user" action="show" id="${candidateInstance?.person?.id}">${candidateInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				<li class="fieldcontain">
					<span id="person-gender-label" class="property-label"><g:message code="candidate.person.gender.label" default="Gender" /></span>					
					<span class="property-value" aria-labelledby="person-gender-label"> ${candidateInstance?.person?.gender?.encodeAsHTML()}</span>					
				</li>
				<li class="fieldcontain">
					<span id="person-race-label" class="property-label"><g:message code="candidate.person.race.label" default="Race" /></span>					
					<span class="property-value" aria-labelledby="person-race-label"> ${candidateInstance?.person?.race?.encodeAsHTML()}</span>					
				</li>
				<li class="fieldcontain">
					<span id="person-contactno-label" class="property-label"><g:message code="candidate.person.contactno.label" default="Contact No." /></span>					
					<span class="property-value" aria-labelledby="person-contactno-label"> ${candidateInstance?.person?.contactNo?.encodeAsHTML()}</span>					
				</li>
				<li class="fieldcontain">
					<span id="person-email-label" class="property-label"><g:message code="candidate.person.email.label" default="Email" /></span>					
					<span class="property-value" aria-labelledby="person-email-label"> ${candidateInstance?.person?.email?.encodeAsHTML()}</span>					
				</li>	
				<li class="fieldcontain">
					<span id="person-email-label" class="property-label"><g:message code="candidate.person.dateofbirth.label" default="Date of Birth" /></span>					
					<span class="property-value"><g:formatDate date="${candidateInstance?.person?.dateOfBirth}" format="dd-MMM-yyyy"/></span>						
				</li>
				</g:if>	
					
				<g:if test="${candidateInstance?.agency}">
				<li class="fieldcontain">
					<span id="agency-label" class="property-label"><g:message code="candidate.agency.label" default="Agency" /></span>
					
					<span class="property-value" aria-labelledby="agency-label"><g:link controller="agency" action="show" id="${candidateInstance?.agency?.id}">${candidateInstance?.agency?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				<g:if test="${candidateInstance?.keywords}">
				<li class="fieldcontain">
					<span id="keywords-label" class="property-label"><g:message code="candidate.keywords.label" default="Keywords" /></span>					
					<span class="property-value" aria-labelledby="keywords-label">${candidateInstance?.keywords?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			</ol>
		</fieldset>
		<br/>
		<fieldset><legend>Characteristics</legend>	
		<ol class="property-list candidate">
				<g:if test="${candidateInstance?.clothing}">
				<li class="fieldcontain">
					<span id="clothing-label" class="property-label"><g:message code="candidate.clothing.label" default="Clothing" /></span>
					
						<span class="property-value" aria-labelledby="clothing-label"><g:fieldValue bean="${candidateInstance}" field="clothing"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.eyes}">
				<li class="fieldcontain">
					<span id="eyes-label" class="property-label"><g:message code="candidate.eyes.label" default="Eyes" /></span>
					
						<span class="property-value" aria-labelledby="eyes-label"><g:fieldValue bean="${candidateInstance}" field="eyes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.hair}">
				<li class="fieldcontain">
					<span id="hair-label" class="property-label"><g:message code="candidate.hair.label" default="Hair" /></span>
					
						<span class="property-value" aria-labelledby="hair-label"><g:fieldValue bean="${candidateInstance}" field="hair"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.height}">
				<li class="fieldcontain">
					<span id="height-label" class="property-label"><g:message code="candidate.height.label" default="Height" /></span>
					
						<span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${candidateInstance}" field="height"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.shoe}">
				<li class="fieldcontain">
					<span id="shoe-label" class="property-label"><g:message code="candidate.shoe.label" default="Shoe" /></span>
					
						<span class="property-value" aria-labelledby="shoe-label"><g:fieldValue bean="${candidateInstance}" field="shoe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateInstance?.waist}">
				<li class="fieldcontain">
					<span id="waist-label" class="property-label"><g:message code="candidate.waist.label" default="Waist" /></span>
					
						<span class="property-value" aria-labelledby="waist-label"><g:fieldValue bean="${candidateInstance}" field="waist"/></span>
					
				</li>
				</g:if>
				</ol>
			</fieldset>
						
	</div>
	
	<!-- PRODUCTION PROFILE TAB -->
	<div id="tab-profiles">
	 <g:each in="${profileList }" var="p">
	 	<span class="property-value" aria-labelledby="candidates-label">
	 		<g:link controller="castingProfile" action="show" id="${p.id}">${p?.encodeAsHTML()} | ${p?.production?.name?.encodeAsHTML()}</g:link>
	 	</span>
	 </g:each>
	</div>
	
	<div id="tab-photos">
					<table>
				<thead>
					<tr>
					<th><g:message code="agencyPortfolioSet.candidate.label" default="Candidate" /></th>
					<g:sortableColumn property="name" title="${message(code: 'agencyPortfolioSet.name.label', default: 'Title')}" />
					<g:sortableColumn property="createdBy" title="${message(code: 'agencyPortfolioSet.createdBy.label', default: 'Created By')}" />
					<g:sortableColumn property="dateCreated" title="${message(code: 'agencyPortfolioSet.dateCreated.label', default: 'Date Created')}" />
					<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'agencyPortfolioSet.lastUpdatedBy.label', default: 'Last Updated By')}" />
					<g:sortableColumn property="lastUpdated" title="${message(code: 'agencyPortfolioSet.lastUpdated.label', default: 'Last Updated')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${candidateInstance?.portfolios}" status="i" var="agencyPortfolioSetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${fieldValue(bean: agencyPortfolioSetInstance, field: "candidate.person")}</td>
						<td><g:link controller="agencyPortfolioSet" action="show" id="${agencyPortfolioSetInstance.id}">${fieldValue(bean: agencyPortfolioSetInstance, field: "name")}</g:link></td>			
						<td><g:userFullname id="${fieldValue(bean: agencyPortfolioSetInstance, field: "createdBy")}"/></td>
						<td><g:formatDate date="${agencyPortfolioSetInstance.dateCreated}" format="dd-MMM-yyyy"/></td>
						<td><g:userFullname id="${fieldValue(bean: agencyPortfolioSetInstance, field: "lastUpdatedBy")}" default="None"/></td>
						<td><g:formatDate date="${agencyPortfolioSetInstance.lastUpdated}" format="dd-MMM-yyyy"/></td>
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
	</div>
</div>
<!--  End tabs -->