<%@ page import="com.cland.casting.SystemRoles" %>
<div class="footer" id="footer">
<a href="/casting/">Home</a> |
<sec:ifNotLoggedIn>
<g:link controller="login" action="index" >Login</g:link> |
</sec:ifNotLoggedIn>
<sec:ifLoggedIn>
<g:link controller="home" action="casting" >Casting</g:link> |
<g:link controller="home" action="index" >About us</g:link> |
<g:link controller="home" action="index" >News & Events</g:link> |
<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_DIRECTOR }">

<g:link controller="production" action="list" >Productions</g:link> |

</sec:ifAnyGranted>
<sec:ifAnyGranted roles="${SystemRoles.ROLE_DEVELOPER }">
<g:link controller="admin" view="/admin/technical">Technical</g:link> |
</sec:ifAnyGranted>
<g:link controller="logout" action="index" >Logout</g:link>
</sec:ifLoggedIn>
<br/>
<div class="copyright"><g:copyright startYear="2013">Tagumi Systems</g:copyright></div>
</div>