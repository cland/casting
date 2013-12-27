<div id="tab-auditions" class="tab">
	<div class="search-filter-container" id="search-filter-tab-stage1">
		<g:render template="filter_form_stage1"/>
	</div>
	
		<div class="cast-list" id="stage1-cast-list">	
			<g:render template="../layouts/profile_headshot" bean="${auditionProfiles}" var="profileList"></g:render>	
		</div>
	
	<div style="clear: both;"></div>	
</div>

<div id="tab-shortlist" class="tab">
	<div class="search-filter-container" id="search-filter-tab-stage2">
		<g:render template="filter_form_stage2"/>
	</div>
	<div>
		<div class="cast-list" id="stage2-cast-list">
			<g:render template="../layouts/profile_summary" collection="${shortlistProfiles }" var="profile"/>			
		</div>
		<div style="clear: both;"></div>
	</div>
</div>
<div id="tab-finalcast" class="tab">
	<div class="search-filter-container" id="search-filter-tab-stage2">
		<g:render template="filter_form_stage3"/>
	</div>
	<div>
		<div class="cast-list" id="stage3-cast-list">
			<g:render template="../layouts/profile_detailed" collection="${finalProfiles }" var="profile"/>
		</div>
		<div style="clear: both;"></div>
	</div>
</div>
