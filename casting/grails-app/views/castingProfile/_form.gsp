<%@ page import="com.cland.casting.CastingProfile" %>
<%@ page import="com.cland.casting.SystemRoles" %>
<g:hiddenField name="averating" value="${fieldValue(bean: castingProfileInstance, field: 'averating')}"/>
<fieldset><legend>Details</legend>
<g:if test="${isEditing} & ${isNew != true } ">
<div class="fieldcontain">
	<g:hiddenField name="production.id" value="${castingProfileInstance?.production?.id}" />
	<label for="production">
		<g:message code="production.name.label" default="Production" />
		<span class="required-indicator">*</span>
	</label>
	<g:link id="production" controller="production" action="show" params="${['id':productionInstance?.id]}">Production: ${productionInstance?.name} (Client: ${productionInstance?.client?.encodeAsHTML()})</g:link>
</div>
</g:if>
<g:if test="${castingProfileInstance?.production == null}">
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'production', 'error')} required">
	<label for="production">
		<g:message code="castingProfile.production.label" default="Production" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="production" name="production.id" from="${com.cland.casting.Production.list()}" optionKey="id" required="" value="${castingProfileInstance?.production?.id}" class="many-to-one"/>
</div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'Candidate', 'error')} required">
	<label for="canditate">
		<g:message code="castingProfile.canditate.label" default="Canditate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="canditate" name="canditate.id" from="${candidateList}" optionKey="id" required="" value="${castingProfileInstance?.canditate?.id}" class="many-to-one" noSelection="['': '-- select one --']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'roles', 'error')} required">
	<label for="roles">
		<g:message code="castingProfile.roles.label" default="Casting Role:" />	
		<span class="required-indicator">*</span>	
	</label>
	
	<g:select id="roles" name="roles" from="${productionInstance?.roles}" optionKey="id" required="" value="${castingProfileInstance?.roles?.id}" class="many-to-one" required="" noSelection="['': '-- select one --']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'categories', 'error')} required">
	<label for="categories">
		<g:message code="castingProfile.categories.label" default="Category" />		
		<span class="required-indicator">*</span>
	</label>
	
	<g:select id="categories" name="categories" from="${productionInstance?.categories}" optionKey="id" required="" value="${castingProfileInstance?.categories?.id}" class="many-to-one" required="" noSelection="['': '-- select one --']"/>
</div>
<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN.value },${SystemRoles.ROLE_DEVELOPER.value }">
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'castDate', 'error')} required">
	<label for="castDate">
		<g:message code="castingProfile.castDate.label" default="Cast Date" />
		
	</label>
	<g:textField name="castDate" class="datepick" id="cast-date" value="${castingProfileInstance?.castDate?.format('dd-MMM-yyyy')}"/>	
	
</div>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'castNo', 'error')} required">
	<label for="castNo">
		<g:message code="castingProfile.castNo.label" default="Cast No" />
		
	</label>
	<g:field name="castNo" type="number" value="${castingProfileInstance.castNo}" />
</div>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'round', 'error')} required">
	<label for="round">
		<g:message code="castingProfile.round.label" default="Round" />
		
	</label>
	<g:field name="round" type="number" value="${castingProfileInstance.round}" />
</div>
</sec:ifAnyGranted>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="castingProfile.comments.label" default="Comments" />		
	</label>
	<g:textArea name="comments" value="${castingProfileInstance?.comments}" rows="5" cols="40"/>
</div>
</fieldset>
<fieldset><legend>Progress Indicators</legend>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'isInvited', 'error')} ">
	<label for="isInvited">
		<g:message code="castingProfile.isInvited.label" default="Is Invited" />		
	</label>
	<g:checkBox name="isInvited" value="${castingProfileInstance?.isInvited}" />
	<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
</div>

<!-- START AUDITION AVAILABILITY AND DATES -->
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'isAuditionAvailable', 'error')} ">
	<label for="isAuditionAvailable">
		<g:message code="castingProfile.isAuditionAvailable.label" default="Is Audition Available" />		
	</label>
	<g:checkBox name="isAuditionAvailable" value="${castingProfileInstance?.isAuditionAvailable}" />
	<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'auditionDate', 'error')} ">
	<label for="auditionDate">
		<g:message code="castingProfile.auditionDate.label" default="Audition date" />		
	</label>
	<g:textField name="auditionDate" class="datepick" id="audition-date" value="${castingProfileInstance?.auditionDate}"/>	
</div>
<!-- END AUDITION AVAILABILITY AND DATES -->
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'isCallbackAvailable', 'error')} ">
	<label for="isCallbackAvailable">
		<g:message code="castingProfile.isCallbackAvailable.label" default="Is Callback Available" />		
	</label>
	<g:checkBox name="isCallbackAvailable" value="${castingProfileInstance?.isCallbackAvailable}" />
<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
</div>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'callbackDate', 'error')} ">
	<label for="callbackDate">
		<g:message code="castingProfile.callbackDate.label" default="Callback date" />		
	</label>
	<g:textField name="callbackDate" class="datepick" id="callback-date" value="${castingProfileInstance?.callbackDate}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'isShortlist', 'error')} ">
	<label for="isShortlist">
		<g:message code="castingProfile.isShortlist.label" default="Is Shortlist" />		
	</label>
	<g:checkBox name="isShortlist" value="${castingProfileInstance?.isShortlist}" />
<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'isRoleAvailable', 'error')} ">
	<label for="isRoleAvailable">
		<g:message code="castingProfile.isRoleAvailable.label" default="Is Role Available" />		
	</label>
	<g:checkBox name="isRoleAvailable" value="${castingProfileInstance?.isRoleAvailable}" /> 
	<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
</div>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'outcome', 'error')} ">
	<label for="outcome">
		<g:message code="castingProfile.outcome.label" default="Outcome" />		
	</label>
	<g:select name="outcome" from="${castingProfileInstance.constraints.outcome.inList}" value="${castingProfileInstance?.outcome}" valueMessagePrefix="castingProfile.outcome" noSelection="['': '']"/>
</div>
</fieldset>

<fieldset><legend>Ratings and Comments</legend>
<g:render template="ratingsTable"/>
</fieldset>