<%@ page import="com.cland.casting.Document" %>
<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="document.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${documentInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'caption', 'error')} ">
	<label for="content">
		<g:message code="document.content.label" default="Content" />		
	</label>
	<br/>
	
	<ckeditor:editor name="content" height="400px" width="80%" toolbar="custom">
		${documentInstance?.content}
	</ckeditor:editor>
</div>

