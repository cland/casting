<%@ page import="com.cland.casting.CastingRole" %>

<fieldset><legend>Details</legend>
<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="castingRole.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${castingRoleInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'production', 'error')} required">
	<label for="production">
		<g:message code="castingRole.production.label" default="Production" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="production" name="production.id" from="${com.cland.casting.Production.list()}" optionKey="id" required="" value="${castingRoleInstance?.production?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'dayfee', 'error')} required">
	<label for="requiredMaleCount">
		<g:message code="castingRole.dayfee.label" default="Day fee" />
	</label>
	<g:field name="dayfee" type="number" value="${castingRoleInstance.dayfee}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'feeNotes', 'error')} ">			
	<label for="feeNotes">
		<g:message code="castingRole.feeNotes.label" default="Fee notes" />
	</label>					
	<g:textArea name="feeNotes" value="${castingRoleInstance?.feeNotes}" rows="3" cols="40"/>
</div>
<div class="field-calendar-container">
<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'auditionDates', 'error')} float-left field-calendar-picker-container">	
	<label for="auditionDates">
		<g:message code="castingRole.auditionDates.label" default="Audition date(s)" /> 
		[<span class="datepicker-reset" picker="audition-datepicker" altfield="audition-date">clear</span>]
	</label>
	<div id="audition-datepicker"></div>
	<g:textField name="auditionDates" readonly class="display-date-field" id="audition-date" value="${castingRoleInstance?.auditionDates*.format('yyyy-M-d')?.join(",")}"/>	
	
</div>
<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'callbackDates', 'error')} float-right field-calendar-picker-container">	
	<label for="callbackDates">
		<g:message code="castingRole.callbackDates.label" default="Callback date(s)" />
		[<span class="datepicker-reset" picker="callback-datepicker" altfield="callback-date">clear</span>]
	</label>
	<div id="callback-datepicker"></div>
	<g:textField name="callbackDates" readonly class="display-date-field" id="callback-date" value="${castingRoleInstance?.callbackDates*.format('yyyy-M-d')?.join(",")}"/>	
</div>
<div class="clear-both"></div>
</div>

<div class="field-calendar-container">
<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'wardrobeDates', 'error')} float-right field-calendar-picker-container">	
	<label for="wardrobeDates">
		<g:message code="castingRole.wardrobeDates.label" default="Wardrobe date(s)" />
		[<span class="datepicker-reset" picker="wardrobe-datepicker" altfield="wardrobe-date">clear</span>]
	</label>
	<div id="wardrobe-datepicker"></div>
	<g:textField name="wardrobeDates" readonly class="display-date-field" id="wardrobe-date" value="${castingRoleInstance?.wardrobeDates*.format('yyyy-M-d')?.join(",")}"/>	
</div>

<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'shootDates', 'error')} float-left field-calendar-picker-container">	
	<label for="shootDates">
		<g:message code="castingRole.shootDates.label" default="Shoot date(s)" />
		[<span class="datepicker-reset" picker="shoot-datepicker" altfield="shoot-date">clear</span>]
	</label>
	<div id="shoot-datepicker"></div>
	
	<g:textField name="shootDates" readonly class="display-date-field" id="shoot-date" value="${castingRoleInstance?.shootDates*.format('yyyy-M-d')?.join(",")}"/>	
</div>
<div class="clear-both"></div>
</div>
</fieldset>
<br/>
<fieldset><legend>Numbers Required</legend>
<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'requiredCount', 'error')} required">
	<label for="requiredCount">
		<g:message code="castingRole.requiredCount.label" default="Required Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="requiredCount" type="number" value="${castingRoleInstance.requiredCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'maxRequiredAuditionCount', 'error')} required">
	<label for="maxRequiredAuditionCount">
		<g:message code="castingRole.maxRequiredAuditionCount.label" default="Max Required Audition Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxRequiredAuditionCount" type="number" value="${castingRoleInstance.maxRequiredAuditionCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'minRequiredAuditionCount', 'error')} required">
	<label for="minRequiredAuditionCount">
		<g:message code="castingRole.minRequiredAuditionCount.label" default="Min Required Audition Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minRequiredAuditionCount" type="number" value="${castingRoleInstance.minRequiredAuditionCount}" required=""/>
</div>
</fieldset>
<br/>

<fieldset><legend>Who can access this casting role</legend>

	<div class="role-access-control">
		<div class="role-data-table">
			<div class="row">
				<div class="cell"><label for="allowedCategories"><g:message code="role.allowedcategories.label" default="Allowed Categories" /></label>
				<br/><span style="color:red;font-size:0.6em;">** None selected means ALL categories can access</span></div>
					<div class="cell">
					<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'allowedCategories', 'error')} ">		
						<g:select name="allowedCategories" from="${com.cland.casting.Category.list()}" multiple="multiple" optionKey="id" size="5" value="${castingRoleInstance?.allowedCategories*.id}" class="many-to-many"/>
					</div>
				</div>		
			</div>
			<div class="row">
				<div class="cell"><label for="agencyACL"><g:message code="role.agencyacl.label" default="Any other sprecial agencies (optional)" /></label>
					<br/><span style="color:red;font-size:0.6em;">** This to allow special agencies that might not fit the above selected categories.</span>
				</div>
				<div class="cell">
					<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'agencyACL', 'error')} ">		
						<g:select name="agencyACL" from="${com.cland.casting.Agency.list()}" multiple="multiple" optionKey="id" size="5" optionValue="agencyAndCategories" value="${castingRoleInstance?.agencyACL*.id}" noSelection="['': '--No Selection--']" class="many-to-many"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</fieldset>
