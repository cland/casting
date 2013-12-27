<!-- LIST table structure -->
<g:set var="candidate" value="${ profile?.canditate}"/>
<%@ page import="com.cland.casting.SystemRoles" %>
<tr>
	<td><span class="property-value">${profile?.castNo }</span></td>
    <td><span class="property-value">
    	<g:link controller="castingProfile" action="show" id="${profile?.id}">${profile?.getName() }</g:link></span></td>
    <td><span class="property-value">${candidate?.person.contactNo }</span></td>
     <td>${profile?.roles*.name.join(",") }</td>            
</tr>     

