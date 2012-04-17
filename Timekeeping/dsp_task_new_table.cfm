
<!--Timekeeping/dsp_task_new_table.cfm
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
 --->
<cfswitch expression="#session.workstream_text_size#">
	<cfcase value="Lg">
		<cfset variables.cols=124>
	</cfcase>
	<cfcase value="Md">
		<cfset variables.cols=127>
	</cfcase>
	<cfdefaultcase>
		<cfset variables.cols=130>
	</cfdefaultcase>
</cfswitch>
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

