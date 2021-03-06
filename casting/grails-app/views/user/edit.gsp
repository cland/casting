<%@ page import="com.cland.casting.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<g:render template="head"></g:render>
	</head>
	<body>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="user" action="list">Users</g:link>
				<span class="r-arrow"></span> <span class="current-crump">
					User: ${userInstance }
				</span>
		</div>	
	<div id="status1" class="leftbar" role="complementary">
         <g:sideMenu default=""></g:sideMenu> 
    </div>	
		<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:uploadForm method="post" >
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:uploadForm>
		</div>
<script>
  $(document).ready(function() {
		$(".datepicker-reset").live("click",function(){
			cland_datepickers.reset_picker($(this).attr("picker"),$(this).attr("altfield"), 'picked')
		});
	  $("#accordion" ).accordion({ active: cland_params.active_sidebar() });
	  cland_datepickers.init_datepicker_single_dob("#birth-date","dd-M-yy");
  });
  function after(res){
	  alert (res)
	}
	function before(){
		alert("before submit")
	}
	function loadOrganisations(){
		${ g.remoteFunction(action : 'orgOptions',controller : 'user',update:'testco',params: 'java=' + script)} 
	}
  function addOrganisation(){

	  	 var $dialog = $('<div></div>')
    
                 .load('../../organisation/dialogcreate')
                 .dialog({
                     autoOpen: false,
                     width:450,
                     beforeClose: function(event,ui){
                     	
                     },
                     close: function(event){     
                     	loadOrganisations()
                     },
                     title: 'New Organisation'                         
                 });
                     
        $dialog.dialog('open');
	  }
  </script>		
	</body>
</html>
