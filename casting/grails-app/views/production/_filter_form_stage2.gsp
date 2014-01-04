		<fieldset><legend>Search Filter and Display Options</legend>
		<g:formRemote name="stage2_filter_form" url="[controller:'production',action:'filter']" update="stage2-cast-list" onSuccess="onSuccessFilterStage2CallbackHander(data,textStatus)"
			onLoading="onLoading()"
			onComplete="onComplete()"
			onFailure="onFailure(data,textStatus)">
			<g:hiddenField name="production.id" value="${productionInstance?.id }"/>
			<g:hiddenField name="filter_shortlist_stage2" value="yes"/>
			<div class="search-filter">
				<div class="filter-button float-right"><a href="#" onclick="filterDialog();return false;">Update Filter</a></div>
				<div class="filter-selected">
					<div class="data-table">
						<div class="row">
							<div class="cell"><label>Roles:</label></div>
							<div class="cell">
								<g:each in="${productionInstance?.roles}" var="role" status="i">
									<g:checkBox name="filter_roles_stage2" value="${role.id }"/><span class="checkbox-text">${role }</span><br/>
								</g:each>
							</div>
							<div class="cell"><label>Categories:</label></div>
							<div class="cell">
								<g:each in="${productionInstance?.categories}" var="c" status="i">
									<g:checkBox name="filter_categories_stage2" value="${c.id }"/><span class="checkbox-text">${c }</span><br/>								
								</g:each>
							</div>
							<div class="cell"><label>Confirmed:</label></div>
							<div class="cell">
								<g:radioGroup name="filter_confirmed_stage2" values="['yes','no','any']" labels="['yes','no','any']" >
									<span>${it.radio } ${it.label } </span>
								</g:radioGroup>
							</div>
						</div>
						<div class="row group">
							<div class="cell group"><label>CALLBACK:</label></div>
							<div class="cell"><span class="r-arrow"></span> <label>Available</label></div>
							<div class="cell">
								<g:radioGroup name="filter_callback_stage2" values="['yes','no','any']" labels="['yes','no','any']" >
									<span>${it.radio } ${it.label } </span>
								</g:radioGroup>
							</div>
							<div class="cell"><label>Attended:</label></div>
							<div class="cell">
								<g:radioGroup name="filter_callback_attended_stage2" values="['yes','no','any']" labels="['yes','no','any']" >
									<span>${it.radio } ${it.label } </span>
								</g:radioGroup>
							</div>
							<div class="cell"><label></label></div>
							<div class="cell"></div>
						</div>
						<div class="row group">
							<div class="cell group"><label>WARDROBE:</label></div>
							<div class="cell"><span class="r-arrow"></span> <label>Available:</label></div>
							<div class="cell">
								<g:radioGroup name="filter_wardrobe_stage2" values="['yes','no','any']" labels="['yes','no','any']" >
									<span>${it.radio } ${it.label } </span>
								</g:radioGroup>
							</div>
							<div class="cell"><label>Attended:</label></div>
							<div class="cell">
								<g:radioGroup name="filter_wardrobe_attended_stage2" values="['yes','no','any']" labels="['yes','no','any']" >
									<span>${it.radio } ${it.label } </span>
								</g:radioGroup>
							</div>
							<div class="cell"><label></label></div>
							<div class="cell"></div>
						</div>
						<div class="row group">
							<div class="cell group"><label>SHOOT:</label></div>
							<div class="cell"><span class="r-arrow"></span> <label>Available:</label></div>
							<div class="cell">
								<g:radioGroup name="filter_shoot_stage2" values="['yes','no','any']" labels="['yes','no','any']" >
									<span>${it.radio } ${it.label } </span>
								</g:radioGroup>
							</div>
							<div class="cell"><label>Attended:</label></div>
							<div class="cell">
								<g:radioGroup name="filter_shoot_attended_stage2" values="['yes','no','any']" labels="['yes','no','any']" >
									<span>${it.radio } ${it.label } </span>
								</g:radioGroup>
							</div>
							<div class="cell"><label></label></div>
							<div class="cell"></div>
						</div>						
					</div>
					  
				</div>
			</div>
			<g:render template="../layouts/display_options" model="[stage:'stage2',viewvalue:'summary',sortvalue:'castno']"/>
			</g:formRemote>
</fieldset>