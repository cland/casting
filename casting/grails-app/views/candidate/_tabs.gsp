<!-- The tabs -->
<div id="tabs" style="display: none;">
	<ul>
	    <li><a href="#tab-candidate">Details</a></li>
		<li><a href="#tab-profiles">Casting Profiles</a></li>
		
	</ul>
	<div id="tab-candidate">
	<fieldset><legend>Person Details</legend>
		<ol class="property-list candidate">
		
				<g:if test="${candidateInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="candidate.person.label" default="Candidate" /></span>
					
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
				</g:if>			
				<g:if test="${candidateInstance?.agency}">
				<li class="fieldcontain">
					<span id="agency-label" class="property-label"><g:message code="candidate.agency.label" default="Agency" /></span>
					
					<span class="property-value" aria-labelledby="agency-label"><g:link controller="agency" action="show" id="${candidateInstance?.agency?.id}">${candidateInstance?.agency?.encodeAsHTML()}</g:link></span>
					
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
	 -- LIST OF ALL PROFILES FOR EACH PRODUCTION			
	</div>

</div>

<!--  End tabs -->