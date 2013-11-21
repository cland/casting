 <div class="fieldcontain required">
 <label for="firstName">
		<g:message code="user.role.label" default="Roles" />
		<span class="required-indicator">*</span>
	</label>
		<g:each var="auth" in="${com.cland.casting.Role.list()}">
			<g:set var="isRoleChecked" value="false" />
			<g:if test="${params.action=='edit'}">
    		<g:each var="sel" in="${roleMap.authority }">    		
        		 <g:if test="${auth?.authority==sel}">           		  
        		 	<g:set var="isRoleChecked" value="true" />
        		 </g:if>        		      		
    		</g:each>
    		</g:if>
    		
    		 <g:checkBox name="role_${auth.authority}" id="${auth.id}" checked="${isRoleChecked}" label="${auth.authority}"/> ${auth.authority?.replace("ROLE_","").toLowerCase()}
    		 
		</g:each>
</div>
	
	
    
   