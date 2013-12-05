function printableTabs() {
	$("#tabs").each(function() {
		var tabsforPrint = "";
		$(this).find(".ui-tabs-nav li a").each(function() {
			tabsforPrint = tabsforPrint + "<h2>" + $(this).html();
			+"</h2><br />";
			var a = $(this).attr('href');
			tabsforPrint = tabsforPrint + $(a).html() + "<br />";
		});
		$(this).html(tabsforPrint);
	});
} //end function printableTabs()

function setStyle(frmstyle,tostyle){
	var lnk = ($("link[media=screen]").attr("href"));
	$("link[media=screen]").attr({href : lnk.replace(frmstyle,tostyle)});
}
function printFriendly(){
	printableTabs();
	setStyle("main.css","print.css")
}
function printPage(){
	printableTabs();
	window.print();
}