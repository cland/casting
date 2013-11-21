<%@ page import="com.cland.casting.Production" %>

<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="production.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${productionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="production.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${productionInstance?.description}" rows="5" cols="40"/>
</div>
<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'client', 'error')} required">
	<label for="client">
		<g:message code="production.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${com.cland.casting.Client.list()}" optionKey="id" required="" value="${productionInstance?.client?.id}" class="many-to-one"/>
</div>

<div
	class="fieldcontain ${hasErrors(bean: productionInstance, field: 'profiles', 'error')} ">
	<label for="profiles"> <g:message
			code="production.profiles.label" default="Profiles" />
	</label>
	<ul class="one-to-many">
		<g:each in="${productionInstance?.profiles?}" var="p">
			<li><g:link controller="castingProfile" action="show"
					id="${p.id}">
					${p?.encodeAsHTML()}
				</g:link></li>
		</g:each>
		<li class="add">
			<g:link controller="castingProfile"
				action="create" params="['production.id': productionInstance?.id]">
				${message(code: 'default.add.label', args: [message(code: 'castingProfile.label', default: 'Profiles')])}
			</g:link>
		</li>
	</ul>
</div>

<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'categories', 'error')} ">
	<label for="categories">
		<g:message code="production.categories.label" default="Categories" />
		
	</label>
	<ul class="one-to-many">
<g:each in="${productionInstance?.categories?}" var="p">
    <li><g:link controller="castingCategory" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="castingCategory" action="create" params="['production.id': productionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'castingCategory.label', default: 'Categories')])}</g:link>
</li>
</ul>
</div>





<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'portfolios', 'error')} ">
	<label for="portfolios">
		<g:message code="production.portfolios.label" default="Portfolios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productionInstance?.portfolios?}" var="p">
    <li><g:link controller="portfolio" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="portfolio" action="create" params="['production.id': productionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'portfolio.label', default: 'Portfolio')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'roles', 'error')} ">
	<label for="roles">
		<g:message code="production.roles.label" default="Roles" />
		
	</label>
	<ul class="one-to-many">
<g:each in="${productionInstance?.roles?}" var="p">
    <li><g:link controller="castingRole" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="castingRole" action="create" params="['production.id': productionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'castingRole.label', default: 'Roles')])}</g:link>
</li>
</ul>
</div>

