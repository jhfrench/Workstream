
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
	<tr>
		<td scope="row">
			<a href="javascript:list_to_task('#task_id#');" title="View task details">#task_id#</a>
		</td>
		<td>
			<a href="javascript:list_to_task('#task_id#');" title="View task details">#task_name#</a>
		</td>
		<td>
			<a href="javascript:list_to_project('#project_id#');" title="View project details">#project#</a>
		</td>
		<td class="date">
			<input type="date" name="task_due_date#task_id#" id="task_due_date#task_id#" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" value="#dateformat(due_date, 'yyyy-mm-dd')#" maxlength="10" required="required" onfocus="ReleaseRowFields('accept_#task_id#');" class="span8 date" />
		</td>
		<td>
			<input type="checkbox" name="accept_task" id="accept_#task_id#" value="#task_id#"#previously_assigned# onchange="ReCalculate('accept_#task_id#');" />
		</td>
		<td>
			#billable#
		</td>
	<cfset variables.task_assign=0>
	<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
		<td class="number">
			<cfset variables.employee_budget=evaluate("budget#variables.user_account_id#")>
			<cfset variables.current_budget=replace(decimalformat(variables.employee_budget), ",", "", "all")>
			<cfif listgetat(variables.current_budget,2,".") EQ 0><cfset variables.current_budget=numberformat(variables.current_budget)></cfif>
			<cfparam name="sum_#variables.user_account_id#" default="0">
			<cfif len(previously_assigned)>
				<cfset "sum_#variables.user_account_id#"=variables.employee_budget+evaluate("sum_#variables.user_account_id#")>
				<cfset variables.task_assign=variables.task_assign+variables.current_budget>
			<cfelse>
				<cfset variables.current_budget=0>
			</cfif>
			<input type="number" name="t#task_id#_#variables.user_account_id#" id="t#task_id#_#variables.user_account_id#" step="1" min="1" onchange="CalculateRowFields('accept_#task_id#','e_#variables.user_account_id#');" onfocus="ReleaseRowFields('accept_#task_id#');" data_value="#variables.employee_budget#" value="#variables.current_budget#" class="number span8" required="required" />
		</td>
	</cfloop>
		<td class="number">
			#budget#
		</td>
		<td class="number">
			<input type="text" name="task_assigned#task_id#" value="#variables.task_assign#" readonly="readonly" class="number span8" />
		</td>
		<td class="number">
			<cfset "task_remainder#task_id#"=budget-variables.task_assign>
			<input type="text" name="task_remainder#task_id#" value="#evaluate('task_remainder#task_id#')#" readonly="readonly" class="number span8" />
			<input type="hidden" name="task_status#task_id#" value="#previous_entry#">
		</td>
	</tr>
</cfif>
<cfif variables.processed_counter GT 3 AND NOT variables.processed_counter MOD 15>
	<cfinclude template="dsp_forceplanner_main_head.cfm">
</cfif>
</cfoutput>
<cfelse>
	<tr class="error">
		<td colspan="<cfoutput>#variables.colspan#</cfoutput>">
			There are no prospective tasks to assign.
		</td>
	</tr>
</cfif>
