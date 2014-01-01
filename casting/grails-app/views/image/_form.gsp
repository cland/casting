<%@ page import="com.cland.casting.Image" %>



<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="image.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${imageInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'caption', 'error')} ">
	<label for="caption">
		<g:message code="image.caption.label" default="Caption" />
		
	</label>
	<g:textField name="caption" value="${imageInstance?.caption}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="image.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${imageInstance?.description}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'locations', 'error')} ">		
<label for="locations">
		<g:message code="image.locations.label" default="Locations" />
		
	</label>
	<g:select name="locations" from="${com.cland.casting.Keywords.findByName('system_areas')?.value?.split("~")?.sort()}" multiple="multiple" noSelection="['': '--None--']" size="5" value="${imageInstance*.locations}" class="many-to-many"/>
</div>

<fieldset><legend>Image</legend>
<input type="file" name="image"/>
<g:if test="${isNew == false  }">
	<div id="headshot" class="attachments">
			<attachments:each bean="${imageInstance}" inputName="image" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:imageInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
	</div><br/>
</g:if>	
</fieldset>