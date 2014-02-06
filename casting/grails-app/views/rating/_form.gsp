<%@ page import="com.cland.casting.Rating" %>

<div class="fieldcontain ${hasErrors(bean: ratingInstance, field: 'profile', 'error')} required">
	<label for="profile">
		<g:message code="rating.profile.label" default="Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profile" name="profile.id" from="${com.cland.casting.CastingProfile.list()}" optionKey="id" required="" value="${ratingInstance?.profile?.id}" class="many-to-one"/>
</div>
<div class="fieldcontain ${hasErrors(bean: ratingInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="rating.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:radioGroup name="rating" value='${ratingInstance?.rating }' values="['1','2','3','4','5','0']" labels="['1','2','3','4','5','none']" class="ratingadmin_radio_group">
		<span class="mugshot_radio">${it.radio } ${it.label } </span>
	</g:radioGroup>
	
</div>

<div class="fieldcontain ${hasErrors(bean: ratingInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="rating.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${ratingInstance?.comments}"/>
</div>



<div class="fieldcontain ${hasErrors(bean: ratingInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="rating.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${ratingInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ratingInstance, field: 'createdDate', 'error')} required">
	<label for="createdDate">
		<g:message code="rating.createdDate.label" default="Created Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdDate" precision="day"  value="${ratingInstance?.createdDate}"  />
</div>

<g:if test="${ratingInstance?.createdDate }">
<g:hiddenField name="createdDate" value="${ratingInstance?.createdDate }"/>
</g:if>

<div class="fieldcontain ${hasErrors(bean: ratingInstance, field: 'editedBy', 'error')} required">
	<label for="editedBy">
		<g:message code="rating.editedBy.label" default="Edited By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="editedBy" type="number" value="${ratingInstance.editedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ratingInstance, field: 'editedDate', 'error')} required">
	<label for="editedDate">
		<g:message code="rating.editedDate.label" default="Edited Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="editedDate" precision="day"  value="${ratingInstance?.editedDate}"  />
</div>



