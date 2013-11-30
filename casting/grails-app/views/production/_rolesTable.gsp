<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'roles', 'error')} ">

    <ul class="one-to-many">
        <table id="roles-table" data="{tableName:'roles'}">
            <thead>
                <tr>
                    <th data="{required:true, name:'name', placeholder:'Required'}">Casting Role</th>
                    <th data="{required:true, name:'maxRequiredAuditionCount', placeholder:'', type:'intenger',cssClass:'field-small'}  ">Max</th>
                    <th data="{required:true, name:'mimRequiredAuditionCount', placeholder:'', type:'intenger',cssClass:'field-small'}">Min</th>
                    <th data="{required:true, name:'requiredCount', placeholder:'', type:'intenger',cssClass:'field-small'}">Required</th>
                    <th data="{required:false, name:'auditionDates', placeholder:'Dates', type:'intenger',cssClass:'field-small'}">Auditions</th>
                    <th data="{required:false, name:'callbackDates', placeholder:'Dates', type:'intenger',cssClass:'field-small'}">Callbacks</th> 
                    <th data="{required:false, name:'wardropeDates', placeholder:'Dates', type:'Date',cssClass:'field-small'}">Wardropes</th>
                    <th data="{required:false, name:'shootDates', placeholder:'Dates',cssClass:'field-small'}">Shoot</th>                   
                    <th data="{editable:false}">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${productionInstance?.roles}" var="p" status="i">
                <tr rowId="${i}">
                    <td>${p.name}</td>
                    <td>${p.maxRequiredAuditionCount}</td>
                    <td>${p.minRequiredAuditionCount}</td>
                    <td>${p.requiredCount}</td>
                    <td>${p.auditionDates}</td>
                    <td>${p.callbackDates}</td>
                    <td>${p.wardropeDates}</td>
                    <td>${p.shootDates}</td>
                    <td><r:img class="deleteRowButton" dir='images' file='skin/database_delete.png'/></td>
                </tr>
                </g:each>
            </tbody>
        </table>

        <li class="add"><a id="addRoleLink" href="#">Add Role</a></li>

    </ul>	
</div>

<r:script>
    $(function() {
        $.metadata.setType("attr", "data");

        $("#roles-table").writetable({
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
                $(row).parent().append("<input type='hidden' name='roles[" + rowId + "].deleted' value='true' />");
//                event.stopPropagation();
            }
        });

        $("#addRoleLink").click(function() {
            console.debug("in the click handler");
            $("#roles-table").writetable("addRow");
            return false;
        });

        $('img.deleteRowButton').on("click", function(event) {
            console.debug("in the deleteRowButton click handler");
            var target = $(event.target);
            var row = target.closest('tr');
            $('#roles-table').writetable('removeRow', event, row);
        });

    });
</r:script>