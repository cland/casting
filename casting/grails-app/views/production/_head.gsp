<script type="text/javascript">
//<![CDATA[
var cland_params = {
		active_tab : function(){ if (${params.tab==null}) return 0; else return ${params.tab};},
		active_casttab : function(){ if (${params.casttab==null}) return 0; else return ${params.casttab};},
		active_sidebar : function(){ if (${params.sidebar==null}) return 1; else return ${params.sidebar};},
		active_sidenav : '../layouts/sidenav-admin',
		this_id : ${productionInstance?.id ? productionInstance?.id : -1},
		production :{
			start_date : "${productionInstance?.startDate?.format('yyyy-MM-dd')}",
			end_date : "${productionInstance?.endDate?.format('yyyy-MM-dd')}",
			audition_dates :"${productionDates?.auditionDates*.format('yyyy-MM-dd')?.join(',')}",
			callback_dates :"${productionDates?.callbackDates*.format('yyyy-MM-dd')?.join(',')}",
			wardrobe_dates :"${productionDates?.wardrobeDates*.format('yyyy-MM-dd')?.join(',')}",
			shoot_dates : "${productionDates?.shootDates*.format('yyyy-MM-dd')?.join(',')}"		
		}
	}
//]]>
</script>