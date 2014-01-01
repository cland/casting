<!-- The tabs -->
<%@ page import="com.cland.casting.SystemRoles" %>
<g:set var="production" value="${castingRoleInstance?.production }"/>
<div id="tabs" style="display: none;">
	<ul>
		<li><a href="#tab-details">Details</a></li>
		<li><a href="#tab-profiles">Profiles</a></li>
	</ul>

	<!-- DETAILS -->	
<div id="tab-details" class="tab">
	
	
	<div id="row-${castingRoleInstance?.id }" class="role-row"> <!--  start role details -->
		<div id="role-details-${castingRoleInstance?.id }" class="role-details">
			<div class="cast-details-data-table">
         		<div class="row name">
            		<div class="cell"><label>Casting Role:</label></div>
            		<div class="cell"><span class="property-value">${castingRoleInstance?.name}</span></div>
            	</div>
            	<div class="row production">
            		<div class="cell"><label>Production:</label></div>
            		<div class="cell">
            			<g:link controller="production" action="show" id="${production?.id }">
            				<span class="property-value">${production?.name?.encodeAsHTML() }</span>
            			</g:link>
            		</div>
            	</div>
           	<g:if test="${castingRoleInstance?.description}">
            	<div class="row description">
            		<div class="cell"><label>About the role:</label></div>
            		<div class="cell"><span class="property-value">${castingRoleInstance?.description?.encodeAsHTML()}</span></div>
            	</div>				
				</g:if>   
         		<div class="row dayfee">
            		<div class="cell"><label>Day fee:</label></div>
            		<div class="cell"><span class="property-value">${castingRoleInstance?.dayfee}</span></div>
            	</div>				      	        	
				<g:if test="${castingRoleInstance?.feeNotes}">
            	<div class="row comments">
            		<div class="cell"><label>Fee notes:</label></div>
            		<div class="cell"><span class="property-value">${castingRoleInstance?.feeNotes?.encodeAsHTML()}</span></div>
            	</div>				
				</g:if>         	   
            	<div class="row castdate">
            		<div class="cell"><label>Cast Date(s):</label></div>
            		<div class="cell">
            			<g:each in="${castingRoleInstance?.auditionDates?.sort()}" var="d">
            			<span class="property-value"><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
            			</g:each>            			
            		</div>
            	</div>	 
             	<div class="row callbackdate">
            		<div class="cell"><label>Callback Date(s):</label></div>
            		<div class="cell">
            			<g:each in="${castingRoleInstance?.callbackDates?.sort()}" var="d">
            			<span class="property-value"><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
            			</g:each>            			
            		</div>
            	</div>
             	<div class="row wardropedate">
            		<div class="cell"><label>Wardrope Date(s):</label></div>
            		<div class="cell">
            			<g:each in="${castingRoleInstance?.wardropeDates?.sort()}" var="d">
            			<span class="property-value"><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
            			</g:each>            			
            		</div>
            	</div>    
             	<div class="row shootdates">
            		<div class="cell"><label>Shoot Date(s):</label></div>
            		<div class="cell">
            			<g:each in="${castingRoleInstance?.shootDates?.sort()}" var="d">
            			<span class="property-value"><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
            			</g:each>            			
            		</div>
            	</div>    
            	<div class="row required-count">
            		<div class="cell"><label>Required Count:</label></div>
            		<div class="cell"><span class="property-value">${castingRoleInstance?.requiredCount }</span></div>
            	</div>             	
            	<div class="row max-audition-count">
            		<div class="cell"><label>Max Required for Audition:</label></div>
            		<div class="cell"><span class="property-value">${castingRoleInstance?.maxRequiredAuditionCount }</span></div>
            	</div>  
             	<div class="row min-audition-count">
            		<div class="cell"><label>Min Required for Audition:</label></div>
            		<div class="cell"><span class="property-value">${castingRoleInstance?.minRequiredAuditionCount }</span></div>
            	</div>               									          	         	       
            </div>
		</div>

		<div class="clear"></div>
	</div>	<!-- end role details row -->
<br/>
 <sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
<fieldset><legend>Who can access this role</legend>
		<span id="allowedCategories-label" class="property-label"><g:message code="role.allowedcategories.label" default="Allowed categories:" /></span>
		<g:if test="${castingRoleInstance?.allowedCategories}">								
			
			<span class="property-value" aria-labelledby="allowedCategories-label">${castingRoleInstance?.allowedCategories*.name?.join(",")}</span>
				
		</g:if>
		<g:else><span class="property-value">All Categories</span></g:else>
<br/><br/>
		<span id="agencyACL-label" class="property-label"><g:message code="role.agencyacl.label" default="Agency access list (optional):" /></span>
		<g:if test="${castingRoleInstance?.agencyACL}">								
			<g:each in="${castingRoleInstance.agencyACL}" var="p">
			<span class="property-value" aria-labelledby="agencyACL-label"><g:link controller="agency" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
			</g:each>		
		</g:if>
		
</fieldset>	
</sec:ifAnyGranted>	
	
</div>

	<!-- Profiles -->
<div id="tab-profiles" class="tab">
		
		<p>No profiles available yet!</p>
		
</div>	
</div>
<!--  End tabs -->