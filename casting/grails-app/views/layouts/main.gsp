<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="eLearning"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css" media="screen">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'print.css')}" type="text/css" media="print">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
			<!-- link rel="stylesheet" href="${resource(dir: 'css', file: 'fieldset.css')}" type="text/css" -->
<link rel="stylesheet"	href="${resource(dir:'css/south-street',file:'jquery-ui-1.10.3.custom.min.css')}" />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jqpagination.css')}" type="text/css">

		<g:layoutHead/>
		<r:require module="application" />
		<r:layoutResources />

		<style>
		/* Custom rules */
		.ui-jqgrid .ui-jqgrid-htable th div {
	height: auto;
	overflow: hidden;
	padding-right: 4px;
	padding-top: 2px;
	position: relative;
	vertical-align: text-top;
	white-space: normal !important;
}
.ui-jqgrid .ui-jqgrid-htable th {
    height: 32px;
    padding: 0 2px;
}
.ui-jqgrid .ui-jqgrid-view {
    font-size: 12px; 
}
		
.subgrid-data .ui-state-default { background:#768074;border:1px solid #ccc;}

.nav a.aboutus {
	background-image: url("${fam.icon(name:'information')}");
}

.nav a.newsevents {
	background-image: url("${fam.icon(name:'newspaper')}");
}
.nav a.cancel {
	background-image: url("${fam.icon(name:'cancel')}");
}
.nav a.login {
	background-image: url("${fam.icon(name:'door_in')}");
}
.nav a.logout {
	background-image: url("${fam.icon(name:'door_out')}");
}
.nav a.casting {
	background-image: url("${fam.icon(name:'table_multiple')}");
}
.nav a.print-button {
	background-image: url("${fam.icon(name:'printer')}");
}

@media print {
	.print-preview-only{display:none;}
}
		</style>
	</head>
	<body>
		<div class="print-preview-only">	
		<div class="float-right">
			<a href="#" class="print-button" onclick="printPage(false);return false;">
				<g:message code="default.print.label" />
			</a> |
			<a href="javascript:printFriendly(false);"  class="print-button">
				<g:message code="default.done.label" />
			</a>
		</div>
			<br/>
			<hr/>
			
		</div>
		<div id="appLogo" role="banner">
			<g:link controller="home" action="casting" class="casting">
				<img src="${resource(dir: 'images', file: 'logo.png')}" alt="Logo"/>
			</g:link>
			<span id="current-user">
				<label><span class="r-arrow"></span></label>
				<sec:ifLoggedIn><sec:loggedInUserInfo field="fullName" /></sec:ifLoggedIn>
				<sec:ifNotLoggedIn>Anonymous</sec:ifNotLoggedIn>			
			</span>
			
		</div>
		<g:render template="/layouts/navigator" />
		<g:layoutBody/>
		<g:render template="/layouts/footer" />
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
