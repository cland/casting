	
<div id="accordion" style="font-size: 14px;">
		<h3><g:message code="default.client.menu.label" default="Client Menu" /></h3>
		<div>
			<ul>
				<li>
					<g:set var="client_id"><g:clientId/></g:set>
					<g:link class="show" controller="client" action="show" id="${client_id }">
						<g:message code="default.view.label" args="['Details']" />
					</g:link>
				</li>
				<li>
					<g:link class="list" controller="production" action="list">
						<g:message code="default.list.label" args="['Production']" />
					</g:link>
				</li>						
<%--				<li>--%>
<%--					<g:link class="list" controller="candidate" action="list">--%>
<%--						<g:message code="default.list.label" args="['Candidate']" />--%>
<%--					</g:link>--%>
<%--				</li>							--%>
			</ul>
		</div>					
</div>