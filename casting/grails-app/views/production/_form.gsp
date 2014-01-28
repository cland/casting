<%@ page import="com.cland.casting.Production" %>
<fieldset><legend>Casting Brief</legend>
<div class="production-brief">
	<div class="production-data-table">
		<div class="row">
			<div class="cell"><label for="name"><g:message code="production.name.label" default="Job" /><span class="required-indicator">*</span></label></div>
			<div class="cell">
				<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'name', 'error')} ">
					<g:textField name="name" value="${productionInstance?.name}" required=""/>
				</div>
			</div>
			<div class="cell"><label for="status"><g:message code="production.status.label" default="Status" /><span class="required-indicator">*</span></label></div>
			<div class="cell">
				<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'status', 'error')} required">	
					<g:select name="status" from="${com.cland.casting.ProductionStatus?.values()}" keys="${com.cland.casting.ProductionStatus.values()*.name()}" required="" value="${productionInstance?.status?.name()}"/>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="cell"><label for="client"><g:message code="production.client.label" default="Production company" /><span class="required-indicator">*</span></label></div>
			<div class="cell">
				<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'client', 'error')} required">
					<g:select id="client" name="client.id" from="${com.cland.casting.Client.list()}" optionKey="id" required="" value="${productionInstance?.client?.id}" class="many-to-one"/></div>
				</div>	
			<div class="cell"><label for="startDate"><g:message code="production.startDate.label" default="Start Date" /><span class="required-indicator">*</span></label></div>
			<div class="cell">
				<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'startDate', 'error')} required">	
					<g:textField name="startDate" class="datepick_single_future" id="start-date" value="${productionInstance?.startDate?.format('dd-MMM-yyyy')}" required=""/>	
				</div>
			</div>
		</div>
		<div class="row">
			<div class="cell"><label for="producer"><g:message code="production.producer.label" default="Producer" /></label></div>
			<div class="cell">
				<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'producer', 'error')} ">
					<g:textField name="producer" value="${productionInstance?.producer}"/>
				</div>			
			</div>
			<div class="cell">
				<label for="endDate"><g:message code="production.endDate.label" default="End Date" /><span class="required-indicator">*</span></label>
	
			</div>
			<div class="cell">
				<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'endDate', 'error')} required">	
					<g:textField name="endDate" class="datepick_single_future" id="end-date" value="${productionInstance?.endDate?.format('dd-MMM-yyyy')}" required=""/>	
				</div>			
			</div>			
		</div>
		<div class="row">
			<div class="cell"><label for="address"><g:message code="production.address.label" default="Address" /></label></div>
			<div class="cell">
				<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'address', 'error')} ">			
					<g:textArea name="address" value="${productionInstance?.address}" rows="3" cols="40"/>
				</div>			
			</div>
			<div class="cell"></div>
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
					<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'prodUsage', 'error')} ">			
						<g:textArea name="prodUsage" value="${productionInstance?.prodUsage}" rows="3" cols="40"/>
					</div>			
				</div>
				<div class="cell"><label for="medium"><g:message code="production.medium.label" default="Medium" /></label></div>
				<div class="cell">
					<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'medium', 'error')} ">
						<g:textField name="medium" value="${productionInstance?.medium}"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="cell"><label for="territories"><g:message code="production.territories.label" default="Territories" /></label></div>
				<div class="cell">
					<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'territories', 'error')} ">			
						<g:textField name="territories" value="${productionInstance?.territories}" />
					</div>			
				</div>
				<div class="cell"><label for="period"><g:message code="production.period.label" default="Period" /></label></div>
				<div class="cell">
					<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'period', 'error')} ">
						<g:textField name="period" value="${productionInstance?.period}"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="cell"><label for="feeNote"><g:message code="default.feenotes.label" default="Fee Notes" /></label></div>
				<div class="cell">
					<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'feeNotes', 'error')} ">			
						<g:textArea name="feeNotes" value="${productionInstance?.feeNotes}" rows="3" cols="40"/>
					</div>			
				</div>			
				<div class="cell"><label for="exclusions"><g:message code="production.exclusions.label" default="Exclusions" /></label></div>
				<div class="cell">
					<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'exclusions', 'error')} ">			
						<g:textField name="exclusions" value="${productionInstance?.exclusions}" />
					</div>			
				</div>
			</div>			
	
		</div>
	</div>
</fieldset>
<br/>
<g:if test="${!isNew}">
	<fieldset><legend>Roles and Categories</legend>
		<g:render template="rolesTable"/>
		<br/>
		<g:render template="categoriesTable"/>
	</fieldset>
</g:if>
<fieldset><legend>Notes and Other Information</legend>
	<div class="production-comments">
		<div class="production-data-table">
			<div class="row">
				<div class="cell"><label for="description"><g:message code="production.description.label" default="General comments" /></label></div>
				<div class="cell">
					<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'description', 'error')} ">			
						<g:textArea name="description" value="${productionInstance?.description}" rows="5" cols="40"/>
					</div>			
				</div>
			</div>
		</div>
	</div>
</fieldset>
<g:if test="${!isNew}">
	<br/>
	<fieldset><legend>Portfolios</legend>
		<g:render template="portfoliosTable"/>
	</fieldset>
</g:if>
<br/>
<fieldset class="hide"><legend>Notifications</legend>
Send notification? 
	<g:radioGroup name="notify" values="['true','false']" value="no" labels="['yes','no']" >
		<span>${it.radio } ${it.label } </span>
	</g:radioGroup>
</fieldset>
<br/>

<fieldset><legend>Who can access this production</legend>
<div class="message">** None selected means ALL can access</div>
	<div class="prodcution-access-control">
		<div class="production-data-table">
			<div class="cell"><label for="agencyACL"><g:message code="production.agencyacl.label" default="Agency Access List" /></label></div>
			<div class="cell">
				<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'agencyACL', 'error')} ">		
					<g:select name="agencyACL" from="${com.cland.casting.Agency.list()}" multiple="multiple" noSelection="['': '--No Selection--']" optionValue="agencyAndCategories" optionKey="id" size="5" value="${productionInstance?.agencyACL*.id}" class="many-to-many"/>
				</div>
			</div>
		</div>
	</div>
</fieldset>






