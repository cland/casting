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
function onChangeCompany(){
	var id = $("#company").val()
	var lnk = document.location.href
	lnk = lnk.substring(0,lnk.indexOf("?"))
	document.location.href = lnk + "?company.id=" + id
}