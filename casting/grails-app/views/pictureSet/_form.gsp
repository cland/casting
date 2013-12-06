<%@ page import="com.cland.casting.PictureSet" %>
<g:set var="thisName">
<g:if test="${pictureSetInstance?.name}">${pictureSetInstance?.name}</g:if>
<g:else>${castingProfileInstance?.getName() }</g:else>
</g:set>
<g:hiddenField name="name" value="${thisName }"/>
<g:if test="${castingProfileInstance }">
	<g:hiddenField name="castingProfile.id" value="${castingProfileInstance?.id }"/> 
</g:if>
<g:else>	
	<div class="fieldcontain ${hasErrors(bean: pictureSetInstance, field: 'castingProfile', 'error')} required">
		<label for="castingProfile">
			<g:message code="pictureSet.castingProfile.label" default="Profile" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="casting-profile" name="castingProfile.id" from="${com.cland.casting.CastingProfile.list()}" optionKey="id" required="" value="${pictureSetInstance?.castingProfile?.id}" class="many-to-one" noSelection="['': '-- select one --']"/>	
	</div>		
</g:else>

<div class="fieldcontain">
<attachments:progressBar/>
<h3>Pictures</h3>
<input type="file" name="pictures"/>
<input type="file" name="pictures"/>

</div>
