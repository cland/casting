<%@ page import="com.cland.casting.Keywords" %>



<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="keywords.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${keywordsInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="keywords.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${keywordsInstance?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="keywords.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${keywordsInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="keywords.value.label" default="Values" />
		<span class="required-indicator">* Separate multiple values with ~ character</span>
	</label>
	<g:textField name="value" required="" value="${keywordsInstance?.value}"/>
</div>



