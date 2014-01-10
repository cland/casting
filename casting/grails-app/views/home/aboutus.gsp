<%@ page import="com.cland.casting.SystemRoles" %>
<%@ page import="com.cland.casting.User" %>
<g:set var="hostOrg" value="${ com.cland.casting.Organisation.find{isHost==true}}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Casting Site: About us</title>
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
			.data-table .cell {width:50%;font-size:0.9em;padding:20px;vertical-align:top;}
			.data-table .cell div.staff {border:solid 1px #EB8F2A;padding:5px;height:290px; text-align:center;}
			legend {font-weight:bold;color:#FFAE2F;font-size:1.2em;}
			h1 {font-weight:bold;font-size:1.3em;}
			.caption {padding:5px;}
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
			<h1>About us</h1>
			<div class="content">
			<p>
			Jeanne began her career in the film industry as a film editor and line producer before starting Casting Cape Town, which in the 8 years since its inception, has developed a reputation for producing excellent work .
			<br><br>This success is largely due to Jeanne’s knack for talent-spotting, which has helped her to surround herself with an awesome team of associates, freelancers and assistants who all bring their own unique sensibility to the casting process.
			<br><br>
			</p>
			<p align="center" style="padding-left:0px; font-size:12pt">
			<strong>"Lead with your talent"</strong>
			</p>
			
			<fieldset id="contactus"><legend>Contact us</legend>
			
				<div class="content float-left" style="width:100%;">
				<p style="width:100%;margin:0;">
				You will find us at the top of St George's Mall in Cape Town's city centre, where we are surrounded by 5-star boutique hotels, flea-markets, sidewalk cafes and trendy night spots.<br><br>After a hard day's work in our spacious and comfortable, airconditioned studios, enjoy the best relaxation and entertainment Cape Town has to offer, right on our doorstep.
				</p>
				<p>
				<g:set value="${ hostOrg?.phoneNo?.split(',')}" var="phoneList"/>
				<b>T:</b> ${ phoneList?.find{true}}<br>
				<b>F:</b><g:if test="${phoneList?.size() >= 2 }">  ${phoneList?.getAt(1)}</g:if><br>
				<b>M:</b><g:if test="${phoneList?.size() >= 3 }">  ${phoneList?.getAt(2)}</g:if><br>
				<b>E:</b> <a href="mailto:${ hostOrg?.email}">${ hostOrg?.email}</a>
				</p>
				</div>
			</fieldset>
			<fieldset id="team"><legend>Meet The Team</legend>
			<g:set var="data_table" value=""/>
			<g:set var="tmp" value=""/>
			<g:set var="staffList" value="${ hostOrg?.staff}"/>
			<g:set var="count_per_row" value="${2 }"/>
			<g:set var="total_count" value="${staffList?.size() }"/>
			<div class="data-table">
			<g:each in="${ staffList?.sort{it.id}}" var="userInstance" status="i">
				<g:set var="thisUser" value="${ User.get(userInstance.id)}"/>
				<g:set var="entry">
					<div class="cell">
						<div class="staff">			
						<g:set var="hasphoto" value="${false }"/>			
							<attachments:each bean="${thisUser}" inputName="headshot" status="k">	
							<g:set var="hasphoto" value="${true }"/>
								<div class="photo-display" style="border:none;margin-bottom:1.5em;">
									<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/>															
								</div>	
								<g:if test="${k%2==0 & k!=0 }"><br/></g:if>
							</attachments:each>	
							<g:if test="${!hasphoto }">
								<div class="photo-display" style="border:none;margin-bottom:1.5em;"><img src="../images/noimage.gif"/></div>
							</g:if>		
							<b>${userInstance}</b><br/>
							<span class="caption"> ${thisUser?.caption}</span>
							<br/>		
						</div>
					</div>
				</g:set>
				
				<g:set var="tmp" value="${tmp } ${entry }"/>

						<g:if test="${((i+1)%count_per_row) ==0 }">
							<g:set var="data_table">
								<div id="row-${i}" class="staff-row">
									${tmp }
								</div>
							</g:set>
							<g:set var="tmp" value="" />
						</g:if>
						<!-- Add the last bit -->
						<g:if test="${(total_count == (i+1)) & tmp != "" }">
							<g:set var="data_table">
								${data_table }
								<div id="row-${i}" class="staff-row">
									${tmp }
								</div>
							</g:set>
						</g:if>
				</g:each>
				${data_table }
				
			</div>
			</fieldset>
			<fieldset id="facilities"><legend>Our Studio</legend>
			<g:each in="${com.cland.casting.Image.withCriteria{
				isNotEmpty("locations")				
				}
					
			}" var="imageInstance">
			<g:if test="${imageInstance.locations?.contains("studio")}">
			<attachments:each bean="${imageInstance}" inputName="image" status="k">	
					<div class="photo-display float-left" style="border:none;margin-bottom:1.5em;">
					<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
					<span class="caption">${imageInstance?.caption }</span>							
					</div>	
						<g:if test="${k%2==0 & k!=0 }"><br/></g:if>
					
					</attachments:each>			
			<br/>
			</g:if>			
			</g:each>
			
			</fieldset>
			
			<br/>
<%--	example youtube video: 		<g:video videoKey="wyUsWVMukT0"/>--%>
			<br/>
		</div>
		</div>
	</body>
</html>
