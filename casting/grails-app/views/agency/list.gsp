
<%@ page import="com.cland.casting.Agency" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agency.label', default: 'Agency')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
	<div id="status1" class="leftbar" role="complementary">		
	<g:render template="../layouts/sidenav-admin"></g:render>
	</div>
		<a href="#list-agency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-agency" class="content scaffold-list" role="main">
		
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
<div class="nav list-filter">
			<p style="font-weight: bold;">Filter</p>
			<ul>
				<li>View By:<select name="viewFilter">
				<option>Country</option>
				<option>Region</option>
				<option>City</option>
				</select></li>
				<li>Sort By:<select name="sortFilter">
				<option>Name</option>
				<option>Company</option>
				</select></li>
			
			<li>Search: <g:textField name="searchString" />
			<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
</div>			
			<table class="myTable">
				<thead>
					<tr>
					
						<th><g:message code="agency.company.label" default="Company" /></th>
						<th>Contact Person</th>
					     <th>Phone No.</th>
					     <th>Action</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${agencyInstanceList}" status="i" var="agencyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${agencyInstance.id}">${fieldValue(bean: agencyInstance, field: "company")}</g:link></td>
					<td>${agencyInstance.company?.contactPerson }</td>
					<td>${agencyInstance.company?.phoneNo }</td>
					<td class="list-action-buttons">
						<g:form>
						<fieldset class="buttons list_buttons">
							<g:hiddenField name="id" value="${agencyInstance?.id}" />
							<g:link class="edit" action="edit" id="${agencyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
					</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination" style="">
				<g:paginate total="${agencyInstanceTotal}" />
				<a href="#" class="first" data-action="first">&laquo;</a>
			    <a href="#" class="previous" data-action="previous"> &lsaquo;</a>               
			    <input type="text" readonly="readonly" />
			    <a href="#" class="next" data-action="next">&rsaquo;</a>
			    <a href="#" class="last" data-action="last">&raquo;</a>
			</div>
		</div>
<script type="text/javascript">
// when the page has finished loading.. execute the follow

$(document).ready(function() {
	$("#accordion" ).accordion({ active: cland_params.active_sidebar() });
	 /*$('.myTable tr').hide().filter(':lt(3)').show();
	    $('.pagination').jqPagination({
	      max_page : $('.myTable tr').length -1,
		  paged : function(page) {
	        $('.myTable tr:not(:first)').hide();
	        $($('.myTable tr')[page]).show();
	      }
	    }); */     	
	       
});  //end method ready(...)

</script>		
	</body>
</html>
