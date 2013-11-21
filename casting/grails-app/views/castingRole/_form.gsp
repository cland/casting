<%@ page import="com.cland.casting.CastingRole" %>



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

<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="castingRole.name.label" default="Name" />
		
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

<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'requiredCount', 'error')} required">
	<label for="requiredCount">
		<g:message code="castingRole.requiredCount.label" default="Required Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="requiredCount" type="number" value="${castingRoleInstance.requiredCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'requiredFemaleCount', 'error')} required">
	<label for="requiredFemaleCount">
		<g:message code="castingRole.requiredFemaleCount.label" default="Required Female Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="requiredFemaleCount" type="number" value="${castingRoleInstance.requiredFemaleCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingRoleInstance, field: 'requiredMaleCount', 'error')} required">
	<label for="requiredMaleCount">
		<g:message code="castingRole.requiredMaleCount.label" default="Required Male Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="requiredMaleCount" type="number" value="${castingRoleInstance.requiredMaleCount}" required=""/>
</div>

