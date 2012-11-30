
<!--Tools/act_forceplanner.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I process the forceplanner data entries.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->

<cfset variables.requested_sum=0>
<cfset variables.total_requested=get_week_days.hours_in_month*get_subordinates.recordcount>
<cfset variables.task_processed="">
</cfsilent>
<cfoutput>
<script language="JavaScript">
function ReleaseRowFields(arg, arg1) {
	switch(arg) {<cfloop query="get_prospectives">
	<cfif NOT listFind(variables.task_processed,task_id)>
	<cfset variables.task_processed=listappend(variables.task_processed,task_id)>
	<cfset variables.requested_sum=variables.requested_sum+budget>
	<cfif comparenocase(fuseaction, "forceplanner_save")>
	case "accept_#task_id#":
		if ( !$('##'+arg).is(':checked') ) {
			if (confirm('This task must be assigned before you can allocate time or modify the due date.\nWould you like to assign it now?')) {
				document.form_forceplanner.accept_#task_id#.checked=1;
				CalculateRowFields(arg, arg1);
			}
			else {<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
				document.form_forceplanner.t#task_id#_#variables.user_account_id#.blur();</cfloop>
			}
		}
		return;
		break;
	</cfif>
	</cfif>
	</cfloop>}
}

<cfset variables.task_processed="">
function CalculateRowFields(arg, arg1){
	"use strict"; //let's avoid tom-foolery in this function
	switch(arg) {
		<cfloop query="get_prospectives"><cfif NOT listFind(variables.task_processed,task_id)><cfset variables.task_processed=listappend(variables.task_processed,task_id)>
		case "accept_#task_id#":		
			var task_assigned#task_id#=<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">parseInt(document.form_forceplanner.t#task_id#_#variables.user_account_id#.value,10) + </cfloop>0;
			document.form_forceplanner.task_assigned#task_id#.value=task_assigned#task_id#;
			$('##display_task_assigned#task_id#').text(task_assigned#task_id#);
		
			var task_remainder#task_id#=#budget#-task_assigned#task_id#;
			document.form_forceplanner.task_remainder#task_id#.value=task_remainder#task_id#;
			$('##display_task_remainder#task_id#').text(task_remainder#task_id#);
			break;
		</cfif></cfloop>
	}
	
	switch(arg1) {
	<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
		<cfset variables.task_processed="">
		case "e_#variables.user_account_id#":
			var sum_#variables.user_account_id#=<cfloop query="get_prospectives"><cfif NOT listFind(variables.task_processed,task_id)><cfset variables.task_processed=listappend(variables.task_processed,task_id)>parseInt(document.form_forceplanner.t#task_id#_#variables.user_account_id#.value,10) + </cfif></cfloop>0;

			document.form_forceplanner.sum_#variables.user_account_id#.value=sum_#variables.user_account_id#;
		
			var capacity_#variables.user_account_id#=Math.ceil(sum_#variables.user_account_id#/#get_week_days.hours_in_month#*100) + '%';
			document.form_forceplanner.capacity_#variables.user_account_id#.value=capacity_#variables.user_account_id#;
		
			var sum_assigned=<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">parseInt(document.form_forceplanner.sum_#variables.user_account_id#.value,10) + </cfloop>0;
			document.form_forceplanner.sum_assigned.value=sum_assigned;
		
			var sum_remaining=#requested_sum#-sum_assigned;
			document.form_forceplanner.sum_remaining.value=sum_remaining;
		
			var capacity_assigned=Math.ceil(sum_assigned/#variables.total_requested#*100) + '%';
			document.form_forceplanner.capacity_assigned.value=capacity_assigned;
		
			var capacity_remaining=Math.ceil(sum_remaining/#variables.total_requested#*100) + '%';
			document.form_forceplanner.capacity_remaining.value=capacity_remaining;

			break;
	</cfloop>
	return;
	}
}

<cfset variables.task_processed="">
function ReCalculate(arg){
	"use strict"; //let's avoid tom-foolery in this function
	switch(arg) {
		<cfloop query="get_prospectives"><cfif NOT listFind(variables.task_processed,task_id)><cfset variables.task_processed=listappend(variables.task_processed,task_id)>
		case "accept_#task_id#":
			if ( $('##'+arg).is(':checked') ) {
				//remove read-only attribute from employee hours assignment fields
				$('##'+arg).parents('tr').find('input.number').removeAttr('readonly').each(function() {
					$(this).val( $(this).attr('data_value') );
				});
				//assign default budget for each team member (generally this means giving the task owner all the requested hours)
				<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
				CalculateRowFields(arg,'e_#variables.user_account_id#');</cfloop>
			}
			else {
				//assign checkbox is unchecked, so make employee hours assignment fields read-only and set data_value of field to value of the field, then set value of field to 0
				$('##'+arg).parents('tr').find('input.number').attr('readonly','readonly').each(function() {
					$(this).attr( 'data_value', $(this).val() );
				}).val(0);<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
				CalculateRowFields(arg,'e_#variables.user_account_id#');</cfloop>
			}
			break;
		</cfif></cfloop>
	}
	return arg;
}

var adjustColumnWidths=function() {
<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
	$('th.th_#variables.user_account_id#').width( $('th.th_#variables.user_account_id#').width() );</cfloop>
<cfloop list="requested_hours,assigned_hours,remaining_hours" index="variables.th_class">
	$('th.#variables.th_class#').width( $('th.#variables.th_class#').width() );</cfloop>
	return true;
}
</script>

<cfsavecontent variable="variables.forceplanner_subordinates">
	<cfloop query="get_subordinates">
		<th class="th_#user_account_id#"><abbr title="#first_name# #last_name#">#initials# <a href="javascript:list_to_employee();" title="View employee's details"><i class="icon-user"></i></a></abbr></th>
	</cfloop>
</cfsavecontent>
</cfoutput>

