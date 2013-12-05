<div id="tab-auditions">
	<div>
		<div class="cast-list">
			<g:render template="../layouts/profile_headshot" bean="${auditionProfiles}" var="profileList"></g:render>	
		</div>
		<div style="clear: both;"></div>
	</div>
</div>
<div id="tab-shortlist">
	<div>
		<div class="cast-list">
			<g:render template="../layouts/profile_summary" collection="${shortlistProfiles }" var="profile"/>			
		</div>
		<div style="clear: both;"></div>
	</div>
</div>
<div id="tab-finalcast">
	<div>
		<div class="cast-list">
		<g:render template="../layouts/profile_detailed" collection="${finalProfiles }" var="profile"/>
		</div>
		<div style="clear: both;"></div>
	</div>
</div>
