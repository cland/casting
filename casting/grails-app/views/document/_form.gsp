<%@ page import="com.cland.casting.Document" %>



<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="document.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${documentInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="document.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${documentInstance?.description}"/>
</div>

<fieldset><legend>Document</legend>
<input type="file" name="document"/>
<g:if test="${isNew == false  }">
	<div id="headshot" class="attachments">
			<attachments:each bean="${documentInstance}" inputName="document" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:documentInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
	</div><br/>
</g:if>	
</fieldset>