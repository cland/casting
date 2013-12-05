modules = {
    application {
        dependsOn 'jquery, jquery-ui'
        resource url:'js/application.js'
        resource url:'js/jquery.metadata.js'
        resource url:'js/jquery.ui.writetable.js'
		resource url: 'js/jquery.jqGrid.min.js'
		resource url: 'js/jquery.jqpagination.min.js'
		resource url: 'js/jquery-ui.multidatespicker.js'
		resource url: 'js/cland-common.js'
    }
//	jquerymin{
//		resource url: 'js/jquery-1.9.1.js', disposition: 'head'
//	}
//	jquerygrid{
//		resource url: 'js/jquery.jqGrid.min.js', disposition: 'head'
//	}
//	jquerygridlocale{
//		resource url: 'js/i18n/grid.locale-en.js', disposition: 'head'
//	}
//	
//	jqueryuilatest{
//		resource url: 'js/jquery-ui-1.10.3.custom.min.js', disposition: 'head'
//	}
}