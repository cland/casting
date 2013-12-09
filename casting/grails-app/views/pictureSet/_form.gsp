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
<fieldset><legend>Headshot</legend>
<input type="file" name="headshot"/>
<g:if test="${isNew == false  }">
	<div id="headshot" class="attachments">
			<attachments:each bean="${pictureSetInstance}" inputName="headshot" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:pictureSetInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
	</div><br/>
</g:if>	
</fieldset>
<br/>
<fieldset><legend>Other Photos</legend>
<input type="file" name="pictures"/>
<input type="file" name="pictures"/>
<g:if test="${isNew == false }">
<br/>
	<div id="attachments" class="attachments">
			<attachments:each bean="${pictureSetInstance}" inputName="pictures" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:pictureSetInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
	</div>
</g:if>	
</fieldset>
</div>
