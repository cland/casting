<%@ page import="com.cland.casting.Agency" %>



<div class="fieldcontain ${hasErrors(bean: agencyInstance, field: 'candidates', 'error')} ">
	<label for="candidates">
		<g:message code="agency.candidates.label" default="Candidates" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${agencyInstance?.candidates?}" var="c">
    <li><g:link controller="candidate" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="candidate" action="create" params="['agency.id': agencyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'candidate.label', default: 'Candidate')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: agencyInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="agency.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="company" name="company.id" from="${com.cland.casting.Organisation.list()}" optionKey="id" required="" value="${agencyInstance?.company?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agencyInstance, field: 'contacts', 'error')} ">
	<label for="contacts">
		<g:message code="agency.contacts.label" default="Contacts" />
		
	</label>
	<g:select name="contacts" from="${com.cland.casting.User.list()}" multiple="multiple" optionKey="id" size="5" value="${agencyInstance?.contacts*.id}" class="many-to-many"/>
</div>

