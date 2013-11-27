<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Casting: Administration Panel</title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">
				<span class="r-arrow"></span> <span class="current-crump">
					Administration Panel
				</span>
		</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:render template="../layouts/sidenav-admin"></g:render>
    </div>	
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" class="content scaffold-show" role="main">
			<h1>Admin Panel</h1>
			
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow

$(document).ready(function() {		
	$("#accordion" ).accordion({ active: cland_params.active_sidebar() });

	//Main tabs	
	$("#tabs").tabs(
			{
				active:cland_params.active_tab(),
				create: function (event,ui){	
					//executed after is created								
					$('#tabs').show()
				},
				show: function(event,ui){
					//on every tabs clicked
				},
				beforeLoad : function(event, ui) {
					ui.jqXHR.error(function() {
						ui.panel
						.html("Couldn't load this tab. We'll try to fix this as soon as possible. ");
					});
				}
		});
	
});  //end method ready(...)

</script>		
	</body>
</html>
