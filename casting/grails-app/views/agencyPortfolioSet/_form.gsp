<%@ page import="com.cland.casting.SystemRoles" %>
<%@ page import="com.cland.casting.AgencyPortfolioSet" %>

<g:if test="${candidateInstance}">
<g:hiddenField name="candidate.id" value="${candidateInstance?.id}"/> 
</g:if>
<g:else>
<div class="fieldcontain ${hasErrors(bean: agencyPortfolioSetInstance, field: 'candidate', 'error')} required">
	<label for="candidate">
		<g:message code="agencyPortfolioSet.candidate.label" default="Candidate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="candidate" name="candidate.id" from="${com.cland.casting.Candidate.list()}" optionKey="id" required="" value="${agencyPortfolioSetInstance?.candidate?.id}" class="many-to-one"/>
</div>
</g:else>

<div class="fieldcontain ${hasErrors(bean: agencyPortfolioSetInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="agencyPortfolioSet.name.label" default="Title" />
		
	</label>
	<g:textField name="name" value="${agencyPortfolioSetInstance?.name}"/>
</div>


<br/>
<div class="fieldcontain">
<fieldset><legend>Upload Photos</legend>
<input type="file" name="pictures"/>
<input type="file" name="pictures"/>
<input type="file" name="pictures"/>
<input type="file" name="pictures"/>
<g:if test="${isNew == false }">
<br/>
	<div id="attachments" class="attachments">
			<attachments:each bean="${agencyPortfolioSetInstance}" inputName="pictures" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:agencyPortfolioSetInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
	</div>
</g:if>	
</fieldset>
</div>

