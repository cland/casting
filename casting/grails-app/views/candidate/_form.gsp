<%@ page import="com.cland.casting.Candidate" %>



<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'agency', 'error')} required">
	<label for="agency">
		<g:message code="candidate.agency.label" default="Agency" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="agency" name="agency.id" from="${com.cland.casting.Agency.list()}" optionKey="id" required="" value="${candidateInstance?.agency?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'clothing', 'error')} ">
	<label for="clothing">
		<g:message code="candidate.clothing.label" default="Clothing" />
		
	</label>
	<g:textField name="clothing" value="${candidateInstance?.clothing}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'eyes', 'error')} ">
	<label for="eyes">
		<g:message code="candidate.eyes.label" default="Eyes" />
		
	</label>
	<g:textField name="eyes" value="${candidateInstance?.eyes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'hair', 'error')} ">
	<label for="hair">
		<g:message code="candidate.hair.label" default="Hair" />
		
	</label>
	<g:textField name="hair" value="${candidateInstance?.hair}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'height', 'error')} ">
	<label for="height">
		<g:message code="candidate.height.label" default="Height" />
		
	</label>
	<g:textField name="height" value="${candidateInstance?.height}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="candidate.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${com.cland.casting.User.list()}" optionKey="id" required="" value="${candidateInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'pictures', 'error')} ">
	<label for="pictures">
		<g:message code="candidate.pictures.label" default="Pictures" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${candidateInstance?.pictures?}" var="p">
    <li><g:link controller="pictureSet" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pictureSet" action="create" params="['candidate.id': candidateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pictureSet.label', default: 'PictureSet')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'shoe', 'error')} ">
	<label for="shoe">
		<g:message code="candidate.shoe.label" default="Shoe" />
		
	</label>
	<g:textField name="shoe" value="${candidateInstance?.shoe}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'videos', 'error')} ">
	<label for="videos">
		<g:message code="candidate.videos.label" default="Videos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${candidateInstance?.videos?}" var="v">
    <li><g:link controller="videoSet" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="videoSet" action="create" params="['candidate.id': candidateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'videoSet.label', default: 'VideoSet')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'waist', 'error')} ">
	<label for="waist">
		<g:message code="candidate.waist.label" default="Waist" />
		
	</label>
	<g:textField name="waist" value="${candidateInstance?.waist}"/>
</div>

