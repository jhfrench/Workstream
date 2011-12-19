
<!--Timekeeping/dsp_task_reminder.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the people who are to be notified of a task's completion.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfif comparenocase(listlast(attributes.fuseaction, '.'),"new_task")>
	<cfset variables.reminder_days=get_completion_days.reminder_days>
	<cfset variables.cc_list=valuelist(get_prep_email.email_id)><!--- 
	<cfset variables.notification_frequency_id=get_task_details.notification_frequency_id> --->
<cfelse>
	<cfset variables.reminder_days="">
	<cfset variables.cc_list="">
	<cfset variables.notification_frequency_id = 1>
</cfif>
</cfsilent>
<cfoutput>
<table border="1" cellpadding="1" cellspacing="1" bordercolor="##ffffff">
	<tr bordercolor="##ffffff">
		<td colspan="2" class="HeadText#session.workstream_text_size#" valign="top">
			Due Date Reminder
		</td>
	</tr>
	<tr bordercolor="##ffffff">
		<td valign="top" class="SubHeadText#session.workstream_text_size#">
			Days:<cfset tabindex=incrementvalue(tabindex)>
			<cfinput type="text" name="reminder_days" value="#variables.reminder_days#" required="No" validate="integer" message="Please specify your pre due date reminder as a number of whole days." size="4" tabindex="#tabindex#" class="RegText#session.workstream_text_size#"><br><span class="RegText#session.workstream_text_size#">(before due date)</span>
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			'CC' List<cfset tabindex=incrementvalue(tabindex)>
			<cfset tabindex=incrementvalue(tabindex)><br><cfmodule template="../common_files/dsp_team_select.cfm" select_name="reminder_cc_id" emp_id="#variables.cc_list#" email_only=1 multi=1 size=6 tabindex="#tabindex#" class="RegText#session.workstream_text_size#">
		</td>
	</tr><!--- 
	<tr bordercolor="##ffffff">
		<td colspan="2" valign="top" class="HeadText#session.workstream_text_size#">
			Status Notification Frequency<br>
			<cfset tabindex=incrementvalue(tabindex)>
			<cfselect name="notification_frequency_id" query="get_notification_frequency" display="description" value="notification_frequency_id" selected="#variables.notification_frequency_id#" size="1" required="Yes" tabindex="#tabindex#" class="RegText#session.workstream_text_size#">
		  </cfselect>
		</td>
	</tr> --->
</table>
</cfoutput>

