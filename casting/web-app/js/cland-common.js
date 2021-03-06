function printableTabs() {
	$("#tabs").each(function() {
		var tabsforPrint = "";
		$(this).find(".ui-tabs-nav li a").each(function() {
			tabsforPrint = tabsforPrint + "<h2>" + $(this).html();
			+"</h2><br />";
			var a = $(this).attr('href');
			tabsforPrint = tabsforPrint + $(a).html() + "<br />";
			
		});
		if(tabsforPrint != "") $(this).html(tabsforPrint);
	});
} //end function printableTabs()

function setStyle(frmstyle,tostyle){
	var lnk = ($("link[media=screen]").attr("href"));
	$("link[media=screen]").attr({href : lnk.replace(frmstyle,tostyle)});
}
function printFriendly(on,alltabs){
	if(on){
		if(alltabs) printableTabs();
		setStyle("main.css","print.css")
	}else{
		setStyle("print.css","main.css")
	}
}
function printPage(alltabs){
	if(alltabs) printableTabs();
	window.print();
}
function onChangeCompany(){
	var id = $("#company").val()
	var lnk = document.location.href
	lnk = lnk.substring(0,lnk.indexOf("?"))
	document.location.href = lnk + "?company.id=" + id
}
function onChangePerson(){
	var id = $("#person").val()
	var lnk = document.location.href
	lnk = lnk.substring(0,lnk.indexOf("?"))
	document.location.href = lnk + "?person.id=" + id
}
function getCurrentTabText(){
	return $("#tabs ul.ui-tabs-nav li.ui-tabs-selected").text()
}
function getCurrentTabLink(){
	return $("#tabs ul.ui-tabs-nav li.ui-tabs-selected a").attr("href")
}
function stageDisplay(stage){
	if(stage) stage = stage.toLowerCase()
	if(stage == "stage1"){		
		$(".vstage2_" + stage).hide();
		$(".vstage3_" + stage).hide();
		$(".vstage1_" + stage).show();
	}else if(stage == "stage2"){
		$(".vstage1_" + stage).hide();		
		$(".vstage3_" + stage).hide();
		$(".vstage2_" + stage).show();
	}else if(stage == "stage3"){
		$(".vstage1_" + stage).hide();		
		$(".vstage2_" + stage).hide();
		$(".vstage3_" + stage).show();
	}
	
	if($("#viewas_" + stage).attr("value") == "list"){
		$("#submit_" + stage + "_top").hide()
		$("#submit_" + stage + "_bottom").hide()
	}else{
		$("#submit_" + stage + "_top").show()
		$("#submit_" + stage + "_bottom").show()
	}
	$("#hidden_viewas_" + stage).attr("value",$("#viewas_" + stage).val())
	$("#hidden_sortby_" + stage).attr("value",$("#sortby_" + stage).val())
} // end function
var cland_datepickers = {
		reset_picker : function resetPicker(picker_id,altfield_id, type){
			$("#" + picker_id).multiDatesPicker('resetDates',type);
			$("#" + altfield_id).attr("value","")
		},
		init_datepicker : function initDatePicker(picker_id,altfield_id, frmdate, todate){
			var el = $("#" + picker_id)
			var altEl = $("#" + altfield_id)
			var datelist = altEl.attr("value")
			if(!frmdate) frmdate="+0";
			if(!todate) todate="+3M +5D";
			el.multiDatesPicker({
				dateFormat: "yy-mm-dd",
				altField: '#' + altfield_id,			
				altFormat:"yy-mm-dd",
				minDate:frmdate,
				maxDate:todate
				//beforeShowDay: $.datepicker.noWeekends
				//maxPicks: 1		
			});
			if(datelist) {
				altEl.attr("value",datelist)
				datelist = datelist.split(",");			
				el.multiDatesPicker('addDates',datelist);
			}	
		},
		init_datepicker_single_future : function initDatePickerSingleFuture(picker_id,fmt, frmdate, todate){
			var el = $(picker_id)
			var datelist = el.attr("value")
			if(!frmdate) frmdate="+0";
			if(!todate) todate="+3M +5D";
			el.multiDatesPicker({
				dateFormat: fmt,
				minDate:frmdate,
				maxDate:todate,
				maxPicks: 1
			});

			if(datelist) {
				el.attr("value",datelist)
				datelist = datelist.split(",");			
				el.multiDatesPicker('addDates',datelist);
			}
	
			
		},init_datepicker_single_past : function initDatePickerSinglePast(picker_id,fmt,frmdate,todate){
			var el = $(picker_id)
			var datelist = el.attr("value")
			if(!frmdate) frmdate="-100y";
			if(!todate) todate="+0";
			$(picker_id).multiDatesPicker({
				dateFormat: fmt,
				maxDate:todate,
				maxPicks: 1
			});

			if(datelist) {
				el.attr("value",datelist)
				datelist = datelist.split(",");			
				el.multiDatesPicker('addDates',datelist);
			}	
		},
		init_datepicker_single_dob : function initDatePickerSingleDob(picker_id,fmt,frmdate,todate){
			var el = $(picker_id)
			var datelist = el.attr("value")
			if(!frmdate) frmdate="-100y";
			if(!todate) todate="+0";
			$(picker_id).multiDatesPicker({
				dateFormat: fmt,
				maxDate:todate,
				defaultDate: "-18y",
				maxPicks: 1
			});

			if(datelist) {
				el.attr("value",datelist)
				datelist = datelist.split(",");			
				el.multiDatesPicker('addDates',datelist);
			}	
		},
		
		init_datepicker_single_standard : function initDatePickerSingleStandard(picker_id,fmt,frmdate,todate,default_date){
			var el = $(picker_id)
			var datelist = el.attr("value")
			if(!frmdate) frmdate="-100y";
			if(!todate) todate="+0";
			if(!default_date) default_date="+0"
			$(picker_id).multiDatesPicker({
				dateFormat: fmt,
				maxDate:todate,
				defaultDate: default_date,
				maxPicks: 1
			});

			if(datelist) {
				el.attr("value",datelist)
				datelist = datelist.split(",");			
				el.multiDatesPicker('addDates',datelist);
			}	
		}		
} //end cland_datepicker