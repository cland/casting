

<g:if test="${viewas.equalsIgnoreCase("detailed") }">
	<g:render template="../layouts/profile_detailed" collection="${profileList }" var="profile"/>
</g:if>
<g:elseif test="${viewas.equalsIgnoreCase("summary") }">
	<g:render template="../layouts/profile_summary" collection="${profileList }" var="profile"/>
</g:elseif>

<g:elseif test="${viewas.equalsIgnoreCase("list") }">
	<table>
		<thead><tr>
			<th class="cell head">Cast No.</th>
         	<th class="cell head">Name</th>
         	<th class="cell head">Contact No.</th>
         	<th class="cell head">Role</th>
         </tr></thead>
         <tbody>
         	<g:render template="../layouts/profile_list" collection="${profileList }" var="profile"/>
         </tbody>         
	</table>
	
</g:elseif>

<g:else>
	<g:render template="../layouts/profile_headshot" bean="${profileList}" var="profileList"></g:render>
</g:else>