<%@ page import="com.cland.casting.SystemRoles" %>

<g:if test="${viewas?.equalsIgnoreCase("detailed") }">
	<g:render template="../layouts/profile_detailed" collection="${profileList }" var="profile"/>
</g:if>
<g:elseif test="${viewas?.equalsIgnoreCase("summary") }">
	<g:render template="../layouts/profile_summary" collection="${profileList }" var="profile"/>
</g:elseif>

<g:elseif test="${viewas?.equalsIgnoreCase("list") }">
	<table>
		<thead><tr>
			<th class="cell head">Cast No.</th>
         	<th class="cell head">Name</th>
         	<th class="cell head">Age</th>
         	<th class="cell head">Production</th>
         	<th class="cell head">Role</th>
         	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
         		<th class="cell head center">Invited</th>            
         	</sec:ifAnyGranted>    	
         	<th class="cell head center ">Shortlisted</th>
         	<th class="cell head center">Confirmed</th>
         </tr></thead>
         
         <tbody>
         	<g:render template="../layouts/profile_list2" collection="${profileList }" var="profile"/>
         </tbody>         
	</table>
	
</g:elseif>

<g:else>
	<g:render template="../layouts/profile_headshot" bean="${profileList}" var="profileList"></g:render>
</g:else>