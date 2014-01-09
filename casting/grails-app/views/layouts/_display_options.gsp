<div class="display-options no-print">
	<div class="data-table">
		<div class="row">
			<div class="cell"><label for=""><g:message code="default.viewas.label" default="View as" />:</label></div>
			<div class="cell">
				<g:select name="viewas" id="viewas_${stage }" value="${viewvalue }" 
				from="${['Headshots','Summary','Detailed','List Table'] }" 
				keys="${['headshots','summary','detailed','list']}"/>														
			</div>
			<div class="cell"><label for=""><g:message code="default.sortby.label" default="Sort by" />:</label></div>
			<div class="cell">
				<g:select name="sortby" id="sortby_${stage }" value="${sortvalue }" 
				from="${['Profile Name','Cast No'] }" 
				keys="${['castname','castno']}"/>
			</div>
			<div class="cell"> <g:submitButton name="Submit" id="submit_${stage }" class="submit action_wait"/></div>
		</div>
	</div>	
</div>