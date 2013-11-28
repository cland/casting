	
	<div id="accordion" style="font-size: 14px;">
			<h3>Manage Agencies</h3>
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
			<h3>Manage Productions</h3>
			<div>
				<ul>
					<li><g:link class="list" controller="Production" action="list">
							<g:message code="default.list.label" args="['Production']" /></g:link></li>
				<g:if test="${productionInstance }">							
					<li><g:link class="create" controller="production" action="create">
							<g:message code="default.new.label" args="['Production']" /></g:link></li>
				</g:if>
				<g:if test="${productionInstance }">			
					<li><g:link class="create" controller="castingProfile" action="create" params="${['production.id':productionInstance?.id]}">
							<g:message code="default.new.label" args="['Profile']" /></g:link></li>
				</g:if>
				<li><g:link class="list" controller="castingProfile" action="list">
							<g:message code="default.list.label" args="['Profile']" /></g:link></li>
				</ul>
			</div>
			<h3>Manage Clients</h3>
			<div>
				<ul>
					<li><g:link class="create" controller="Client" action="create">
							<g:message code="default.new.label" args="['Production']" /></g:link></li>
					<li><g:link class="list" controller="Client" action="list">
							<g:message code="default.list.label" args="['Client']" /></g:link></li>
				</ul>
			</div>

			<h3>Manage Users</h3>
			<div>
				<ul>
					<li><g:link class="create" controller="user" action="create">
							<g:message code="default.new.label" args="['User']" /></g:link></li>
					<li><g:link class="list" controller="user" action="list">
							<g:message code="default.list.label" args="['User']" />
						</g:link></li>
					<li><g:link class="create" controller="organisation" action="create">
							<g:message code="default.new.label" args="['Organisation']" /></g:link></li>
					<li><g:link class="list" controller="user" action="list">
							<g:message code="default.list.label" args="['Organisation']" />
						</g:link></li>						
				</ul>
			</div>
			<h3>Other</h3>
			<div>
			<ul>
					<li><g:link class="create" controller="region" action="create">
							<g:message code="default.new.label" args="['Region']" /></g:link></li>
					<li><g:link class="list" controller="region" action="list">
							<g:message code="default.list.label" args="['Region']" />
						</g:link></li>
					<li><g:link class="create" controller="race" action="create">
							<g:message code="default.new.label" args="['Race']" /></g:link></li>
					<li><g:link class="list" controller="user" action="list">
							<g:message code="default.list.label" args="['Race']" />
						</g:link></li>
			</ul>
			</div>			
		</div>