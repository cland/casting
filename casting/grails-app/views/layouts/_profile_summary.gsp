<!-- div SUMMARY structure -->
<%@ page import="com.cland.casting.SystemRoles" %>
     <div id="row-${profile?.id }" class="summary-row">
         <div id="cast-details-${profile?.id }" class="cast-details">
         	<div class="cast-details-data-table">
         		<div class="row castnum">
            		<div class="cell"><label>Casting No.:</label></div>
            		<div class="cell"><span class="property-value">${profile?.castNo }</span></div>
            	</div>
            	<div class="row name">
            		<div class="cell"><label>Name:</label></div>
            		<div class="cell"><span class="property-value">${profile?.canditate?.person }</span></div>
            	</div>
            	<div class="row age">
            		<div class="cell"><label>Age:</label></div>
            		<div class="cell"><span class="property-value">${profile?.age }</span></div>
            	</div>
            </div>
         </div>
         <div id="cast-actions-${profile?.id }" class="cast-actions">
         	<div class="cast-actions-data-table">
         		<div class="row shortlist">
					<div class="cell"><label for="isShortlist">Short List: </label></div>
					<div class="cell">
						<input class="checkbox" type="radio" value="true" <g:if test="${profile?.isShortlist==true }">checked=""</g:if> name="isShortlist_${profile?.id }">Yes
                		<input class="checkbox" type="radio" value="false" <g:if test="${profile?.isShortlist==false }">checked=""</g:if> name="isShortlist_${profile?.id }">No
                	</div>
				</div>	
                <div class="row rating">
                	<div class="cell"><label for="rating">My star rating:</label></div>
                	<div class="cell">
                	 	<input class="radio-input" type="radio" value="none" checked="" name="rating_${profile?.id }">None
		                <input class="radio-input" type="radio" value="1" name="rating_${profile?.id }">1
		                <input class="radio-input" type="radio" value="2" name="rating_${profile?.id }">2
		                <input class="radio-input" type="radio" value="3" name="rating_${profile?.id }">3
		                <input class="radio-input" type="radio" value="4" name="rating_${profile?.id }">4
		                <input class="radio-input" type="radio" value="5" name="rating_${profile?.id }">5
		                <br/><span style="font-size:9pt">( 1=Poor, 5=Excellent ) </span>
                	</div>
                </div>
                <div class="row comments">
                	<div class="cell"><label for="comments">Comments: </label></div>
                	<div class="cell">
                		<g:textArea name="comments_${profile?.id }" rows="3" cols="8"></g:textArea>
                	</div>
                </div>
			</div>	
         </div>
         <div id="cast-mugshot-${profile?.id }" class="cast-mugshot">
 			<g:set var="hasphoto" value="${false }"/>
		    <attachments:each bean="${profile?.pictures}" inputName="headshot" status="j">	         
				<g:if test="${j==0}">
					<g:set var="hasphoto" value="${true }"/>
					<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>		
				</g:if>			
			</attachments:each>	
			
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
				<g:if test="${hasphoto==false}"> 
					<g:if test="${ profile?.pictures}">
							<g:link class="edit" controller="pictureSet" action="edit" id="${profile?.pictures?.id}">
							<g:message code="default.add.label" args="['Photo']"/>
							</g:link>
					</g:if>
					<g:else>
						<g:link class="create" controller="pictureSet" action="create" params="${['castingProfile.id':profile?.id]}">
						<g:message code="default.add.label" args="['Photo']"/>
						</g:link>
					</g:else>
				</g:if>
			</sec:ifAnyGranted>
             <div class="profile-text"><g:link controller="castingProfile" action="show" id="${profile.id }">${profile?.canditate?.person }</g:link></div>                
         </div>            
     </div>     

