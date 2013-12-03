<div id="tab-auditions">
	<g:if test="${auditionProfiles}">		
		<span id="roles-label" class="property-label"><g:message code="production.profiles.label" default="Profiles" /></span>			
		<g:each in="${auditionProfiles}" var="r">
		<span class="property-value" aria-labelledby="profiles-label"><g:link controller="castingProfile" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
		 <g:formatBoolean boolean="${r?.isShortlist}" />
		<br/>
		</g:each>
	</g:if>
</div>
<div id="tab-shortlist">
	<g:if test="${shortlistProfiles}">		
		<span id="roles-label" class="property-label"><g:message code="production.profiles.label" default="Profiles" /></span>			
		<g:each in="${shortlistProfiles}" var="r">
		<span class="property-value" aria-labelledby="profiles-label"><g:link controller="castingProfile" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
		 <g:formatBoolean boolean="${r?.isShortlist}" />
		<br/>
		</g:each>
	</g:if>
</div>
<div id="tab-finalcast">
	<g:if test="${finalProfiles}">		
		<span id="roles-label" class="property-label"><g:message code="production.profiles.label" default="Profiles" /></span>			
		<g:each in="${finalProfiles}" var="r">
		<span class="property-value" aria-labelledby="profiles-label"><g:link controller="castingProfile" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
		 <g:formatBoolean boolean="${r?.isShortlist}" />
		<br/>
		</g:each>
	</g:if>
</div>
