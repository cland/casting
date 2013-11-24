<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'categories', 'error')} ">

    <ul class="one-to-many">
        <table id="categories-table" data="{tableName:'categories'}">
            <thead>
                <tr>
                    <th data="{required:true, name:'name', placeholder:'Required'}">Category Name</th>                    
                    <th data="{editable:false}">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${productionInstance?.categories}" var="p" status="i">
                <tr rowId="${i}">
                    <td>${p.name}</td>
                    
                    <td><r:img class="deleteRowButton" dir='images' file='skin/database_delete.png'/></td>
                </tr>
                </g:each>
            </tbody>
        </table>

        <li class="add"><a id="addCategoryLink" href="#">Add Category</a></li>

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