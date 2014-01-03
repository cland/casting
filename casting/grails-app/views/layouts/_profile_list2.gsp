
<g:if test="${ profile}">
<g:set var="candidate" value="${ profile?.candidate}"/>
<%@ page import="com.cland.casting.SystemRoles" %>
<tr>
	<td><g:hiddenField name="profiles" value="${profile?.id}"/>
	<span class="property-value">${profile?.castNo }</span></td>
    <td>
    	<span class="property-value">
    		<g:link controller="castingProfile" action="show" id="${profile?.id}">${profile?.getName() }</g:link>
    	</span>
    </td>
    <td><span class="property-value">${profile?.age }</span></td>
    <td><span class="property-value">${profile?.production?.name }</span></td>
    <td><span class="property-value">${profile?.roles*.name?.join("<br/>") }</span></td>  
	<td class="vstage1 center"><img src='${resource(dir: 'images/icons', file: (profile?.isInvited?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
	<td class="vstage1 vstage2 center"><img src='${resource(dir: 'images/icons', file: (profile?.isShortlist?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
    <td class="vstage2 vstage3 center"><img src='${resource(dir: 'images/icons', file: (profile?.isConfirmed?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
</tr>     
</g:if>
<g:else>
<tr><td colspan="15"><div class="message">No Data Available!</div></td></tr>
</g:else>


