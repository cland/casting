<div class="nav" role="navigation">
	<ul>
		
		<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
		<li>
			<a class="aboutus" href="${createLink(uri: '/')}">
			<g:message code="default.aboutus.label" /></a>
		</li>
		<li><a class="newsevents" href="${createLink(uri: '/')}"> <g:message
					code="default.newsevents.label" /></a></li>
		<sec:ifLoggedIn>		
			<li><g:link controller="logout" action="index" class="logout"><g:message
					code="default.logout.label" /></g:link></li>
		</sec:ifLoggedIn>

		<sec:ifNotLoggedIn>
			<li><g:link controller="login" action="index" class="login"><g:message
					code="default.login.label" /></g:link></li>
		</sec:ifNotLoggedIn>
	</ul>
</div>
