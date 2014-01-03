<%@ page import="com.cland.casting.SystemRoles" %>
<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'categories', 'error')} ">

    <ul class="one-to-many">
        <table id="categories-table${isEditing==false ? '-view' : '' }" data="{tableName:'categories'}">
            <thead>
                <tr>
                    <th data="{required:true, name:'name', placeholder:'Required'}">Category Name</th>                    
                    <th data="{editable:false}">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${productionInstance?.categories}" var="p" status="i">
                <tr rowId="${i}">
                    <td><g:link class="show" action="show" controller="castingCategory" id="${p?.id}">${p.name}</g:link></td>    
                    <td>
                    <sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
                    	<g:if test="${isEditing == true }"><r:img class="deleteRowButton" dir='images' file='skin/database_delete.png'/></g:if>
                    	<g:link class="edit" action="edit" controller="castingCategory" id="${p?.id}"><g:if test="${isEditing == false }">
                    		<r:img class="editRowButton" dir='images' file='skin/database_edit.png'/></g:if>
                    	</g:link>
                    </sec:ifAnyGranted>
                    </td>
                </tr>
                </g:each>
            </tbody>
        </table>
		<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
	        <g:if test="${isEditing == true }">
	        	<br/><div class="add float-left action-link"><a id="addCategoryLink" href="#">Add Category</div></li>
	        </g:if>
	        <g:else>
	        	<g:link class="create float-right" action="create" controller="castingCategory" params="${['production.id':productionInstance?.id]}">Add Category</g:link>
	        </g:else>
		</sec:ifAnyGranted>
    </ul>
</div>

<r:script>

var categoriesTable = {
		init : function(){ 
		var _list_name = "categories" 
    	var _tableid = "#" + _list_name + "-table"
    	var _addBtn_id = "#addCategoryLink"
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
categoriesTable.init()
</r:script>