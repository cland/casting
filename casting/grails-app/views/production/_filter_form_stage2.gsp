		<fieldset><legend>Search Filter and Display Options</legend>
		<g:formRemote name="stage2_filter_form" url="[controller:'production',action:'filter']" update="stage2-cast-list">
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
							<div class="cell group"><label>WARDROPE:</label></div>
							<div class="cell"><span class="r-arrow"></span> <label>Available:</label></div>
							<div class="cell">
								<g:radioGroup name="filter_wardrope_stage2" values="['yes','no','any']" labels="['yes','no','any']" >
									<span>${it.radio } ${it.label } </span>
								</g:radioGroup>
							</div>
							<div class="cell"><label>Attended:</label></div>
							<div class="cell">
								<g:radioGroup name="filter_wardrope_attended_stage2" values="['yes','no','any']" labels="['yes','no','any']" >
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
			<div class="display-options">
				<div class="data-table">
					<div class="row">
						<div class="cell"><label for="">View as:</label></div>
						<div class="cell">
							<select name="viewas" id="viewas">
								<option value="headshots">Headshots</option>
								<option value="summary">Summary</option>
								<option value="Detailed">Detailed</option>
								<option value="list">List Table</option>
							</select>
						</div>
						<div class="cell"><label for="">Sort as:</label></div>
						<div class="cell">
							<select name="sortby" id="sortby">
								<option value="castno">Casting Num</option>
								<option value="castname">Profile Name</option>
							</select>
						</div>
						<div class="cell"> <g:submitButton name="Submit" id="submit_stage2" class="submit"/></div>
					</div>
				</div>	
			</div>
			</g:formRemote>
</fieldset>