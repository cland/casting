<div class="nav" role="navigation">
	<ul>
		<sec:ifLoggedIn>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link controller="course" action="list">About us</g:link></li>

			<li><g:link controller="person" action="show"
					id="${sec.loggedInUserInfo(field:'id')}">Candidates
		<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_DIRECTOR">
				and Productions
		</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_DIRECTOR">
					
						<li><g:link controller="production" action="list">Productions</g:link></li>						
						<li><g:link controller="user" action="list">People</g:link></li>
					</sec:ifAnyGranted>

				</g:link></li>
			<li><g:link controller="logout" action="index">Logout</g:link></li>
		</sec:ifLoggedIn>

		<sec:ifNotLoggedIn>
			<li><g:link controller="login" action="index">&nbsp;</g:link></li>
		</sec:ifNotLoggedIn>
	</ul>
</div>
