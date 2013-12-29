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

var cland_datepickers = {
		reset_picker : function resetPicker(picker_id,altfield_id, type){
			$("#" + picker_id).multiDatesPicker('resetDates',type);
			$("#" + altfield_id).attr("value","")
		},
		init_datepicker : function initDatePicker(picker_id,altfield_id){
			var el = $("#" + picker_id)
			var altEl = $("#" + altfield_id)
			var datelist = altEl.attr("value")
			el.multiDatesPicker({
				dateFormat: "yy-mm-dd",
				altField: '#' + altfield_id,			
				altFormat:"yy-mm-dd",
				minDate:"+0",
				maxDate:"+3M +5D"
				//beforeShowDay: $.datepicker.noWeekends
				//maxPicks: 1		
			});
			if(datelist != "") {
				altEl.attr("value",datelist)
				datelist = datelist.split(",");			
				el.multiDatesPicker('addDates',datelist);
			}	
		},
		init_datepicker_single_future : function initDatePickerSingleFuture(picker_id,fmt){
			var el = $(picker_id)
			var datelist = el.attr("value")
			$(picker_id).multiDatesPicker({
				dateFormat: fmt,
				minDate:"+0",
				maxDate:"+3M +5D",
				maxPicks: 1
			});

			if(datelist != "") {
				el.attr("value",datelist)
				datelist = datelist.split(",");			
				el.multiDatesPicker('addDates',datelist);
			}	
		},init_datepicker_single_past : function initDatePickerSinglePast(picker_id,fmt){
			var el = $(picker_id)
			var datelist = el.attr("value")
			$(picker_id).multiDatesPicker({
				dateFormat: fmt,
				maxDate:"+0",
				maxPicks: 1
			});

			if(datelist != "") {
				el.attr("value",datelist)
				datelist = datelist.split(",");			
				el.multiDatesPicker('addDates',datelist);
			}	
		},
		init_datepicker_single_dob : function initDatePickerSingleDob(picker_id,fmt){
			var el = $(picker_id)
			var datelist = el.attr("value")
			$(picker_id).multiDatesPicker({
				dateFormat: fmt,
				maxDate:"+0",
				defaultDate: "-18y",
				maxPicks: 1
			});

			if(datelist != "") {
				el.attr("value",datelist)
				datelist = datelist.split(",");			
				el.multiDatesPicker('addDates',datelist);
			}	
		}
} //end cland_datepicker