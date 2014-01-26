<%@ page import="com.cland.casting.SystemRoles" %>
<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
<span class="vstage1_${stage}">
	<span class="action-link-label"><g:message code="default.invite.label" default="Request" />: </span>
	<span class="action-link" onclick="setAllRadio('.invite_radio_group:radio','true','true')">All</span> | 
	<span class="action-link" onclick="setAllRadio('.invite_radio_group:radio','false','true')">None</span> 
</span>
<span class="vstage1_${stage} vstage2_${stage}">
	 <span class="action-link-label"><g:message code="default.shortlist.label" default="Shortlist" />: </span> <span class="action-link" onclick="setAllRadio('.shortlist_radio_group:radio','true','true')"> All</span> | 
	<span class="action-link" onclick="setAllRadio('.shortlist_radio_group:radio','false','true')">None</span> 
</span>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_DIRECTOR }">
<span class="vstage2_${stage} vstage3_${stage}">
	<span class="action-link-label"><g:message code="default.confirm.label" default="Confirm" />: </span> <span class="action-link" onclick="setAllRadio('.confirm_radio_group:radio','true','true')"> All</span> | 
	<span class="action-link" onclick="setAllRadio('.confirm_radio_group:radio','false','true')">None</span> 
</span>
</sec:ifAnyGranted>