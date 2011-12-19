
<!--Timekeeping/dsp_task_details_table.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the attributes of a task. If a task is not specified I display the form to set task details/create a new task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	==> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfif NOT compare(session.workstream_text_size,"Lg")>
	<cfset variables.cols=124>
<cfelseif NOT compare(session.workstream_text_size,"Md")>
	<cfset variables.cols=127>
<cfelse>
	<cfset variables.cols=130>
</cfif>
<cfset tabindex=0>
</cfsilent>
	<tr valign="top">
		<td width="15">
			<!--- GUTTER COLUMN --->
		</td>
		<td>
			<!--- LEFT COLUMN --->
			<cfinclude template="dsp_task_new_col_left.cfm">
		</td>
		<td>
			<!--- RIGHT COLUMN --->
			<cfinclude template="dsp_task_new_col_right.cfm">
		</td>
	</tr>
	<tr valign="top">
		<td width="15">
		 <!--- GUTTER COLUMN --->
		</td>
		<td>
			<!--- LEFT COLUMN --->
			<cfinclude template="dsp_task_reminder.cfm">
		</td>
		<td>
			<!--- RIGHT COLUMN --->
			<cfinclude template="dsp_task_notification.cfm">
		</td>
	</tr>

