
<%@ page import="com.cland.casting.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div class="bread-crump">
				<span class="r-arrow"></span> <span class="current-crump">
					User List
				</span>
		</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:sideMenu default=""></g:sideMenu> 
    </div>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-user" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>					
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
											
					
						<g:sortableColumn property="firstName" title="${message(code: 'user.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'user.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="contactNo" title="${message(code: 'user.contactNo.label', default: 'Contact No.')}" />
						<th>${message(code: 'user.role.label', default: 'Role')} </th>
						<g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:if test="${userInstance?.username}">
							<g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link>
						</g:if><g:else><g:link action="show" id="${userInstance.id}">Undefined</g:link></g:else>
						</td>					
						<td>${fieldValue(bean: userInstance, field: "firstName")}</td>					
						<td>${fieldValue(bean: userInstance, field: "lastName")}</td>					
						<td>${fieldValue(bean: userInstance, field: "contactNo")}</td>
						<td>${com.cland.casting.UserRole.findByUser(userInstance)?.role}</td>					
						<td><g:formatBoolean boolean="${userInstance?.enabled }"/>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceTotal}" />
			</div>
		</div>
<script>
  $(document).ready(function() {
	  $("#accordion" ).accordion({ active: cland_params.active_sidebar() });
	 // $("#add_org").live("click",function(){
	//	  addOrganisation();
	//	});
  });
 </script>		
	</body>
</html>
