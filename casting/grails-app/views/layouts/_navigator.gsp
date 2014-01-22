<%@ page import="com.cland.casting.SystemRoles" %>
<div class="nav" role="navigation">
	<ul>
		
		<li>
			<a class="home" href="${createLink(uri: '/')}">
				<g:message code="default.home.label" />
			</a>
		</li>
		<sec:ifLoggedIn>
		<li><g:link controller="home" action="casting" class="casting"> <g:message
					code="default.casting.label" /></g:link></li>
		</sec:ifLoggedIn>						
		<li>
			<a class="aboutus" href="${createLink(uri: '/home/aboutus')}">
			<g:message code="default.aboutus.label" /></a>
		</li>

		<li><a class="newsevents" href="${createLink(uri: '/home/news')}"> 
		<g:message code="default.newsevents.label" /></a></li>
		<sec:ifLoggedIn>		
			<li>
				<g:link controller="logout" action="index" class="logout">
					<g:message code="default.logout.label" />
				</g:link>
			</li>
		</sec:ifLoggedIn>

		<sec:ifNotLoggedIn>
			<li>
				<g:link controller="login" action="index" class="login">
					<g:message code="default.login.label" />
				</g:link>
			</li>
		</sec:ifNotLoggedIn>
		<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
			<li>
				<g:render template="../layouts/siteSearch"/>
			</li>
		</sec:ifAnyGranted>
	</ul>
	<a href="javascript:printFriendly(true,false);" style="margin-top:-25px" class="print-button float-right">
		<g:message code="default.print.label" />
	</a>
</div>
