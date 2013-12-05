<!-- div DETAILED structure -->
<g:set var="candidate" value="${profile?.canditate }"/>
<div id="row-1" class="detailed-row">	
    <div id="cast-details-${profile?.id }" class="cast-details">
	    <div class="cast-details-data-table">
	       <div class="row castnum">
	       	<div class="cell"><label>Casting No.:</label></div>
	       	<div class="cell"><span class="property-value">${profile?.castNo }</span></div>
	       </div>
	       <div class="row name">
	       	<div class="cell"><label>Name:</label></div>
	       	<div class="cell"><span class="property-value">${candidate?.person }</span></div>
	       </div>
	       <div class="row age">
	       	<div class="cell"><label>Age:</label></div>
	       	<div class="cell"> <span class="property-value">${profile?.castNo }</span></div>
	       </div>
	       <div class="row height">
	       	<div class="cell"><label>Height:</label> </div>
	       	<div class="cell"><span class="property-value">${candidate?.height }</span> </div>
	       </div>
	       <div class="row contactno">
	       	<div class="cell"><label>Contact No.:</label></div>
	       	<div class="cell"><span class="property-value">${candidate?.person?.contactNo }</span> </div>
	       </div>
	       <div class="row agency">
	       	<div class="cell"><label>Agency:</label></div>
	       	<div class="cell"> <span class="property-value">${candidate?.agency }</span></div>
	       </div>
	       <div class="row castdate">
	       	<div class="cell"> <label>Date Cast:</label></div>
	       	<div class="cell"> <span class="property-value"><g:formatDate date="${profile?.castDate }" format="dd-MMM-yyyy"/></span></div>
	       </div>
	       <div class="row agencyno">
	       	<div class="cell"><label>Agency Tel.:</label></div>
	       	<div class="cell"><span class="property-value">${candidate?.agency?.company?.phoneNo }</span> </div>
	       </div>
	       <div class="row clothing">
	       	<div class="cell"><label>Dress/Suit</label></div>
	       	<div class="cell"><span class="property-value">${candidate?.clothing }</span> </div>
	       </div>
	
	       <div class="row waist">
	       	<div class="cell"><label>Waist</label></div>
	       	<div class="cell"> <span class="property-value">${candidate?.waist }</span></div>
	       </div>
	       <div class="row shoe">
	       	<div class="cell"><label>Shoe</label></div>
	       	<div class="cell"><span class="property-value">${candidate?.shoe }</span> </div>
	       </div>
	       <div class="row average-rating">
	       	<div class="cell"><label>Director's rating:</label></div>
	       	<div class="cell"><span class="property-value">${profile?.averating }</span> </div>
	       </div>
	       <div class="row comments-director">
	       	<div class="cell"><label>Director's comment:</label></div>
	       	<div class="cell"><span class="property-value">Quite a good profile!</span></div>
	       </div>
	       <div class="row comments-castadmin">
	       	<div class="cell"><label>Casting Admin Comments:</label></div>
	       	<div class="cell"><span class="property-value">Also a good musician</span> </div>
	      </div>
	       
	    </div>
    </div>
    
    <div id="cast-actions-${profile?.id }" class="cast-actions">
    </div>
    
    <div id="cast-mugshot-${profile?.id }" class="cast-mugshot">
        <img width="120" src="../../images/female.jpg">
        <div class="profile-text">${candidate?.person }</div>                
    </div>            
</div>     

