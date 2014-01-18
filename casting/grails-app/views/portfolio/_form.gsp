<%@ page import="com.cland.casting.SystemRoles" %>
<%@ page import="com.cland.casting.Portfolio" %>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="portfolio.name.label" default="Name" />	
	</label>
	<g:textField name="name" value="${portfolioInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="portfolio.comments.label" default="Comments" />	
	</label>
	<g:textField name="comments" value="${portfolioInstance?.comments}"/>
</div>
<g:hiddenField name="production.id" value="${portfolioInstance?.production?.id}"/>

<%--<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'production', 'error')} required">--%>
<%--	<label for="production">--%>
<%--		<g:message code="portfolio.production.label" default="Production" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="production" name="production.id" from="${com.cland.casting.Production.list()}" optionKey="id" required="" value="${portfolioInstance?.production?.id}" class="many-to-one"/>--%>
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'profiles', 'error')} ">
	<label for="profiles">
		<g:message code="portfolio.profiles.label" default="Profiles" />		
	</label>
	<g:select name="profiles" from="${portfolioInstance?.production?.profiles?.sort{it.name}}" multiple="multiple" optionKey="id" size="5" value="${portfolioInstance?.profiles*.id}" optionValue="castingDetails" class="many-to-many"/>
</div>

<fieldset><legend>Who can access this portfolio other than the client</legend>

	<div class="role-access-control">
		<div class="role-data-table">
			
			<div class="row">
				<div class="cell"><label for="agencyAcl"><g:message code="role.agencyacl.label" default="Agencies" /></label>
					<br/><span style="color:red;font-size:0.6em;">** This to allow agencies to view this portfolio. Selected agencies will be able to view this portfolios' profiles including candidates that don't belong to their agency. If none selected, it means ONLY the client who owns this production can see this portfolio.</span>
				</div>
				<div class="cell">
					<div class="fieldcontain ${hasErrors(bean: portfolioInstance, field: 'agencyACL', 'error')} ">		
						<g:select name="agencyAcl" from="${com.cland.casting.Agency.list()}" multiple="multiple" optionKey="id" size="5" optionValue="agencyAndCategories" value="${portfolioInstance?.agencyAcl*.id}" noSelection="['': '--No Selection--']" class="many-to-many"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</fieldset>

