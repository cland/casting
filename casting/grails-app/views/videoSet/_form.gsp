<%@ page import="com.cland.casting.VideoSet" %>

<div class="fieldcontain ${hasErrors(bean: videoSetInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="videoSet.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${videoSetInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: videoSetInstance, field: 'castingProfile', 'error')} required">
	<label for="castingProfile">
		<g:message code="videoSet.castingProfile.label" default="Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="casting-profile" name="castingProfile.id" from="${com.cland.casting.castingProfile.list()}" optionKey="id" required="" value="${videoSetInstance?.castingProfile?.id}" class="many-to-one"/>
</div>


<div class="fieldcontain">

<h3>Videos</h3>
<input type="file" name="movies"/>
<input type="file" name="movies"/>

</div>
