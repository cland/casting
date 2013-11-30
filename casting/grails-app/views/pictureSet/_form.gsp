<%@ page import="com.cland.casting.PictureSet" %>

<div class="fieldcontain ${hasErrors(bean: pictureSetInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="pictureSet.name.label" default="Name" />		
	</label>
	<g:textField name="name" value="${pictureSetInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pictureSetInstance, field: 'castingProfile', 'error')} required">
	<label for="castingProfile">
		<g:message code="pictureSet.castingProfile.label" default="Candidate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="casting-profile" name="castingProfile.id" from="${com.cland.casting.castingProfile.list()}" optionKey="id" required="" value="${pictureSetInstance?.castingProfile?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain">
<attachments:progressBar/>
<h3>Pictures</h3>
<input type="file" name="pictures"/>
<input type="file" name="pictures"/>

</div>
