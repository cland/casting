<!-- The tabs -->
<%@ page import="com.cland.casting.SystemRoles" %>
<div id="tabs" style="display: none;">
	<ul>
		<li><a href="#tab-production">Details</a></li>
		<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
			<li><a href="#tab-auditions">Auditions</a></li>
		</sec:ifAnyGranted>
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
				<span class="property-value">${productionInstance?.name}</span>
				
			</div>
			<div class="cell"><label for="status"><g:message code="production.status.label" default="Status" /></label></div>
			<div class="cell">
					<span class="property-value">${productionInstance?.status?.getValue()}</span>
			</div>
		</div>
		<div class="row">
			<div class="cell"><label for="client"><g:message code="production.client.label" default="Production company" /></label></div>
			<div class="cell">
				<span class="property-value">${productionInstance?.client}</span>
			</div>	
			<div class="cell"><label for="startDate"><g:message code="production.startDate.label" default="Start Date" /></label>
			</div>
			<div class="cell">
				<span class="property-value">${productionInstance?.startDate?.format('dd-MMM-yyyy')}</span>	
			</div>
		</div>
		<div class="row">
			<div class="cell"><label for="name"><g:message code="production.producer.label" default="Producer" /></label></div>
			<div class="cell">
				<span class="property-value"> ${productionInstance?.producer}</span>
			</div>
			<div class="cell"><label for="endDate"><g:message code="production.endDate.label" default="End Date" /></label>
			</div>
			<div class="cell">
				<span class="property-value">${productionInstance?.endDate?.format('dd-MMM-yyyy')}	</span>	
			</div>			
		</div>
		<div class="row">
			<div class="cell"><label for="address"><g:message code="production.address.label" default="Casting Address" /></label></div>
			<div class="cell">
				<span class="property-value">${productionInstance?.address}	</span>
			</div>
			<div class="cell"></div>
			<div class="cell"></div>
		</div>
	</div>
</div>
	<div id="role-dates-summary" class="role-userview-section">
		<table>
     		<tr><th>Audition Date(s)</th><th>Callback Date(s)</th><th>Wardrope Date(s)</th><th>Shoot Date(s)</th></tr>
     		<tr>
     			<td class="td-audition-dates">
      				<g:each in="${productionDates?.auditionDates}" var="d">
	           			<span class=""><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
	           		</g:each>
				</td>
     			<td class="td-callback-dates">
      				<g:each in="${productionDates?.callbackDates}" var="d">
	           			<span class=""><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
	           		</g:each>		       					
				</td>
     			<td  class="td-wardrope-dates">  					
     				<g:each in="${productionDates?.wardropeDates}" var="d">
	           			<span class=""><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
	           		</g:each>
           		</td>
     			<td  class="td-shoot-dates">
      				<g:each in="${productionDates?.shootDates}" var="d">
	           			<span class=""><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
	           		</g:each>
     			</td>
     		</tr>
        </table>
	</div>
</fieldset>

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
				<div class="cell"><label for="feeNote"><g:message code="default.feenotes.label" default="Fee Notes" /></label></div>
				<div class="cell">
					${productionInstance?.feeNotes}	
				</div>			
				<div class="cell"><label for="exclusions"><g:message code="production.exclusions.label" default="Exclusions" /></label></div>
				<div class="cell">
					${productionInstance?.exclusions}
				</div>
			</div>			
			<div class="row">

			</div>		
		</div>
	</div>
</fieldset>

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
	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
		<fieldset><legend>Who can access this production</legend>
		<span id="agencyACL-label" class="property-label"><g:message code="production.agencyacl.label" default="Agency access list" /></span>
				<g:if test="${productionInstance?.agencyACL}">								
				<br/>
					<g:each in="${productionInstance.agencyACL}" var="p">
					<span class="property-value" aria-labelledby="agencyACL-label">
						<span class="r-arrow"></span>
						<g:link controller="agency" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link><br/>
					</span>
					</g:each>		
				</g:if>
				<g:else><span class="property-value">All</span></g:else>
		</fieldset>
	</sec:ifAnyGranted>	
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
	
	<div id="tab-portfolios">
		<g:render template="portfoliosTable"/>
	</div>
</div>
<!--  End tabs -->