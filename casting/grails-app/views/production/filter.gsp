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
         	<th class="cell head">Role</th>
         	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
         	<th class="cell head vstage1 center" colspan="3">Auditions</th>       
         	</sec:ifAnyGranted>
         	<th class="cell head vstage2 vstage3 center" colspan="2">Callback</th>
         	<th class="cell head vstage2 vstage3 center" colspan="2">Wardrobe</th>
         	<th class="cell head vstage2 vstage3 center" colspan="2">Shoot</th>
         	<th class="cell head vstage1 vstage2 center ">Shortlisted</th>
         	<th class="cell head vstage2 vstage3 center">Confirmed</th>
         </tr></thead>
         <tr>
         	<td colspan="4"></td>
         	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
         	<td class="vstage1  sub-head">Invited</td><td class="vstage1  sub-head">Available</td><td class="vstage1  sub-head">Attended</td>
         	</sec:ifAnyGranted>
         	<td class="vstage2 vstage3 sub-head">Available</td><td class="vstage2 vstage3 sub-head">Attended</td>
         	<td class="vstage2 vstage3 sub-head">Available</td><td class="vstage2 vstage3 sub-head">Attended</td>
         	<td class="vstage2 vstage3 sub-head">Available</td><td class="vstage2 vstage3 sub-head">Attended</td>
         	<td class="vstage1 vstage2"></td>
         	<td class="vstage2 vstage3"></td>
         </tr>
         <tbody>
         	<g:render template="../layouts/profile_list" collection="${profileList }" var="profile"/>
         </tbody>         
	</table>
	
</g:elseif>

<g:else>
	<g:render template="../layouts/profile_headshot" bean="${profileList}" var="profileList"></g:render>
</g:else>