<%@ page import="com.cland.casting.Candidate" %>

<g:if test="${agencyInstance != null}">
<g:set var="personList" value="${agencyInstance?.candidates*.person }"/>
<g:hiddenField name="agency.id" value="${agencyInstance?.id}" />
</g:if>
<g:if test="${agencyInstance == null}">
<g:set var="personList" value="${com.cland.casting.User.list().sort() }"/>
<fieldset><legend>Agency Details</legend>
<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'agency', 'error')} required">
	<label for="agency">
		<g:message code="candidate.agency.label" default="Agency" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="agency" name="agency.id" from="${com.cland.casting.Agency.list()?.sort()}" optionKey="id" required="" value="${candidateInstance?.agency?.id}" class="many-to-one" noSelection="['': '--Select Agency--']"/>
</div>
</fieldset>
</g:if>
<fieldset><legend>Person Details</legend>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="candidate.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" onChange="onChangePerson();" name="person.id" from="${personList?.sort()}" optionKey="id"  value="${candidateInstance?.person?.id}" class="many-to-one"  noSelection="['': '--New Person/Select One--']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'person.firstName', 'error')} required">
	<label for="person.firstName">
		<g:message code="user.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="person.firstName" required="" value="${candidateInstance?.person?.firstName}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'person.lastName', 'error')} required">
	<label for="person.lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="person.lastName" required="" value="${candidateInstance?.person?.lastName}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'person.gender', 'error')} required">
	<label for="person.gender">
		<g:message code="user.gender.label" default="Gender" />
		
	</label>
	<g:select name="person.gender" required="" from="${com.cland.casting.User.constraints.gender.inList}" value="${candidateInstance?.person?.gender}" valueMessagePrefix="person.gender" noSelection="['': '']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'person.race', 'error')} required">
	<label for="person.race">
		<g:message code="user.race.label" default="Race" />
		
	</label>
	<g:select name="person.race.id" required="" from="${com.cland.casting.Race.list()}" optionKey="id" value="${candidateInstance?.person?.race?.id}"  noSelection="['': '']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'person.contactNo', 'error')} required">
	<label for="person.contactNo">
		<g:message code="user.contactNo.label" default="Contact No" />
		
	</label>
	<g:textField name="person.contactNo" required="" value="${candidateInstance?.person?.contactNo}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'person.email', 'error')} required">
	<label for="person.email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:field type="email" required="" name="person.email" value="${candidateInstance?.person?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'person.dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="user.dateOfBirth.label" default="Date of Birth" />
	
	</label>
	<g:textField name="person.dateOfBirth" required="" class="datepick_single_past" id="birth-date" value="${candidateInstance?.person?.dateOfBirth?.format('dd-MMM-yyyy')}"/>
	<span class="datepicker-reset" picker="birth-date" altfield="birth-date">clear</span>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'keywords', 'error')} ">
	<label for="keywords">
		<g:message code="candidate.keywords.label" default="Keywords" />
		
	</label>
	<g:textArea name="keywords" value="${candidateInstance?.keywords}" rows="3" cols="40" class="textarea"/>
</div>
<div class="fieldcontain">
<fieldset><legend>Headshot (Only 1 required)</legend>
<input type="file" name="headshot"/>
<g:if test="${isNew == false }">
<br/>
	<div id="attachments" class="attachments">
			<attachments:each bean="${candidateInstance}" inputName="headshot" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:candidateInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
	</div>
</g:if>	
</fieldset>
</div>
</fieldset>

<br/>
<fieldset><legend>Characteristics</legend>	
<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'clothing', 'error')} required">
	<label for="clothing">
		<g:message code="candidate.clothing.label" default="Clothing" />
		
	</label>
	<g:textField name="clothing" required="" value="${candidateInstance?.clothing}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'eyes', 'error')} required">
	<label for="eyes">
		<g:message code="candidate.eyes.label" default="Eyes" />
		
	</label>
	<g:textField name="eyes" required="" value="${candidateInstance?.eyes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'hair', 'error')} required">
	<label for="hair">
		<g:message code="candidate.hair.label" default="Hair" />
		
	</label>
	<g:textField name="hair" required="" value="${candidateInstance?.hair}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'height', 'error')} required">
	<label for="height">
		<g:message code="candidate.height.label" default="Height" />
		
	</label>
	<g:textField name="height" required="" value="${candidateInstance?.height}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'shoe', 'error')} required">
	<label for="shoe">
		<g:message code="candidate.shoe.label" default="Shoe" />
		
	</label>
	<g:textField name="shoe" required="" value="${candidateInstance?.shoe}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: candidateInstance, field: 'waist', 'error')} required">
	<label for="waist">
		<g:message code="candidate.waist.label" default="Waist" />
		
	</label>
	<g:textField name="waist" required="" value="${candidateInstance?.waist}"/>
</div>
</fieldset>
