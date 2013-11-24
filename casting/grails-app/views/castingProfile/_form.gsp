<%@ page import="com.cland.casting.CastingProfile" %>
<g:hiddenField name="averating" value="${fieldValue(bean: castingProfileInstance, field: 'averating')}"/>
<g:if test="${productionInstance != null}">
<g:hiddenField name="production.id" value="${productionInstance?.id}" />
</g:if>
<g:if test="${productionInstance == null}">
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'production', 'error')} required">
	<label for="production">
		<g:message code="castingProfile.production.label" default="Production" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="production" name="production.id" from="${com.cland.casting.Production.list()}" optionKey="id" required="" value="${castingProfileInstance?.production?.id}" class="many-to-one"/>
</div>
</g:if>
<fieldset><legend>Details</legend>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'Candidate', 'error')} required">
	<label for="canditate">
		<g:message code="castingProfile.canditate.label" default="Canditate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="canditate" name="canditate.id" from="${com.cland.casting.Candidate.list()}" optionKey="id" required="" value="${castingProfileInstance?.canditate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'categories', 'error')} ">
	<label for="categories">
		<g:message code="castingProfile.categories.label" default="Categories" />		
	</label>
	<g:select name="categories" from="${com.cland.casting.CastingCategory.list()}" multiple="multiple" optionKey="id" size="5" value="${castingProfileInstance?.categories*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'roles', 'error')} ">
	<label for="roles">
		<g:message code="castingProfile.roles.label" default="Roles" />		
	</label>
	<g:select name="roles" from="${com.cland.casting.CastingRole.list()}" multiple="multiple" optionKey="id" size="5" value="${castingProfileInstance?.roles*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="castingProfile.comments.label" default="Comments" />		
	</label>
	<g:textField name="comments" value="${castingProfileInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'castDate', 'error')} required">
	<label for="castDate">
		<g:message code="castingProfile.castDate.label" default="Cast Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="castDate" precision="day"  value="${castingProfileInstance?.castDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'castNo', 'error')} required">
	<label for="castNo">
		<g:message code="castingProfile.castNo.label" default="Cast No" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="castNo" type="number" value="${castingProfileInstance.castNo}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'round', 'error')} required">
	<label for="round">
		<g:message code="castingProfile.round.label" default="Round" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="round" type="number" value="${castingProfileInstance.round}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'pictures', 'error')} required">
	<label for="pictures">
		<g:message code="castingProfile.pictures.label" default="Pictures" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pictures" name="pictures.id" from="${com.cland.casting.PictureSet.list()}" optionKey="id" required="" value="${castingProfileInstance?.pictures?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'videos', 'error')} required">
	<label for="videos">
		<g:message code="castingProfile.videos.label" default="Videos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="videos" name="videos.id" from="${com.cland.casting.VideoSet.list()}" optionKey="id" required="" value="${castingProfileInstance?.videos?.id}" class="many-to-one"/>
</div>
</fieldset>
<fieldset><legend>Progress Indicators</legend>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'isInvited', 'error')} ">
	<label for="isInvited">
		<g:message code="castingProfile.isInvited.label" default="Is Invited" />		
	</label>
	<g:checkBox name="isInvited" value="${castingProfileInstance?.isInvited}" />
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'isAuditionAvailable', 'error')} ">
	<label for="isAuditionAvailable">
		<g:message code="castingProfile.isAuditionAvailable.label" default="Is Audition Available" />
		
	</label>
	<g:checkBox name="isAuditionAvailable" value="${castingProfileInstance?.isAuditionAvailable}" />
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'isShortlist', 'error')} ">
	<label for="isShortlist">
		<g:message code="castingProfile.isShortlist.label" default="Is Shortlist" />
		
	</label>
	<g:checkBox name="isShortlist" value="${castingProfileInstance?.isShortlist}" />
</div>

<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'isRoleAvailable', 'error')} ">
	<label for="isRoleAvailable">
		<g:message code="castingProfile.isRoleAvailable.label" default="Is Role Available" />
		
	</label>
	<g:checkBox name="isRoleAvailable" value="${castingProfileInstance?.isRoleAvailable}" />
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