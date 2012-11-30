<!--- $issue$: is this template still used? --->
<!--Tools/dsp_forceplanner_save_rows.cfm
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
<cfset variables.trigger=0>
</cfsilent>
<cfoutput query="get_prospectives">
<cfif variables.processed_counter EQ 15 AND currentrow NEQ recordcount>
	<cfinclude template="dsp_forceplanner_main_head.cfm">
	<cfset variables.processed_counter=0>
</cfif>
<cfif isdefined("attributes.accept_#task_id#") AND (NOT listFind(variables.task_processed,task_id))>
<cfset variables.task_processed=listappend(variables.task_processed,task_id)>
<cfset variables.trigger=1>
<cfset variables.processed_counter=incrementvalue(variables.processed_counter)>
	<tr>
		<td>
			<a href="javascript:list_to_task('#task_id#');">#task_id#</a>
		</td>
		<td>
			<a href="javascript:list_to_task('#task_id#');">#task_name#</a>
		</td>
		<td>
			<a href="javascript:list_to_project('#project_id#');">#project#</a>
		</td>
		<td class="date">
			<a href="javascript:list_to_task('#task_id#');">#dateformat(due_date,"m/d/yyyy")#</a>
		</td>
		<td>
			<input type="checkbox" name="accept_#task_id#" checked="yes" value="#task_id#" disabled="disabled" />
		</td>
		<td align="center">
			#billable#
		</td>
	<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
		<td align="right">
			<cfif evaluate("attributes.t#task_id#_#variables.user_account_id#") NEQ 0>#numberformat(evaluate("attributes.t#task_id#_#variables.user_account_id#"),"___._")#</cfif>
			<cfset variables.task_assigned=variables.task_assigned+evaluate("attributes.t#task_id#_#variables.user_account_id#")>
		</td>
	</cfloop>
		<td class="number">
			#budget#
		</td>
		<td>
			#variables.task_assigned#
			<cfset variables.task_remainder=budget-variables.task_assigned>
		</td>
		<td>
			#variables.task_remainder#
		</td>
	</tr>
</cfif>
<cfset variables.task_assigned=0>
<cfset variables.task_remainder=0>
</cfoutput>
<cfif variables.trigger EQ 0>
	<tr class="error">
		<td colspan="<cfoutput>#variables.colspan#</cfoutput>">
			There are no prospective tasks to assign.
		</td>
	</tr>
</cfif>
