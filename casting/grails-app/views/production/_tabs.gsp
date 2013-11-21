<!-- The tabs -->
<div id="tabs" style="display: none;">
	<ul>
		<li><a href="#tab-production">Details</a></li>
		<li><a href="#tab-portfolios">Portfolios</a></li>
		<li id='tab_learner_head'><a href="#tab-learner">Other</a></li>
		<li><a href="#tab-attachments">Supporting Documents</a></li>
	</ul>
	<div id="tab-production">
			<ol class="property-list production">
			<g:if test="${productionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="production.name.label" default="Name" /></span>					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productionInstance}" field="name"/></span>					
				</li>
			</g:if>
			<g:if test="${productionInstance?.description}">
				<p>${productionInstance?.description}</p>
			</g:if>			
			<g:if test="${productionInstance?.categories}">
				<li class="fieldcontain">
					<span id="categories-label" class="property-label"><g:message code="production.categories.label" default="Categories" /></span>					
						<g:each in="${productionInstance.categories}" var="c">
						<span class="property-value" aria-labelledby="categories-label"><g:link controller="castingCategory" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>				
				</li>
				</g:if>			
			
			<g:if test="${productionInstance?.roles}">
				<li class="fieldcontain">
					<span id="roles-label" class="property-label"><g:message code="production.roles.label" default="Roles" /></span>
					
						<g:each in="${productionInstance.roles}" var="r">
						<span class="property-value" aria-labelledby="roles-label"><g:link controller="castingRole" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productionInstance?.profiles}">
				<li class="fieldcontain">
					<span id="roles-label" class="property-label"><g:message code="production.profiles.label" default="Profiles" /></span>
					
						<g:each in="${productionInstance.profiles}" var="r">
						<span class="property-value" aria-labelledby="profiles-label"><g:link controller="castingProfile" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			</ol>	
	</div>
	<div id="tab-portfolios">
						<g:if test="${productionInstance?.portfolios}">
				<li class="fieldcontain">
					<span id="portfolios-label" class="property-label"><g:message code="production.portfolios.label" default="Portfolios" /></span>
					
						<g:each in="${productionInstance.portfolios}" var="p">
						<span class="property-value" aria-labelledby="portfolios-label"><g:link controller="portfolio" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
	</div>
	<div id="tab-learner">
		
	</div>
	<div id="tab-attachments">
		<div id="attachments" class="attachments">
			<attachments:each bean="${productionInstance}">
				<attachments:icon attachment="${attachment}" />
				<attachments:deleteLink attachment="${attachment}" label="${'[X]'}"
					returnPageURI="${createLink(action: 'show', id: productionInstance.id,absolute:true)}" />
				<attachments:downloadLink attachment="${attachment}" />
				${attachment.niceLength}
			</attachments:each>
		</div>
	</div>
</div>
<!--  End tabs -->