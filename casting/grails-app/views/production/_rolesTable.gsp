<%@ page import="com.cland.casting.SystemRoles" %>
<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'roles', 'error')} ">

    <ul class="one-to-many">
    	<g:if test="${isEditing==true}">
        <table id="roles-table${isEditing==false ? '-view' : '' }" data="{tableName:'roles'}">
            <thead>
                <tr>
                    <th data="{required:true, name:'name', placeholder:'Required'}">Casting Role</th>
                    <th data="{required:true, name:'maxRequiredAuditionCount', placeholder:'', type:'intenger',cssClass:'field-small'}  ">Max</th>
                    <th data="{required:true, name:'minRequiredAuditionCount', placeholder:'', type:'intenger',cssClass:'field-small'}">Min</th>
                    <th data="{required:true, name:'requiredCount', placeholder:'', type:'intenger',cssClass:'field-small'}">Required</th>
                                    
                    <th data="{editable:false}">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${productionInstance?.roles}" var="p" status="i">
                <tr rowId="${i}">
                    <td><g:link class="show" action="show" controller="castingRole" id="${p?.id}">${p.name}</g:link></td>
                    <td>${p.maxRequiredAuditionCount}</td>
                    <td>${p.minRequiredAuditionCount}</td>
                    <td>${p.requiredCount}</td>
                    <td>
						<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
	                    	<g:if test="${isEditing == true }"><r:img class="deleteRowButton" dir='images' file='skin/database_delete.png'/></g:if>
	                    	<g:link class="edit" action="edit" controller="castingRole" id="${p?.id}"><g:if test="${isEditing == false }">
	                    		<r:img class="editRowButton" dir='images' file='skin/database_edit.png'/></g:if>
	                    	</g:link>
	                    </sec:ifAnyGranted>
                    </td>
                </tr>
                </g:each>
            </tbody>
        </table>
        </g:if>
        <g:else>
       		<g:each in="${productionInstance?.roles}" var="p" status="i">
       			<div id="role-${p.id } class="role-view">
	       			<div id="role-header-section">Role: ${p.name }</div>
	                <!-- add admin related stuff only -->
	                <div id="role-admin-section">
	                	<table>
		       				<tr><th>Agencies Allowed</th><th>Required</th><th>Min</th><th>Max</th></tr>
		       				<tr><td>Base Inc</td><td>20</td><td>15</td><td>1</td></tr>	                	
	                	</table>
	                </div>	       			
	       			<div id="role-userview-section">
		       			<table>
		       				<tr><th>Audition Dates</th><th>Callback Dates</th><th>Wardrope Dates</th><th>Shoot Dates</th></tr>
		       				<tr><td>20 Dec 2013</td><td>20 Dec 2013</td><td>20 Dec 2013</td><td>20 Dec 2013</td></tr>
		       				<tr><td colspan="4">Description</td></tr>
		       				<tr><td colspan="4">p.description</td></tr>
		       				<tr><td colspan="4">Fees</td></tr>
		       				<tr><td>Day Fee:</td><td colspan="3">p.dayfee</td></tr>
		       				<tr><td>Fee Notes:</td><td colspan="3">p.feeNotes</td></tr>       					             
		                </table>
	                </div>

                </div>
              </g:each>
        </g:else>
    
		<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
	        <g:if test="${isEditing == true }"><li class="add float-right"><a id="addRoleLink" href="#">Add Role</a></li></g:if>
	        <g:else>
	        	<g:link class="create float-right" action="create" controller="castingRole" params="${['production.id':productionInstance?.id]}">Add Role</g:link>
	        </g:else>
        </sec:ifAnyGranted>
        

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