	
<div id="accordion" style="font-size: 14px;">
		<h3><g:message code="default.agency.menu.label" default="Agency Menu" /></h3>
		<div>
			<ul>
				<g:set var="agency_id"><g:agencyId/></g:set>
				<li>
					<g:link class="show" controller="agency" action="show" id="${agency_id }" params="[sidebar:'0']">
						<g:message code="default.view.label" args="['Details']" />
					</g:link>
				</li>
										
				<li>
					<g:link class="list" controller="candidate" action="list" params="[sidebar:'0']">
						<g:message code="default.list.label" args="['Candidate']" />
					</g:link>
				</li>
				<li>
					<g:link class="list" controller="production" action="list" params="[sidebar:'0']">
						<g:message code="default.list.label" args="['Production']" />
					</g:link>
				</li>													
			</ul>
		</div>					
</div>