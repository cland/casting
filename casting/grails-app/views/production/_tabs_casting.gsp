<div id="tab-auditions">
	...auditions list - stage 1
	<g:if test="${productionInstance?.profiles}">		
		<span id="roles-label" class="property-label"><g:message code="production.profiles.label" default="Profiles" /></span>			
		<g:each in="${productionInstance.profiles}" var="r">
		<span class="property-value" aria-labelledby="profiles-label"><g:link controller="castingProfile" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
		</g:each>
	</g:if>
</div>
<div id="tab-shortlist">
	...shortlist - stage 3
</div>
<div id="tab-finalcast">
	...final casting - stage 3
</div>
