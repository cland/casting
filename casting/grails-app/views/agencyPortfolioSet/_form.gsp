<%@ page import="com.cland.casting.AgencyPortfolioSet" %>



<div class="fieldcontain ${hasErrors(bean: agencyPortfolioSetInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="agencyPortfolioSet.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${agencyPortfolioSetInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: agencyPortfolioSetInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="agencyPortfolioSet.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${agencyPortfolioSetInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: agencyPortfolioSetInstance, field: 'candidate', 'error')} required">
	<label for="candidate">
		<g:message code="agencyPortfolioSet.candidate.label" default="Candidate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="candidate" name="candidate.id" from="${com.cland.casting.Candidate.list()}" optionKey="id" required="" value="${agencyPortfolioSetInstance?.candidate?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: agencyPortfolioSetInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="agencyPortfolioSet.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${agencyPortfolioSetInstance?.name}"/>
</div>

