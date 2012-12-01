
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
<cfset variables.prospectives_task_id=valuelist(get_prospectives.task_id)>
<cfset variables.requested_sum=0>
<cfset variables.total_requested=get_week_days.hours_in_month*get_subordinates.recordcount>
</cfsilent>
<cfoutput>
<script language="JavaScript">
var ReleaseRowFields=function(task_id) {
	"use strict"; //let's avoid tom-foolery in this function
	if ( !$('##accept_'+task_id).is(':checked') ) {
		if (confirm('This task must be assigned before you can allocate time or modify the due date.\nWould you like to assign it now?')) {
			$('##accept_'+task_id).attr('checked','checked');
			ReleaseRow(task_id);
			CalculateRowFields(task_id, 0);
		}
		else {
			$('.task_id_'+task_id).each(function() {
				$(this).blur();
			});
		}
	}
}

var CalculateRowFields=function(task_id, user_account_id){
	"use strict"; //let's avoid tom-foolery in this function
	
	//calculate new hours assigned, and hours remaining, for the affected task
	var task_total=0;
	$('.task_id_'+task_id).each(function(){
		task_total+=$(this).val();	
	});
	$('##task_assigned'+task_id).value(task_total);
	$('##display_task_assigned'+task_id).text(task_total);
		
	var task_remainder=parseInt($('##accept_'+task_id).parents('tr').find('td.display_task_budget').text(),10)-task_total;
	$('##task_remainder'+task_id).value(task_remainder);
	$('##display_task_remainder'+task_id).text(task_remainder);
	
	//calculate affected employee's assigned hours, remaining capacity, and update those totals (and capacity used percentages) for the team
	switch(user_account_id) {
	<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
		case #variables.user_account_id#:
			var employee_total=0;
			$('.user_account_id_'+user_account_id).each(function(){
				employee_total+=$(this).val();
			});
			$('##sum_#variables.user_account_id#').text(employee_total);
		
			$('##capacity_#variables.user_account_id#').text( Math.ceil(employee_total/#get_week_days.hours_in_month#*100) );
			break;
	</cfloop>
		case 0:
		<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
			var sum_#variables.user_account_id#=<cfloop list="#variables.prospectives_task_id#" index="variables.task_id">parseInt(document.form_forceplanner.t#variables.task_id#_#variables.user_account_id#.value,10) + </cfloop>0;
			$('##sum_#variables.user_account_id#').text(sum_#variables.user_account_id#);
		
			$('##capacity_#variables.user_account_id#').text( Math.ceil(sum_#variables.user_account_id#/#get_week_days.hours_in_month#*100) );
		</cfloop>
			break;
	}
	
	UpdateSummaryTable();
	return task_id;
}

var ReCalculate=function(task_id){
	"use strict"; //let's avoid tom-foolery in this function

	if ( $('##accept_'+task_id).is(':checked') ) {
		ReleaseRow(task_id);
		//assign default budget for each team member (generally this means giving the task owner all the requested hours)
		CalculateRowFields(task_id, 0);
	}
	else {
		//assign checkbox is unchecked, so make employee hours assignment fields read-only and set data_value of field to value of the field, then set value of field to 0
		LockRow(task_id);
		CalculateRowFields(task_id, 0);
	};

	return task_id;
}

var ReleaseRow=function(task_id){
	"use strict"; //let's avoid tom-foolery in this function

	//remove read-only attribute from employee hours assignment fields
	$('.task_id_'+task_id).removeAttr('readonly').attr('required','required').each(function() {
		$(this).val( $(this).attr('data_value') );
	});
	return task_id;
}

var LockRow=function(task_id){
	"use strict"; //let's avoid tom-foolery in this function

	//assign checkbox is unchecked, so make employee hours assignment fields read-only and set data_value of field to value of the field, then set value of field to 0
	$('.task_id_'+task_id).attr('readonly','readonly').removeAttr('required').each(function() {
		$(this).attr( 'data_value', $(this).val() );
	}).val(0);
	return task_id;
}

var UpdateSummaryTable=function() {
	"use strict"; //let's avoid tom-foolery in this function
	
	//update the total amount of assigned workload for all team members
	var sum_assigned=0;
	$('.employee_sum').each(function() {
		sum_assigned+=parseInt($(this).text(),10);
	});
	$('##display_sum_assigned').text(sum_assigned);
	$('##sum_assigned').val(sum_assigned);
	
	var sum_requested=0;
	$('##form_forceplanner input[type="checkbox"]:checked').parents('tr').find('td.display_task_budget').each( function() {
		sum_requested+=parseInt( $(this).text(),10 );
	});
	$('##display_sum_requested').text(sum_requested);
	
	//update remaining team capacity
	var sum_remaining=sum_requested-sum_assigned;
	$('##display_sum_remaining').text(sum_remaining);

	//update percentage of requested workload
	var capacity_requested=Math.ceil(sum_requested/#variables.total_requested#*100);
	$('##capacity_requested').text(capacity_requested);

	//update percentage of assigned workload
	var capacity_assigned=Math.ceil(sum_assigned/#variables.total_requested#*100);
	$('##capacity_assigned').text(capacity_assigned);

	//update percentage of remaining team capacity
	var capacity_remaining=Math.ceil(sum_remaining/#variables.total_requested#*100);
	$('##capacity_remaining').text(capacity_remaining);	
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

