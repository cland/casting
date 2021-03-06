<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Casting Site: Home</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
			@media print{
				#page-body {marging:0;}
			}
			.li-tick {padding:5px;list-style-position:inside;
			list-style-image:url('${fam.icon(name: 'accept')}');
			font-size:0.9em;
			margin-bottom:10px;
			}
			.data-table .cell {width:50%;font-size:0.9em;padding:2px}
			.data-table .cell div.staff {border:solid 1px #EB8F2A;padding:5px;height:180px;}
			legend {font-weight:bold;color:#FFAE2F;font-size:1.2em;}
			h1 {font-weight:bold;font-size:1.3em;}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="status1" class="leftbar" role="complementary">
			<h1>Noticeboard</h1>
			<ul>
				<li>Nothing today!</li>			
			</ul>
		</div>
		<div id="page-body" role="main">
			<g:if test="${params?.agencylinked == '0' }">
				<div class="errors">You are not linked to any agency. Please contact the administrator.</div>
			</g:if>
			<g:if test="${params?.clientlinked == '0' }">
				<div class="errors">You are not linked to any agency. Please contact the administrator.</div>
			</g:if>
			<h1>Home</h1>
			<div class="content float-left">
			<p>From the heart of one of the world's most beautiful cities, our talented, dedicated and hard-working casting team offers you: &nbsp;</p>
			<br/>
			<ul>
			<li class="li-tick"><b>Global connectivity</b> ---- A unique, web-based casting process that is simple, fast and cost effective</li>
			<li class="li-tick">
			<b>Minimal turn-around time</b> ---- Once we've completed your auditions we require minimal turn-around time before you're able to log-on and view your material from anywhere in the world
			</li>
			<li class="li-tick"><b>Control</b> ---- Create your own presentations, reflecting only your preferred cast</li>
			</ul>
			<br/>
			<p>WARNING ---- This new and exciting way of working can be addictive!</p>
			</div>
			<br/>
		</div>
	</body>
</html>
