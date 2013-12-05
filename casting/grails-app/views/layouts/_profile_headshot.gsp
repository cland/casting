<!-- div HEADSHOT structure -->

<g:set var="data_table" value=""/>
<g:set var="tmp" value=""/>
<g:set var="count_per_row" value="${4 }"/>
<g:set var="total_count" value="${profileList.size() }"/>
<g:each in="${profileList }"  var="profile" status="i">
	<g:set var="entry">
		<div id="entry-${profile?.id }" class="mugshot">
	        <img width="120" src="../../images/male.jpg">
	        <div class="profile-text"> Include in short list:</div>
	        <div class="profile-input">
	            <input class="mugshot_radioyes" type="radio" value="yes" checked="" name="E1_${profile?.id }">Yes
	            <input class="mugshot_radiono" type="radio" value="no" name="E1_${profile?.id }">No
	        </div>
	    </div>					
	</g:set>
	
	<g:set var="tmp" value="${tmp } ${entry }"/>
	
	<g:if test="${((i+1)%count_per_row) ==0 }">
		<g:set var="data_table">
			<div id="row-${i}" class="headshot-row">
				${tmp }
			</div>
		</g:set>
		<g:set var="tmp" value=""/>
	</g:if>
	<!-- Add the last bit -->
	<g:if test="${(total_count == (i+1)) & tmp != "" }">
		<g:set var="data_table">
			${data_table }
			<div id="row-${i}" class="headshot-row">
				${tmp }
			</div>
		</g:set>
	</g:if>
</g:each>
${data_table }
   