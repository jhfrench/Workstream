
<!--Tools/act_forceplanner.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I use javascript to call a small child window that display the spell check entry form.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfset variables.quote='"'>
<cfset variables.StatusMsg_replace="',#variables.quote#">
<cfset variables.StatusMsg_replace_with=",">
<cfset variables.requested_sum=0>
<cfset variables.total_requested=get_week_days.hours_in_month*get_subordinates.recordcount>
<cfset variables.task_processed="">
</cfsilent>
<script language="JavaScript">
<!--
function ReleaseRowFields(arg, arg1)
{<cfoutput query="get_prospectives">
<cfif NOT listFind(variables.task_processed,task_id)>
<cfset variables.task_processed=listappend(variables.task_processed,task_id)>
<cfset variables.requested_sum=variables.requested_sum+budget>
<cfif comparenocase(fuseaction, "forceplanner_save")>
if (arg == "accept_#task_id#")
	{if (!document.forceplanner.accept_#task_id#.checked)
		{if (confirm('This task must be assigned before you can allocate time or modify the due date.\nWould you like to assign it now?'))
			{document.forceplanner.accept_#task_id#.checked=1;
			CalculateRowFields(arg, arg1);}
		else
			{<cfloop list="#emp_id_loop#" index="ii">document.forceplanner.t#task_id#_#ii#.blur();

			<cfset "task_assign#task_id#"=0></cfloop>}
		}
	return;}
</cfif>
</cfif></cfoutput>}

<cfif comparenocase(fuseaction, "forceplanner_save")>
<cfset variables.task_processed="">
function CalculateRowFields(arg, arg1)
{<cfoutput query="get_prospectives"><cfif NOT listFind(variables.task_processed,task_id)><cfset variables.task_processed=listappend(variables.task_processed,task_id)>
if (arg == "accept_#task_id#")
	{var task_assigned#task_id#;
	task_assigned#task_id#=<cfloop list="#emp_id_loop#" index="ii">parseInt(document.forceplanner.t#task_id#_#ii#.value,10) + </cfloop>0;
	document.forceplanner.task_assigned#task_id#.value=task_assigned#task_id#;

	var task_remainder#task_id#;
	task_remainder#task_id#=#budget#-task_assigned#task_id#;
	document.forceplanner.task_remainder#task_id#.value=task_remainder#task_id#;}
</cfif></cfoutput>
<cfloop list="#emp_id_loop#" index="ii">

<cfoutput>if (arg1 == "e_#ii#")<cfset variables.task_processed="">
	{var sum_#ii#;
	sum_#ii#</cfoutput>=<cfoutput query="get_prospectives"><cfif NOT listFind(variables.task_processed,task_id)><cfset variables.task_processed=listappend(variables.task_processed,task_id)>parseInt(document.forceplanner.t#task_id#_#ii#.value,10) + </cfif></cfoutput>0;
	<cfoutput>
	document.forceplanner.sum_#ii#.value=sum_#ii#;

	var capacity_#ii#;
	capacity_#ii#=Math.ceil(sum_#ii#/#get_week_days.hours_in_month#*100) + '%';
	document.forceplanner.capacity_#ii#.value=capacity_#ii#;

	var sum_assigned;
	sum_assigned=<cfloop list="#emp_id_loop#" index="ii">parseInt(document.forceplanner.sum_#ii#.value,10) + </cfloop>0;
	document.forceplanner.sum_assigned.value=sum_assigned;

	var sum_remaining;
	sum_remaining=#requested_sum#-sum_assigned;
	document.forceplanner.sum_remaining.value=sum_remaining;

	var capacity_assigned;
	capacity_assigned=Math.ceil(sum_assigned/#variables.total_requested#*100) + '%';
	document.forceplanner.capacity_assigned.value=capacity_assigned;

	var capacity_remaining;
	capacity_remaining=Math.ceil(sum_remaining/#variables.total_requested#*100) + '%';
	document.forceplanner.capacity_remaining.value=capacity_remaining;
	</cfoutput>}
</cfloop>
return;}

function NonNumberComplain(arg)<cfset variables.task_processed="">
{<cfoutput query="get_prospectives"><cfif NOT listFind(variables.task_processed,task_id)><cfset variables.task_processed=listappend(variables.task_processed,task_id)><cfset variables.ee_counter=0>
<cfloop list="#emp_id_loop#" index="ii"><cfset variables.ee_counter=incrementvalue(variables.ee_counter)>
if (arg == "t#task_id#_#ii#")
	{
	if (isNaN(document.forceplanner.t#task_id#_#ii#.value))
		{alert('Please enter assigned hours as a number.\nEmployee:#listgetat(variables.emp_init_loop,variables.ee_counter)#\nTask: #ReplaceList(task_name, variables.StatusMsg_replace, variables.StatusMsg_replace_with)#');
		document.forceplanner.t#task_id#_#ii#.select();<!--- 
		ready_check=1 --->;
		}
	}
</cfloop>
</cfif></cfoutput>
return;}

function ReCalculate(arg)<cfset variables.task_processed="">
{<cfoutput query="get_prospectives"><cfif NOT listFind(variables.task_processed,task_id)><cfset variables.task_processed=listappend(variables.task_processed,task_id)>
if (arg == "accept_#task_id#")
	{if (!document.forceplanner.accept_#task_id#.checked)
		{<cfloop list="#emp_id_loop#" index="ii">document.forceplanner.t#task_id#_#ii#.value=0;
		CalculateRowFields('accept_#task_id#','e_#ii#');
		</cfloop>}
	else
		{<cfloop list="#emp_id_loop#" index="ii">document.forceplanner.t#task_id#_#ii#.value=#evaluate("budget#ii#")#;
		CalculateRowFields('accept_#task_id#','e_#ii#');
		</cfloop>}
	}
</cfif></cfoutput>
return;}
</cfif>
//-->
</script>
