<%@ page import="com.cland.casting.SystemRoles" %>
<div class="fieldcontain ${hasErrors(bean: productionInstance, field: 'roles', 'error')} ">

    	<g:if test="${isEditing==true}">
    	 <ul class="one-to-many">
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
                <g:each in="${rolesList}" var="p" status="i">
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
        </ul>
        </g:if>
        <g:else>
       		<g:each in="${rolesList}" var="p" status="i">
       			<div id="role-${p.id }" class="role-view">
	       			<div id="role-header-section-${p.id }" class="role-header-section">
	       				Role: <g:link class="show" action="show" controller="castingRole" id="${p?.id}">${p.name}</g:link>
	       				<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
		       				<div id="role-edit_buttons-${p.id }" class="role-edit_buttons">		       					
		                    	<g:if test="${isEditing == true }"><r:img class="deleteRowButton" dir='images' file='skin/database_delete.png'/></g:if>
		                    	<g:link class="edit" action="edit" controller="castingRole" id="${p?.id}"><g:if test="${isEditing == false }">
		                    		<r:img class="editRowButton" dir='images' file='skin/database_edit.png'/></g:if>
		                    	</g:link>	                    	
		       				</div>
	       				</sec:ifAnyGranted>
	       			</div>
	                <!-- add admin related stuff only -->
	                <sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
		                <div id="role-admin-section-${p.id }" class="role-admin-section">
		                	<table>
			       				<tr><th>Agencies Allowed</th><th>Required</th><th>Min</th><th>Max</th></tr>
			       				<tr><td>Base Inc</td><td>${p.requiredCount}</td><td>${p.maxRequiredAuditionCount}</td><td>${p.minRequiredAuditionCount}</td></tr>	                	
		                	</table>
		                </div>	 
	                </sec:ifAnyGranted>
	       			<div id="role-userview-section-${p.id }" class="role-userview-section">
		       			<table>
		       				<tr><th>Audition Date(s)</th><th>Callback Date(s)</th><th>Wardrobe Date(s)</th><th>Shoot Date(s)</th></tr>
		       				<tr>
		       					<td class="td-audition-dates">
			       					<g:each in="${p?.auditionDates?.sort()}" var="d">
			            			<span class=""><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
			            			</g:each>
								</td>
		       					<td class="td-callback-dates">
			       					<g:each in="${p?.callbackDates?.sort()}" var="d">
			            			<span class=""><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
			            			</g:each>		       					
								</td>
		       					<td  class="td-wardrobe-dates">  					
		       						<g:each in="${p?.wardrobeDates?.sort()}" var="d">
			            			<span class=""><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
			            			</g:each>
			            		</td>
		       					<td  class="td-shoot-dates">
			       					<g:each in="${p?.shootDates?.sort()}" var="d">
			            			<span class=""><g:formatDate date="${d}" format="dd-MMM-yyyy"/></span><br/>
			            			</g:each>
		       					</td>
		       				</tr>
		       				<tr><td colspan="4">&nbsp;</td></tr>
		       				<tr><td colspan="4" class="td-section-head">Description</td></tr>
		       				<tr><td colspan="4">${p?.description == "" ? 'No Description' : p.description }</td></tr>
		       				<tr><td colspan="4" class="td-section-head">Fees</td></tr>
		       				<tr><td>Day Fee:</td><td colspan="3">${p.dayfee}</td></tr>
		       				<tr><td>Fee Notes:</td><td colspan="3">${p.feeNotes}</td></tr>       					             
		                </table>
	                </div>

                </div>
              </g:each>
        </g:else>
    
		<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
	        <g:if test="${isEditing == true }"><br/><div class="add float-left action-link"><a id="addRoleLink" href="#">Add Role</a></div></g:if>
	        <g:else>
	        	<g:link class="create float-right" action="create" controller="castingRole" params="${['production.id':productionInstance?.id]}">Add Role</g:link>
	        </g:else>
        </sec:ifAnyGranted>
        

    	
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