<%@ page import="com.cland.casting.SystemRoles" %>
<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'portfolios', 'error')} ">

    <ul class="one-to-many">
        <table id="portfolios-table${isEditing==false ? '-view' : '' }" data="{tableName:'portfolios'}">
            <thead>
                <tr>
                    <th data="{required:true, name:'name', placeholder:'Required'}">Name</th>
                    <th data="{required:false, name:'comments' } ">Description</th>                    
                    <th data="{editable:false}">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${productionInstance?.portfolios}" var="p" status="i">
                <tr rowId="${i}">
                	<g:if test="${isEditing==true }">
                		<td>${p.name }</td>
                	</g:if>
                	<g:else>
	                    <td>
	                    	<g:link class="show" action="show" controller="portfolio" id="${p?.id}">${p.name}</g:link>
	                    </td>
                    </g:else>
                    <td>${p.comments}</td>
                    <td>
                    <g:if test="${isEditing }"><r:img class="deleteRowButton" dir='images' file='skin/database_delete.png'/></g:if>
                    </td>
                </tr>
                </g:each>
            </tbody>
        </table>
  
    </ul>
		<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
		<br/> <div class="add  action-link">
	       <g:if test="${isEditing }"><a id="addPortfolioLink" href="#">Add Portfolio</a></g:if>
	        <g:else>
	        	<g:link class="create" action="create" controller="portfolio" params="${['production.id':productionInstance?.id]}">Add Portfolio</g:link>
	        </g:else>
	        </div>
        </sec:ifAnyGranted>    
  
</div>
<r:script>
var portfolioTable = {
		init : function(){ 
		var _list_name = "portfolios" 
    	var _tableid = "#" + _list_name + "-table"
    	var _addBtn_id = "#addPortfolioLink"
        $.metadata.setType("attr", "data");

        $(_tableid).writetable({
            autoAddRow: false,
            rowAdded: function( event, row ) {
                console.debug("in the rowAdded callback");
                $(row).children("td").last().append('<r:img class="deleteRowButton" dir="images" file="skin/database_delete.png"/>');
            },
            rowSelected: function(event, row) {
                console.debug("in the rowSelected callback");
            },
            rowRemoved: function(event, row) {
                console.debug("in the rowRemoved callback handler");
                var rowId =  $(row).attr('rowId');
                $(row).parent().append("<input type='hidden' name='" + _list_name + "[" + rowId + "].deleted' value='true' />");
//                event.stopPropagation();
            }
        });

        $(_addBtn_id).click(function() {
            console.debug("in the click handler");
            $(_tableid).writetable("addRow");
            return false;
        });

        $('img.deleteRowButton').on("click", function(event) {
            console.debug("in the deleteRowButton click handler");
            var target = $(event.target);
            var row = target.closest('tr');
            $(_tableid).writetable('removeRow', event, row);
        });
		}
	}
portfolioTable.init()
</r:script>