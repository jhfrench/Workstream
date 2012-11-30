
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
</cfsilent>
<cfoutput>
<script language="JavaScript">
var ReleaseRowFields=function(task_id) {
	"use strict"; //let's avoid tom-foolery in this function
	
	switch(task_id) {<cfloop query="get_prospectives">
	<cfset variables.requested_sum=variables.requested_sum+budget>
	<cfif comparenocase(fuseaction, "forceplanner_save")>
	case #task_id#:
		if ( !$('##accept_'+task_id).is(':checked') ) {
			if (confirm('This task must be assigned before you can allocate time or modify the due date.\nWould you like to assign it now?')) {
				document.form_forceplanner.accept_#task_id#.checked=1;<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
				CalculateRowFields(task_id, #variables.user_account_id#);</cfloop>
			}
			else {<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
				document.form_forceplanner.t#task_id#_#variables.user_account_id#.blur();</cfloop>
			}
		}
		return;
		break;
	</cfif>
	</cfloop>}
}

var CalculateRowFields=function(task_id, user_account_id){
	"use strict"; //let's avoid tom-foolery in this function
	
	//calculate new hours assigned, and hours remaining, for the affected task
	switch(task_id) {
		<cfloop query="get_prospectives">
		case "accept_#task_id#":		
			var task_assigned#task_id#=<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">parseInt(document.form_forceplanner.t#task_id#_#variables.user_account_id#.value,10) + </cfloop>0;
			document.form_forceplanner.task_assigned#task_id#.value=task_assigned#task_id#;
			$('##display_task_assigned#task_id#').text(task_assigned#task_id#);
		
			var task_remainder#task_id#=#budget#-task_assigned#task_id#;
			document.form_forceplanner.task_remainder#task_id#.value=task_remainder#task_id#;
			$('##display_task_remainder#task_id#').text(task_remainder#task_id#);
			break;
		</cfloop>
	}
	
	//calculate affected employee's assigned hours, remaining capacity, and update those totals (and capacity used percentages) for the team
	switch(user_account_id) {
	<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
		case #variables.user_account_id#:
			var sum_#variables.user_account_id#=<cfloop query="get_prospectives">parseInt(document.form_forceplanner.t#task_id#_#variables.user_account_id#.value,10) + </cfloop>0;
			$('##sum_#variables.user_account_id#').text(sum_#variables.user_account_id#);
		
			var capacity_#variables.user_account_id#=Math.ceil(sum_#variables.user_account_id#/#get_week_days.hours_in_month#*100);
			$('##capacity_#variables.user_account_id#').text(capacity_#variables.user_account_id#);
			
			var sum_assigned=0;
			$('.employee_sum').each(function() {
				sum_assigned+=parseInt( $(this).text(),10 );	
			});
			$('##display_sum_assigned').text(sum_assigned);
			$('##sum_assigned').val(sum_assigned);
		
			var sum_remaining=#requested_sum#-sum_assigned;
			$('##display_sum_remaining').text(sum_remaining);
		
			var capacity_assigned=Math.ceil(sum_assigned/#variables.total_requested#*100);
			$('##capacity_assigned').text(capacity_assigned);
		
			var capacity_remaining=Math.ceil(sum_remaining/#variables.total_requested#*100);
			$('##capacity_remaining').text(capacity_remaining);
			break;
	</cfloop>
	return;
	}
}

var ReCalculate=function(task_id){
	"use strict"; //let's avoid tom-foolery in this function
	switch(task_id) {
		<cfloop query="get_prospectives">
		case #task_id#:
			if ( $('##accept_'+task_id).is(':checked') ) {
				//remove read-only attribute from employee hours assignment fields
				$('##accept_'+task_id).parents('tr').find('input.number').removeAttr('readonly').attr('required','required').each(function() {
					$(this).val( $(this).attr('data_value') );
				});
				//assign default budget for each team member (generally this means giving the task owner all the requested hours)
				<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
				CalculateRowFields(task_id,'e_#variables.user_account_id#');</cfloop>
			}
			else {
				//assign checkbox is unchecked, so make employee hours assignment fields read-only and set data_value of field to value of the field, then set value of field to 0
				$('##accept_'+task_id).parents('tr').find('input.number').attr('readonly','readonly').removeAttr('required').each(function() {
					$(this).attr( 'data_value', $(this).val() );
				}).val(0);<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
				CalculateRowFields(task_id,'e_#variables.user_account_id#');</cfloop>
			}
			break;
		</cfloop>
	}
	return task_id;
}

//make all the summary columns line up between the two different tables
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
		<th class="th_#user_account_id#"><abbr title="#first_name# #last_name#">#initials#</abbr> <a href="javascript:list_to_employee();" title="View employee's details"><i class="icon-user"></i></a></th>
	</cfloop>
</cfsavecontent>
</cfoutput>

