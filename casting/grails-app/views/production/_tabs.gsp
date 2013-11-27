<!-- The tabs -->
<div id="tabs" style="display: none;">
	<ul>
		<li><a href="#tab-production">Details</a></li>
		<li><a href="#tab-auditions">Auditions</a></li>
		<li><a href="#tab-shortlist">Shortlist</a></li>
		<li><a href="#tab-finalcast">Final Cast</a></li>				
		<li><a href="#tab-resources">Resources</a></li>
		<li><a href="#tab-portfolios">Portfolios</a></li>
	</ul>
<div id="tab-production">
		<ol class="property-list production">
			<g:if test="${productionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="production.name.label" default="Name" /></span>					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productionInstance}" field="name"/></span>					
				</li>
			</g:if>
		<g:if test="${productionInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="production.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${productionInstance}" field="status"/></span>
					
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
			
				
			</ol>	
	<h5>Which agencies can access this production</h5>
	<g:if test="${productionInstance?.agencyACL}">
					<span id="agencyACL-label" class="property-label"><g:message code="production.agencyacl.label" default="Agency access list: " /></span>
					
						<g:each in="${productionInstance.agencyACL}" var="p">
						<span class="property-value" aria-labelledby="agencyACL-label"><g:link controller="agency" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>		
	</g:if>
</div>
<div id="tab-portfolios">
		<g:render template="portfoliosTable"/>
	</div>

	<!-- CASTING TABS -->
	<g:render template="tabs_casting"></g:render>
	
	<div id="tab-resources">
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