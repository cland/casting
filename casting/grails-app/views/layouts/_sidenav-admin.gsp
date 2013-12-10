	
	<div id="accordion" style="font-size: 14px;">
			<h3><g:message code="default.agencies.menu" default="Agencies" /></h3>
			<div>
				<ul>
					<li><g:link class="create" controller="agency" action="create">
							<g:message code="default.new.label" args="['Agency']" /></g:link></li>
					<li><g:link class="list" controller="agency" action="list">
							<g:message code="default.list.label" args="['Agencies']" /></g:link></li>
					<li><g:link class="create" controller="candidate" action="create" params="${['agency.id':agencyInstance?.id]}">
							<g:message code="default.new.label" args="['Candidate']" /></g:link></li>		
					<li><g:link class="list" controller="candidate" action="list">
							<g:message code="default.list.label" args="['Candidates']" /></g:link></li>							
				</ul>
			</div>
			<h3><g:message code="default.productions.menu" default="Productions" /></h3>
			<div>
				<ul>
				<li><g:link class="create" controller="production" action="create" params="${['client.id':clientInstance?.id]}">
							<g:message code="default.new.label" args="['Production']"/></g:link></li>
					<li><g:link class="list" controller="Production" action="list">
							<g:message code="default.list.label" args="['Production']" /></g:link></li>																
								
				<li><g:link class="list" controller="castingProfile" action="list">
							<g:message code="default.list.label" args="['Profile']" /></g:link></li>
				</ul>
			</div>
			<h3><g:message code="default.clients.menu" default="Clients" /></h3>
			<div>
				<ul>
					<li><g:link class="create" controller="Client" action="create">
							<g:message code="default.new.label" args="['Client']" /></g:link></li>
					<li><g:link class="list" controller="Client" action="list">
							<g:message code="default.list.label" args="['Client']" /></g:link></li>
				</ul>
			</div>

			<h3><g:message code="default.users.menu" default="Users" /></h3>
			<div>
				<ul>
					<li><g:link class="create" controller="user" action="create">
							<g:message code="default.new.label" args="['User']" /></g:link></li>
					<li><g:link class="list" controller="user" action="list">
							<g:message code="default.list.label" args="['User']" />
						</g:link></li>
					<li><g:link class="create" controller="organisation" action="create">
							<g:message code="default.new.label" args="['Organisation']" /></g:link></li>
					<li><g:link class="list" controller="organisation" action="list">
							<g:message code="default.list.label" args="['Organisation']" />
						</g:link></li>						
				</ul>
			</div>
			<h3><g:message code="default.other.menu" default="Other" /></h3>
			<div>
			<ul>
					<li><g:link class="create" controller="region" action="create">
							<g:message code="default.new.label" args="['Region']" /></g:link></li>
					<li><g:link class="list" controller="region" action="list">
							<g:message code="default.list.label" args="['Region']" />
						</g:link></li>
					<li><g:link class="create" controller="race" action="create">
							<g:message code="default.new.label" args="['Race']" /></g:link></li>
					<li><g:link class="list" controller="race" action="list">
							<g:message code="default.list.label" args="['Race']" />
						</g:link></li>
			</ul>
			</div>			
		</div>