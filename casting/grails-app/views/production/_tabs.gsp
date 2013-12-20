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
<div id="tab-production" class="tab">

<fieldset><legend>Casting Brief</legend>
<div class="production-brief">
	<div class="production-data-table">
		<div class="row">
			<div class="cell"><label for="name"><g:message code="production.name.label" default="Job" /></label></div>
			<div class="cell">
				${productionInstance?.name}
				
			</div>
			<div class="cell"><label for="status"><g:message code="production.status.label" default="Status" /><span class="required-indicator">*</span></label></div>
			<div class="cell">
					${productionInstance?.status?.name()}
			</div>
		</div>
		<div class="row">
			<div class="cell"><label for="client"><g:message code="production.client.label" default="Production company" /><span class="required-indicator">*</span></label></div>
			<div class="cell">
				${productionInstance?.client}
			</div>	
			<div class="cell">Casting dates</div>
			<div class="cell"></div>
		</div>
		<div class="row">
			<div class="cell"><label for="name"><g:message code="production.producer.label" default="Producer" /></label></div>
			<div class="cell">
				${productionInstance?.producer}
			</div>
			<div class="cell"><label for="shootDate"><g:message code="production.shootDate.label" default="Shoot Date/s" />	<span class="required-indicator">*</span></label>
			</div>
			<div class="cell">
				${productionInstance?.shootDate?.format('dd-MMM-yyyy')}		
			</div>			
		</div>
		<div class="row">
			<div class="cell"><label for="address"><g:message code="production.address.label" default="Address" /></label></div>
			<div class="cell">
				${productionInstance?.address}		
			</div>
			<div class="cell">Callback wardrobe</div>
			<div class="cell"></div>
		</div>
	</div>
</div>
</fieldset>
<br/>
<fieldset><legend>Usage - Package Deal</legend>
	<div class="production-usage">
		<div class="production-data-table">
			<div class="row">
				<div class="cell"><label for="prodUsage"><g:message code="production.produsage.label" default="Usage" /></label></div>
				<div class="cell">
					${productionInstance?.prodUsage}			
				</div>
				<div class="cell"><label for="medium"><g:message code="production.medium.label" default="Medium" /></label></div>
				<div class="cell">
					${productionInstance?.medium}
				</div>
			</div>
			<div class="row">
				<div class="cell"><label for="territories"><g:message code="production.territories.label" default="Territories" /></label></div>
				<div class="cell">
					${productionInstance?.territories}			
				</div>
				<div class="cell"><label for="period"><g:message code="production.period.label" default="Period" /></label></div>
				<div class="cell">
					${productionInstance?.period}
				</div>
			</div>
			<div class="row">
				<div class="cell"><label for="exclusions"><g:message code="production.exclusions.label" default="Exclusions" /></label></div>
				<div class="cell">
					${productionInstance?.exclusions}
				</div>
				<div class="cell"></div>
				<div class="cell">
					
				</div>
			</div>			
			<div class="row">
				<div class="cell"><label for="feeNote"><g:message code="default.feenotes.label" default="Fee Notes" /></label></div>
				<div class="cell">
					${productionInstance?.feeNotes}	
				</div>
			</div>		
		</div>
	</div>
</fieldset>
<br/>
<br/>
<fieldset><legend>Roles and Categories</legend>
<g:render template="rolesTable"/>
<br/>
<g:render template="categoriesTable"/>
</fieldset>
<br/>
<fieldset><legend>Notes and Other Information</legend>
	<div class="production-comments">
		<div class="production-data-table">
			<div class="row">
				<div class="cell"><label for="description"><g:message code="production.description.label" default="General comments" /></label></div>
				<div class="cell">
					${productionInstance?.description}			
				</div>
			</div>
		</div>
	</div>
</fieldset>
<br/>
<fieldset><legend>Who can access this production</legend>
<span id="agencyACL-label" class="property-label"><g:message code="production.agencyacl.label" default="Agency access list" /></span>
		<g:if test="${productionInstance?.agencyACL}">								
			<g:each in="${productionInstance.agencyACL}" var="p">
			<span class="property-value" aria-labelledby="agencyACL-label"><g:link controller="agency" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
			</g:each>		
		</g:if>
		<g:else><span class="property-value">All</span></g:else>
</fieldset>
		
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