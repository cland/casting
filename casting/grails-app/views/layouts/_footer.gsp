<div class="footer" id="footer">
<a href="/casting/">Home</a> |
<sec:ifNotLoggedIn>
<g:link controller="login" action="index" >Login</g:link> |
</sec:ifNotLoggedIn>
<sec:ifLoggedIn>
<g:link controller="production" action="list" >Productions</g:link> |
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_DIRECTOR">

<g:link controller="organisation" action="list" >Organisations</g:link> |
<g:link controller="region" action="list" >Regions</g:link> |
<g:link controller="admin" view="/admin/technical">Technical</g:link> |
</sec:ifAnyGranted>
<g:link controller="logout" action="index" >Logout</g:link>
</sec:ifLoggedIn>
<br/>
<div class="copyright"><g:copyright startYear="2013">TI Systems</g:copyright></div>
</div>