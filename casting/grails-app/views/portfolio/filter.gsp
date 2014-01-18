<%@ page import="com.cland.casting.SystemRoles" %>
<g:set var="total_count" value="${profileList?.size() }"/>
<g:if test="${viewas?.equalsIgnoreCase("detailed") }">
	<div> 
		<span class="r-arrow"></span> Displaying: <b>${total_count }</b> profiles! 
		<g:if test="${total_count > 0 && productionId }">
			[ <g:link controller="production" action="downloadProfilesZip" params="[prod_id:productionId,profiles:profileList?.id,portfolioId:portfolioId ]"><g:message code="default.download.media.label" default="Download" /></g:link> ]
		</g:if>
	</div><br/>
	<g:render template="../layouts/profile_detailed" collection="${profileList }" var="profile" model="[stage: stage,prod_id:productionId, portfolioId:portfolioId]"/>
</g:if>
<g:elseif test="${viewas?.equalsIgnoreCase("summary") }">
	<div> 
		<span class="r-arrow"></span> Displaying: <b>${total_count }</b> profiles! 
		<g:if test="${total_count > 0 && productionId }">
			[ <g:link controller="production" action="downloadProfilesZip" params="[prod_id:productionId,profiles:profileList?.id,portfolioId:portfolioId ]"><g:message code="default.download.media.label" default="Download" /></g:link> ]
		</g:if>
	</div><br/>
	<g:render template="../layouts/profile_summary" collection="${profileList }" var="profile" model="[stage: stage,prod_id:productionId, portfolioId:portfolioId]"/>
</g:elseif>

<g:elseif test="${viewas?.equalsIgnoreCase("list") }">
	<div> 
		<span class="r-arrow"></span> Displaying: <b>${total_count }</b> profiles! 
		<g:if test="${total_count > 0 && productionId }">
			[ <g:link controller="production" action="downloadProfilesZip" params="[prod_id:productionId,profiles:profileList?.id ,portfolioId:portfolioId]"><g:message code="default.download.media.label" default="Download" /></g:link> ]
		</g:if>
	</div><br/>
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
         	<g:render template="../layouts/profile_list2" collection="${profileList }" var="profile" model="[stage: stage,prod_id:productionId, portfolioId:portfolioId]"/>
         </tbody>         
	</table>
	
</g:elseif>

<g:else>
	<g:render template="../layouts/profile_headshot" bean="${profileList}" var="profileList" model="[stage: stage,prod_id:productionId, portfolioId:portfolioId]"></g:render>
</g:else>