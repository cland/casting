<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main"/>
	<style>
		@page {
		    size: 6in 4in;  /* width height */
		    margin: 0.25in;
		}
		body{
			font-family: "Times New Roman",Georgia,Serif;
		}
		.name{
			font-size: 20pt;
		}
		.birthdate{
			font-size: 15pt;
		}
		
	</style>
</head>
<body>
  <div class="body">
  		<div id="show-candidate" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			
			<g:render template="tabs"/>
		
		</div>
  </div>
</body>
</html>