<div class="fieldcontain ${hasErrors(bean: castingProfileInstance, field: 'ratings', 'error')} ">

    <ul class="one-to-many">
        <table id="ratings-table" data="{tableName:'ratings'}">
            <thead>
                <tr>
                    <th data="{required:true, name:'rating',type:'intenger',cssClass:'field-small'}">Rating</th>
                    <th data="{required:false, name:'comments' } ">Comments</th>
                    <th data="{required:true,name:'createdBy', editable:false}">Rating by</th>
                    <th data="{editable:false}">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${castingProfileInstance?.ratings}" var="p" status="i">
                <tr rowId="${i}">
                    <td>${p.rating}</td>
                    <td>${p.comments}</td>
                    <td>${com.cland.casting.User.get(p?.createdBy) }</td>
                    <td>
                    <g:if test="${isEditing }">
                    <r:img class="deleteRowButton" dir='images' file='skin/database_delete.png'/>
                    </g:if>
                    </td>
                    
                </tr>
                </g:each>
            </tbody>
        </table>

		<g:if test="${isEditing }">
        <li class="add"><a id="addRatingLink" href="#">Rate this profile</a></li>
        </g:if>
    </ul>
</div>
<r:script>
var ratingTable = {
		init : function(){ 
		var _list_name = "ratings" 
    	var _tableid = "#" + _list_name + "-table"
    	var _addBtn_id = "#addRatingLink"
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
ratingTable.init()
</r:script>