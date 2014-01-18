<%@ page import="com.cland.casting.SystemRoles" %>
<g:set var="total_count" value="${profileList?.size() }"/>
<g:if test="${viewas?.equalsIgnoreCase("detailed") }">
	<div> 
		<span class="r-arrow"></span> Displaying: <b>${total_count }</b> profiles! 
		<g:if test="${total_count > 0 && productionId }">
			[ <g:link controller="production" action="downloadProfilesZip" params="[prod_id:productionId,profiles:profileList?.id ]"><g:message code="default.download.media.label" default="Download" /></g:link> ]
		</g:if>
	</div><br/>
	<g:render template="../layouts/profile_detailed" collection="${profileList }" var="profile"  model="[stage: stage,prod_id:productionId]"/>
</g:if>
<g:elseif test="${viewas?.equalsIgnoreCase("summary") }">
	<div> 
		<span class="r-arrow"></span> Displaying: <b>${total_count }</b> profiles! 
		<g:if test="${total_count > 0 && productionId }">
			[ <g:link controller="production" action="downloadProfilesZip" params="[prod_id:productionId,profiles:profileList?.id ]"><g:message code="default.download.media.label" default="Download" /></g:link> ]
		</g:if>
	</div><br/>
	<g:render template="../layouts/profile_summary" collection="${profileList }" var="profile" model="[stage: stage,prod_id:productionId]"/>
</g:elseif>

<g:elseif test="${viewas?.equalsIgnoreCase("list") }">
	<div> 
		<span class="r-arrow"></span> Displaying: <b>${total_count }</b> profiles!
		<g:if test="${total_count > 0 && productionId }">
			[ <g:link controller="production" action="downloadProfilesZip" params="[prod_id:productionId,profiles:profileList?.id ]"><g:message code="default.download.media.label" default="Download" /></g:link> ]
		</g:if>
	</div><br/>
	<table>
		<thead><tr>
			<th class="cell head">Cast No.</th>
         	<th class="cell head">Name</th>
         	<th class="cell head">Age</th>
         	<th class="cell head">Role</th>
         	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
         	<th class="cell head vstage1_${stage} center" colspan="3"><g:message code="default.audition.label" default="Audition" /></th>       
         	</sec:ifAnyGranted>
         	<th class="cell head vstage2_${stage} vstage3_${stage} center" colspan="2"><g:message code="default.callback.label" default="Callback" /></th>
         	<th class="cell head vstage2_${stage} vstage3_${stage} center" colspan="2"><g:message code="default.wardrobe.label" default="Wardrobe" /></th>
         	<th class="cell head vstage2_${stage} vstage3_${stage} center" colspan="2"><g:message code="default.shoot.label" default="Shoot" /></th>
         	<th class="cell head vstage1_${stage} vstage2_${stage} center "><g:message code="default.shortlisted.label" default="Shortlisted" /></th>
         	<th class="cell head vstage2_${stage} vstage3_${stage} center"><g:message code="default.confirmed.label" default="Confirmed" /></th>
         </tr></thead>
         <tr>
         	<td colspan="4"></td>
         	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_AGENT }">
         	<td class="vstage1_${stage}  sub-head">Invited</td><td class="vstage1_${stage}  sub-head">Available</td><td class="vstage1_${stage}  sub-head">Attended</td>
         	</sec:ifAnyGranted>
         	<td class="vstage2_${stage} vstage3_${stage} sub-head">Available</td><td class="vstage2_${stage} vstage3_${stage} sub-head">Attended</td>
         	<td class="vstage2_${stage} vstage3_${stage} sub-head">Available</td><td class="vstage2_${stage} vstage3_${stage} sub-head">Attended</td>
         	<td class="vstage2_${stage} vstage3_${stage} sub-head">Available</td><td class="vstage2_${stage} vstage3_${stage} sub-head">Attended</td>
         	<td class="vstage1_${stage} vstage2_${stage}"></td>
         	<td class="vstage2_${stage} vstage3_${stage}"></td>
         </tr>
         <tbody>
         	<g:render template="../layouts/profile_list" collection="${profileList }" var="profile" model="[stage: stage,prod_id:productionId]"/>
         </tbody>         
	</table>
	
</g:elseif>

<g:else>
	<g:render template="../layouts/profile_headshot" bean="${profileList}" var="profileList" model="[stage: stage,prod_id:productionId]"></g:render>
</g:else>