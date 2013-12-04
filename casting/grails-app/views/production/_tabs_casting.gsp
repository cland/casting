<div id="tab-auditions">
	<g:if test="${auditionProfiles}">		
		<span id="roles-label" class="property-label"><g:message code="production.profiles.label" default="Profiles" /></span>			
		<g:each in="${auditionProfiles}" var="r">
		<span class="property-value" aria-labelledby="profiles-label"><g:link controller="castingProfile" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
		 <g:formatBoolean boolean="${r?.isShortlist}" />
		<br/>
		</g:each>
	</g:if>
	<br/>
	<div>
		<g:render template="../layouts/profile_headshot" collection="${ auditionProfiles}" var="profile"/>
		<div style="clear: both;"></div>
	</div>
	<br/>
</div>
<div id="tab-shortlist">
	<div>
		<div class="cast-list">
			<g:render template="../layouts/profile_summary" collection="${shortlistProfiles }" var="profile"/>
			
		</div>
		<div style="clear: both;"></div>
	</div>
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
	<div>
		<g:render template="../layouts/profile_detailed" collection="${finalProfiles }" var="profile"/>
		<div style="clear: both;"></div>
	</div>
</div>
