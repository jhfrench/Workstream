
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
	<tr<cfif NOT (variables.processed_counter MOD 2)> bgcolor="##E1E1E1"</cfif> class="RegText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_project('#project_id#');" class="RegText#session.workstream_text_size#">#project#</a>
		</td>
		<td class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_task('#task_id#');" class="RegText#session.workstream_text_size#">#task_name#</a>
		</td>
		<td class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_task('#task_id#');" class="RegText#session.workstream_text_size#">#task_id#</a>
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_task('#task_id#');" class="RegText#session.workstream_text_size#">#dateformat(due_date,"mm/dd/yyyy")#</a>
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			<input type="checkbox" name="accept_#task_id#" checked="yes" value="#task_id#" class="RegText#session.workstream_text_size#" disabled>
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			#billable#
		</td>
	<cfloop list="#emp_id_loop#" index="ii">
		<td align="right" class="RegText#session.workstream_text_size#">
			<cfif evaluate("attributes.t#task_id#_#ii#") NEQ 0>#numberformat(evaluate("attributes.t#task_id#_#ii#"),"___._")#</cfif>
			<cfset variables.task_assigned=variables.task_assigned+evaluate("attributes.t#task_id#_#ii#")>
		</td>
	</cfloop>
		<td align="center" class="RegText#session.workstream_text_size#">
			#budget#
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			#variables.task_assigned#
			<cfset variables.task_remainder=budget-variables.task_assigned>
		</td>
		<td align="center" class="RegText#session.workstream_text_size#<cfif variables.task_remainder LT 0>Red</cfif>">
			#variables.task_remainder#
		</td>
	</tr>
</cfif>
<cfset variables.task_assigned=0>
<cfset variables.task_remainder=0>
</cfoutput>
<cfif variables.trigger EQ 0>
	<tr class="RegText#session.workstream_text_size#">
		<cfoutput><td align="center" bgcolor="##E1E1E1" colspan="#variables.colspan#" class="Note#session.workstream_text_size#">
			There are no prospective tasks to assign.
		</td></cfoutput>
	</tr>
</cfif>
