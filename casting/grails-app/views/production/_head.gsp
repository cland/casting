<script type="text/javascript">
//<![CDATA[
var cland_params = {
		active_tab : function(){ if (${params.tab==null}) return 0; else return ${params.tab};},
		active_casttab : function(){ if (${params.casttab==null}) return 0; else return ${params.casttab};},
		active_sidebar : function(){ if (${params.sidebar==null}) return 1; else return ${params.sidebar};},
		active_sidenav : '../layouts/sidenav-admin',
		this_id : ${productionInstance?.id ? productionInstance?.id : -1}
	}
//]]>
</script>