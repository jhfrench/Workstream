
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
<cfset variables.quote='"'>
<cfset variables.status_message_replace="',#variables.quote#">
<cfset variables.status_message_replace_with=",">
<cfset variables.requested_sum=0>
<cfset variables.total_requested=get_week_days.hours_in_month*get_subordinates.recordcount>
<cfset variables.task_processed="">
</cfsilent>
<script language="JavaScript">
function ReleaseRowFields(arg, arg1) {
	switch(arg) {<cfoutput query="get_prospectives">
	<cfif NOT listFind(variables.task_processed,task_id)>
	<cfset variables.task_processed=listappend(variables.task_processed,task_id)>
	<cfset variables.requested_sum=variables.requested_sum+budget>
	<cfif comparenocase(fuseaction, "forceplanner_save")>
	case "accept_#task_id#":
		if ($('##accept_#task_id#').attr('checked')==='undefined') {
			if (confirm('This task must be assigned before you can allocate time or modify the due date.\nWould you like to assign it now?')) {
				document.form_forceplanner.accept_#task_id#.checked=1;
				CalculateRowFields(arg, arg1);
			}
			else {<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
				document.form_forceplanner.t#task_id#_#variables.user_account_id#.blur();<cfset "task_assign#task_id#"=0></cfloop>
			}
		}
		return;
		break;
	</cfif>
	</cfif>
	</cfoutput>}
}
<cfif comparenocase(fuseaction, "forceplanner_save")>
<cfset variables.task_processed="">
function CalculateRowFields(arg, arg1){
	switch(arg) {
		<cfoutput query="get_prospectives"><cfif NOT listFind(variables.task_processed,task_id)><cfset variables.task_processed=listappend(variables.task_processed,task_id)>
		case "accept_#task_id#":		
			var task_assigned#task_id#=<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">parseInt(document.form_forceplanner.t#task_id#_#variables.user_account_id#.value,10) + </cfloop>0;
			document.form_forceplanner.task_assigned#task_id#.value=task_assigned#task_id#;
		
			var task_remainder#task_id#=#budget#-task_assigned#task_id#;
			document.form_forceplanner.task_remainder#task_id#.value=task_remainder#task_id#;
			break;
		</cfif></cfoutput>
	}
	
	switch(arg1) {
	<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
		<cfoutput><cfset variables.task_processed="">
		case "e_#variables.user_account_id#":
			var sum_#variables.user_account_id#</cfoutput>=<cfoutput query="get_prospectives"><cfif NOT listFind(variables.task_processed,task_id)><cfset variables.task_processed=listappend(variables.task_processed,task_id)>parseInt(document.form_forceplanner.t#task_id#_#variables.user_account_id#.value,10) + </cfif></cfoutput>0;
			<cfoutput>
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
			</cfoutput>
			break;
	</cfloop>
	return;
	}
}

<cfset variables.task_processed="">
function ReCalculate(arg){
	switch(arg) {
		<cfoutput query="get_prospectives"><cfif NOT listFind(variables.task_processed,task_id)><cfset variables.task_processed=listappend(variables.task_processed,task_id)>
		case "accept_#task_id#":
			if ($('##accept_#task_id#').attr('checked')==='undefined') {<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
				document.form_forceplanner.t#task_id#_#variables.user_account_id#.value=0;
				CalculateRowFields('accept_#task_id#','e_#variables.user_account_id#');</cfloop>
			}
			else {<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
				document.form_forceplanner.t#task_id#_#variables.user_account_id#.value=#evaluate("budget#variables.user_account_id#")#;
				CalculateRowFields('accept_#task_id#','e_#variables.user_account_id#');</cfloop>
			}
			break;
		</cfif></cfoutput>
	}
	return;
}
</cfif>

var adjustColumnWidths=function() {
<cfoutput>
<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
	$('th.th_#variables.user_account_id#').width( $('th.th_#variables.user_account_id#').width() );</cfloop>
<cfloop list="requested_hours,assigned_hours,remaining_hours" index="variables.th_class">
	$('th.#variables.th_class#').width( $('th.#variables.th_class#').width() );</cfloop>
</cfoutput>
	return true;
}
</script>

<cfsavecontent variable="variables.forceplanner_subordinates">
	<cfoutput query="get_subordinates">
		<th class="th_#user_account_id#"><abbr title="#first_name# #last_name#">#initials#</abbr></th>
	</cfoutput>
</cfsavecontent>

