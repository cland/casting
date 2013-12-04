<!-- div SUMMARY structure -->

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
             <img width="130" src="../../images/female.jpg">
             <div class="profile-text">${profile?.canditate?.person }</div>                
         </div>            
     </div>     

