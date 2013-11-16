<div id="status" class="leftbar" role="complementary">
	<h1>Actions</h1>
	<ul>		
		<li><g:link class="create" controller="production" action="create"><g:message code="default.new.label" args="['Production']" /></g:link></li>
		<li><g:link class="list" controller="production" action="list"><g:message code="default.list.label" args="['Production']" /></g:link></li>
		<li><g:link class="list" controller="production" action="show" id="${productionInstance?.id }"><g:message code="default.show.label" args="['Production']" /></g:link></li>	
		<li><g:link class="create" controller="portfolio" action="create" params="${['production.id':productionInstance?.id]}" ><g:message code="default.new.label" args="['Portfolio']" /></g:link></li>	
	</ul>
	<g:if test="${productionInstance?.client}">
		<h1>Client Details</h1>
		<ul>			
			<li>Name: 
				<span class="property-value" aria-labelledby="client-label">
				<g:link controller="client"	action="show" id="${productionInstance?.client?.id}">
						${productionInstance?.client?.encodeAsHTML()}
				</g:link>
				</span>
			</li>
			<li>Tel: ${productionInstance?.client?.company?.phoneNo}</li>		
		</ul>
	</g:if>
	<br />
	<g:if test="${productionInstance?.categories}">
	<h1>Categories</h1>
		<ul>
			<li class="fieldcontain">
				<span id="categories-label" class="property-label"><g:message code="production.categories.label" default="Categories" /></span>					
					<g:each in="${productionInstance.categories}" var="c">
					<span class="property-value" aria-labelledby="categories-label"><g:link controller="castingCategory" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
					</g:each>				
			</li>
		</ul>
	</g:if>		
	
</div>