
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfif NOT compare(session.workstream_text_size,"Lg")>
	<cfset variables.cols=124>
<cfelseif NOT compare(session.workstream_text_size,"Md")>
	<cfset variables.cols=127>
<cfelse>
	<cfset variables.cols=130>
</cfif>
<cfset variables.descrip_rows=min(3,(len(get_task_details.description)/variables.cols+1))>
<cfset variables.resolution_rows=min(8,time_entry_details.recordcount)>
<cfif qa_entry_details.recordcount GT 1>
	<cfset qa_rows=min(5,qa_entry_details.recordcount)>
<cfelse>
	<cfset qa_rows=min(5,(len(qa_entry_details.note)/variables.cols+1))>
</cfif>
<cfset entry_rows=variables.descrip_rows+variables.resolution_rows+qa_rows-9>
</cfsilent>
	<tr valign="top">
		<td width="15">
			<!--- GUTTER COLUMN --->
			<cfoutput><input type="hidden" name="task_id" value="#task_id#">
			<input type="hidden" name="project_id" value="#get_task_details.project_id#">
			<input type="hidden" name="last_loaded" value="#now()#">
			<input type="hidden" name="orig_owner" value="#task_owner#">
			<input type="hidden" name="orig_team" value="#task_team#">
			<input type="hidden" name="orig_qa" value="#task_qa#">
			<input type="hidden" name="orig_due_date" value="#dateformat(get_task_details.due_date,"mm/dd/yy")#">
			<input type="hidden" name="orig_priority_id" value="#get_task_details.priority#">
			<input type="hidden" name="orig_task_status_id" value="#get_task_details.status_id#">
			<input type="hidden" name="orig_icon_id" value="#get_task_details.icon_id#">
			<input type="hidden" name="orig_task_description" value="#ReplaceList(ParagraphFormat(get_task_details.description),'<P>,"',",")#">
			<input type="hidden" name="orig_reminder_days" value="#get_completion_days.reminder_days#">
			<input type="hidden" name="orig_reminder_cc" value="#valuelist(get_prep_email.email_id)#">
			<input type="hidden" name="orig_notification" value="#valuelist(get_completion_email.email_id)#">
			<input type="hidden" name="orig_notification_cc" value="#valuelist(get_completion_cc_email.email_id)#">
			<input type="hidden" name="orig_file" value="#get_task_details.status_id#">
			</cfoutput>
		</td>
		<td>
			<!--- LEFT COLUMN --->
			<cfinclude template="dsp_task_details_col_left.cfm">
		</td>
		<td>
			<!--- RIGHT COLUMN --->
			<cfinclude template="dsp_task_details_col_right.cfm">
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
<cfif NOT time_entry_details.recordcount>
	<cfinclude template="dsp_task_delete.cfm">
</cfif>

