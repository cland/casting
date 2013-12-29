<%@ page import="com.cland.casting.SystemRoles" %>
<div id="tab-auditions" class="tab">
	<div class="search-filter-container" id="search-filter-tab-stage1">
		<g:render template="filter_form_stage1"/>
	</div>
	<div class="wait">PROCESSING....PLEASE WAIT!!!</div>
		<g:formRemote name="stage1_form" url="[controller:'production',action:'update_profiles']" 
			update="stage1-cast-list" 
			onLoading="onLoading()"
			onComplete="onComplete()"
			onFailure="onFailure(data,textStatus)"
			onSuccess="onSuccessStage1CallbackHander(data,textStatus)">
			<g:hiddenField name="production.id" value="${productionInstance?.id }"/>
			<g:hiddenField name="stage" value="1"/>
			<g:hiddenField name="viewas" id="hidden_viewas_stage1" value="headshots"/>
			<g:hiddenField name="sortby" id="hidden_sortby_stage1" value="castno"/>
			<div class="cell float-left"> <g:submitButton name="Save Changes" id="submit_state1_top" class="submit action_wait"/></div>
			<div class="cast-list" id="stage1-cast-list">
				<g:render template="../layouts/profile_headshot" bean="${auditionProfiles}" var="profileList"></g:render>			
			</div>
			<div class="cell float-left"> <g:submitButton name="Save Changes" id="submit_stage1_bottom" class="submit action_wait"/></div>
		</g:formRemote>	
	<div style="clear: both;"></div>	
</div>

<div id="tab-shortlist" class="tab">
	<div class="search-filter-container" id="search-filter-tab-stage2">
		<g:render template="filter_form_stage2"/>
	</div>
	<div class="wait">PROCESSING....PLEASE WAIT!!!</div>
	<g:formRemote name="stage2_form" url="[controller:'production',action:'update_profiles']" 
		update="stage2-cast-list" 
		onLoading="onLoading()"
		onComplete="onComplete()"
		onFailure="onFailure(data,textStatus)"
		onSuccess="onSuccessStage2CallbackHander(data,textStatus)">
		<g:hiddenField name="production.id" value="${productionInstance?.id }"/>
		<g:hiddenField name="stage" value="1"/>
		<g:hiddenField name="viewas" id="hidden_viewas_stage2" value="summary"/>
		<g:hiddenField name="sortby" id="hidden_sortby_stage2" value="castno"/>
		<div class="cell float-left"> <g:submitButton name="Save Changes" id="submit_stage2_top" class="submit action_wait"/></div>
		<div>
			<div class="cast-list" id="stage2-cast-list">
				<g:render template="../layouts/profile_summary" collection="${shortlistProfiles }" var="profile"/>			
			</div>
			<div style="clear: both;"></div>
		</div>
		<div class="cell float-left"> <g:submitButton name="Save Changes" id="submit_stage2_bottom" class="submit action_wait"/></div>
	</g:formRemote>
</div>
<div id="tab-finalcast" class="tab">
	<div class="search-filter-container" id="search-filter-tab-stage2">
		<g:render template="filter_form_stage3"/>
	</div>
	<div class="wait">PROCESSING....PLEASE WAIT!!!</div>
	<g:formRemote name="stage3_form" url="[controller:'production',action:'update_profiles']" 
		update="stage3-cast-list" 
		onLoading="onLoading()"
		onComplete="onComplete()"
		onFailure="onFailure(data,textStatus)"
		onSuccess="onSuccessStage3CallbackHander(data,textStatus)">
		<g:hiddenField name="production.id" value="${productionInstance?.id }"/>
		<g:hiddenField name="stage" value="1"/>
		<g:hiddenField name="viewas" id="hidden_viewas_stage3" value="summary"/>
		<g:hiddenField name="sortby" id="hidden_sortby_stage3" value="castno"/>
		<div class="cell float-left"> <g:submitButton name="Save Changes" id="submit_stage3_top" class="submit action_wait"/></div>	
		<div>
			<div class="cast-list" id="stage3-cast-list">
				<g:render template="../layouts/profile_detailed" collection="${finalProfiles }" var="profile"/>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div class="cell float-left"> <g:submitButton name="Save Changes" id="submit_stage3_bottom" class="submit action_wait"/></div>
	</g:formRemote>
</div>
