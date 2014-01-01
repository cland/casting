<script type="text/javascript">
//<![CDATA[
var cland_params = {
		active_tab : function(){ if (${params.tab==null}) return 0; else return ${params.tab};},
		active_sidebar : function(){ if (${params.sidebar==null}) return 1; else return ${params.sidebar};},
		active_sidenav : '../layouts/sidenav-admin',
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