
<!--Tools/dsp_forceplanner_assign_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the rows that allow the user to assign task hours to team members.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfset variables.task_processed="">
<cfset variables.processed_counter=0>
</cfsilent>
<cfif get_prospectives.recordcount>
<cfoutput query="get_prospectives">
<cfif NOT listFind(variables.task_processed,task_id)>
<cfset variables.processed_counter=incrementvalue(variables.processed_counter)>
<cfset variables.task_processed=listappend(variables.task_processed,task_id)>
	<tr<cfif NOT (variables.processed_counter MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td>
			<a href="javascript:list_to_project('#project_id#');">#project#</a>
		</td>
		<td>
			<a href="javascript:list_to_task('#task_id#');">#task_name#</a>
		</td>
		<td>
			<a href="javascript:list_to_task('#task_id#');">#task_id#</a>
		</td>
		<td class="btn-group">
			<input type="text" name="task_due_date#task_id#" value="#dateformat(due_date,"m/d/yyyy")#" size="11" maxlength="11" onfocus="ReleaseRowFields('accept_#task_id#');">
		</td>
		<td class="btn-group">
			<input type="checkbox"#previously_assigned# name="accept_#task_id#" value="#task_id#" onclick="ReCalculate('accept_#task_id#');" onkeydown="ReCalculate('accept_#task_id#');">
		</td>
		<td align="center">
			#billable#
		</td>
	<cfloop list="#emp_id_loop#" index="ii">
		<td>
			<cfset current_budget=replace(decimalformat(#evaluate("budget#ii#")#), ",", "", "all")>
			<cfif listgetat(current_budget,2,".") EQ 0><cfset current_budget=numberformat(current_budget)></cfif>
			<cfparam name="sum_#ii#" default="0">
			<cfif len(previously_assigned)><cfset "sum_#ii#"=#evaluate("budget#ii#")#+#evaluate("sum_#ii#")#><cfset "task_assign#task_id#"=#evaluate("task_assign#task_id#")#+current_budget><cfelse><cfset current_budget=0></cfif>
			<!--- ,'t#task_id#_#ii#' ---><cfinput type="text" name="t#task_id#_#ii#" onchange="CalculateRowFields('accept_#task_id#','e_#ii#');" onfocus="ReleaseRowFields('accept_#task_id#');" onblur="NonNumberComplain('t#task_id#_#ii#');" value="#current_budget#" size="2">
		</td>
	</cfloop>
		<td align="center">
			#budget#
		</td>
		<td class="btn-group">
			<input type="text" name="task_assigned#task_id#" value="#evaluate("task_assign#task_id#")#" size="3" readonly="readonly" />
		</td>
		<td align="center">
			<cfset "task_remainder#task_id#"=budget-#evaluate("task_assign#task_id#")#><input type="text" name="task_remainder#task_id#" value="#evaluate('task_remainder#task_id#')#" size="3" readonly="readonly"><input type="hidden" name="task_status#task_id#" value="#previous_entry#">
		</td>
	</tr>
</cfif>
<cfif variables.processed_counter GT 3 AND NOT variables.processed_counter MOD 15>
	<cfinclude template="dsp_forceplanner_main_head.cfm">
</cfif>
</cfoutput>
<cfelse>
	<tr>
		<cfoutput><td align="center" bgcolor="##E1E1E1" colspan="#variables.colspan#" class="Note">
			There are no prospective tasks to assign.
		</td></cfoutput>
	</tr>
</cfif>

