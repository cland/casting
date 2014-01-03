<!-- LIST table structure -->
<%--<th class="cell head">Cast No.</th>--%>
<%--<th class="cell head">Name</th>--%>
<%--<th class="cell head">Age</th>--%>
<%--<th class="cell head">Role</th>--%>
<%--<th class="cell head">Invited</th>--%>
<%--<th class="cell head">Shortlisted</th>--%>
<%--<th class="cell head">Confirmed</th>--%>
<%--<th class="cell head">Audition</th>--%>
<%--<th class="cell head">Callback</th>--%>
<%--<th class="cell head">Wardrobe</th>--%>
<%--<th class="cell head">Shoot</th>--%>
<g:set var="candidate" value="${ profile?.candidate}"/>
<%@ page import="com.cland.casting.SystemRoles" %>
<tr>
	<td><g:hiddenField name="profiles" value="${profile.id}"/>
	<span class="property-value">${profile?.castNo }</span></td>
    <td>
    	<span class="property-value">
    		<g:link controller="castingProfile" action="show" id="${profile?.id}">${profile?.getName() }</g:link>
    	</span>
    </td>
    <td><span class="property-value">${profile?.age }</span></td>
    <td><span class="property-value">${profile?.roles*.name.join("<br/>") }</span></td>  
    <td class="vstage1 center"><img src='${resource(dir: 'images/icons', file: (profile?.isInvited?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td> 	
	<td class="vstage1 center"><img src='${resource(dir: 'images/icons', file: (profile?.isAuditionAvailable?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
	<td class="vstage1 center"><img src='${resource(dir: 'images/icons', file: (profile?.isAuditionAttended?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
	
	<td class="vstage2 vstage3 center"><img src='${resource(dir: 'images/icons', file: (profile?.isCallbackAvailable?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
	<td class="vstage2 vstage3 center"><img src='${resource(dir: 'images/icons', file: (profile?.isCallbackAttended?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
    <td class="vstage2 vstage3 center"><img src='${resource(dir: 'images/icons', file: (profile?.isWardrobeAvailable?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
    <td class="vstage2 vstage3 center"><img src='${resource(dir: 'images/icons', file: (profile?.isWardrobeAttended?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
    <td class="vstage2 vstage3 center"><img src='${resource(dir: 'images/icons', file: (profile?.isRoleAvailable?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
    <td class="vstage2 vstage3 center"><img src='${resource(dir: 'images/icons', file: (profile?.isRoleAttended?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
    <td class="vstage1 vstage2 center"><img src='${resource(dir: 'images/icons', file: (profile?.isShortlist?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
    <td class="vstage2 vstage3 center"><img src='${resource(dir: 'images/icons', file: (profile?.isConfirmed?'accept.png':'delete.png'), plugin: 'famfamfam')}'/></td>
</tr>     



