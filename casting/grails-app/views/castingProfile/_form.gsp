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
		<g:message code="castingProfile.candidate.label" default="Candidate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="canditate" name="canditate.id" from="${candidateList}" optionKey="id" required="" value="${castingProfileInstance?.canditate?.id}" class="many-to-one" noSelection="['': '-- select one --']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'roles', 'error')} required">
	<label for="roles">
		<g:message code="castingProfile.roles.label" default="Casting Role:" />	
		<span class="required-indicator">*</span>	
	</label>
	
	<g:select multiple="false" id="roles" name="roles" from="${productionInstance?.roles}" optionKey="id" required="" value="${castingProfileInstance?.roles?.id}" class="many-to-one" noSelection="['': '-- select one --']"/>
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
	<span class="datepicker-reset" picker="cast-date" altfield="cast-date">clear</span>
	
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
<div class="data-table">
	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
		<div class="row group">
			<div class="cell group"><label>PROGRESS:</label></div>
			<div class="cell"><span class="r-arrow"></span> <label for="isInvited">Invited</label></div>
			<div class="cell">
				<g:checkBox name="isInvited" value="${castingProfileInstance?.isInvited}" />
				<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
			</div>		
			<div class="cell"><label for="isShortlist">Shortlist</label></div>
			<div class="cell">
				<g:checkBox name="isShortlist" value="${castingProfileInstance?.isShortlist}" />
				<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
			</div>	
			<div class="cell"><label for="isConfirmed">Confirmed</label></div>
			<div class="cell">
				<g:checkBox name="isConfirmed" value="${castingProfileInstance?.isConfirmed}" />
				<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
			</div>					
		</div>	
	</sec:ifAnyGranted>
	<div class="row group">
		<div class="cell group"><label>AUDITION:</label></div>			
		<div class="cell"><span class="r-arrow"></span> <label for="isAuditionAvailable">Available</label></div>
		<div class="cell">
			<g:checkBox name="isAuditionAvailable" value="${castingProfileInstance?.isAuditionAvailable}" />
			<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
		</div>
		<div class="cell"><label for="isAuditionAttended">Attended:</label></div>
		<div class="cell">
			<g:checkBox name="isAuditionAttended" value="${castingProfileInstance?.isAuditionAttended}" />
			<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
		</div>
		<div class="cell"><label for="auditionDate">Date:</label></div>
		<div class="cell">
			<g:textField name="auditionDate" class="datepick" id="audition-date" value="${castingProfileInstance?.auditionDate?.format('dd-MMM-yyyy')}"/>
			<span class="datepicker-reset" picker="audition-date" altfield="audition-date">clear</span>
		</div>
	</div>	
	<div class="row group">
		<div class="cell group"><label>CALLBACK:</label></div>	
		<div class="cell"><span class="r-arrow"></span> <label for="isCallbackAvailable">Available</label></div>
		<div class="cell">
			<g:checkBox name="isCallbackAvailable" value="${castingProfileInstance?.isCallbackAvailable}" />
			<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
		</div>
		<div class="cell"><label for="isCallbackAttended">Attended:</label></div>
		<div class="cell">
			<g:checkBox name="isCallbackAttended" value="${castingProfileInstance?.isCallbackAttended}" />
			<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
		</div>
		<div class="cell"><label for="callbackDate">Date:</label></div>
		<div class="cell">
			<g:textField name="callbackDate" class="datepick" id="callback-date" value="${castingProfileInstance?.callbackDate?.format('dd-MMM-yyyy')}"/>
			<span class="datepicker-reset" picker="callback-date" altfield="callback-date">clear</span>
		</div>
	</div>
	<div class="row group">
		<div class="cell group"><label>WARDROBE:</label></div>			
		<div class="cell"><span class="r-arrow"></span> <label for="isWardrobeAvailable">Available</label></div>
		<div class="cell">
			<g:checkBox name="isWardrobeAvailable" value="${castingProfileInstance?.isWardrobeAvailable}" />
			<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
		</div>
		<div class="cell"><label for="isWardrobeAttended">Attended:</label></div>
		<div class="cell">
			<g:checkBox name="isWardrobeAttended" value="${castingProfileInstance?.isWardrobeAttended}" />
			<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
		</div>
		<div class="cell"><label for="wardrobeDate">Date:</label></div>
		<div class="cell">
			<g:textField name="wardrobeDate" class="datepick" id="wardrobe-date" value="${castingProfileInstance?.wardrobeDate?.format('dd-MMM-yyyy')}"/>
			<span class="datepicker-reset" picker="wardrobe-date" altfield="wardrobe-date">clear</span>
		</div>
	</div>	
	<div class="row group">
		<div class="cell group"><label>SHOOT:</label></div>		
		<div class="cell"><span class="r-arrow"></span> <label for="isRoleAvailable">Available</label></div>
		<div class="cell">
			<g:checkBox name="isRoleAvailable" value="${castingProfileInstance?.isRoleAvailable}" />
			<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
		</div>
		<div class="cell"><label for="isRoleAttended">Attended:</label></div>
		<div class="cell">
			<g:checkBox name="isRoleAttended" value="${castingProfileInstance?.isRoleAttended}" />
			<span class="checkbox-text"><g:message code="default.yes.label" default="Yes" /></span>
		</div>
		<div class="cell"><label for="shootDate">Date:</label></div>
		<div class="cell">
			<g:textField name="shootDate" class="datepick" id="shoot-date" value="${castingProfileInstance?.shootDate?.format('dd-MMM-yyyy')}"/>
			<span class="datepicker-reset" picker="shoot-date" altfield="shoot-date">clear</span>
		</div>
	</div>				
</div>

</fieldset>

<fieldset><legend>Ratings and Comments</legend>
<g:render template="ratingsTable"/>
</fieldset>