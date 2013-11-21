<%@ page import="com.cland.casting.Portfolio" %>



<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="portfolio.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${portfolioInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="portfolio.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${portfolioInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'production', 'error')} required">
	<label for="production">
		<g:message code="portfolio.production.label" default="Production" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="production" name="production.id" from="${com.cland.casting.Production.list()}" optionKey="id" required="" value="${portfolioInstance?.production?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'profiles', 'error')} ">
	<label for="profiles">
		<g:message code="portfolio.profiles.label" default="Profiles" />
		
	</label>
	<g:select name="profiles" from="${com.cland.casting.CastingProfile.list()}" multiple="multiple" optionKey="id" size="5" value="${portfolioInstance?.profiles*.id}" class="many-to-many"/>
</div>

