
<!--Timekeeping/dsp_task_notification.cfm
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
<cfif compare(listlast(attributes.fuseaction, '.'),"new_task")>
	<cfset variables.to_list=valuelist(get_completion_email.email_id)>
	<cfset variables.cc_list=valuelist(get_completion_cc_email.email_id)>
<cfelse>
	<cfset variables.to_list=0>
	<cfset variables.cc_list=0>
</cfif>
</cfsilent>
<cfoutput>
<table border="1" cellpadding="1" cellspacing="1" bordercolor="##ffffff">
	<tr bordercolor="##ffffff">
		<td class="HeadText#session.workstream_text_size#" valign="top">
			Completion Notification
		</td>
	</tr>
	<tr bordercolor="##ffffff">
		<td valign="top" class="SubHeadText#session.workstream_text_size#">
			Recipient List<cfset tabindex=incrementvalue(tabindex)>
			<cfset tabindex=incrementvalue(tabindex)><br><cfmodule template="../common_files/dsp_team_select.cfm" select_name="notification_to_id" emp_id="#variables.to_list#" email_only=1 multi=1 size=6 tabindex="#tabindex#" class="RegText#session.workstream_text_size#">
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			'CC' List<cfset tabindex=incrementvalue(tabindex)>
			<cfset tabindex=incrementvalue(tabindex)><br><cfmodule template="../common_files/dsp_team_select.cfm" select_name="notification_cc_id" emp_id="#variables.cc_list#" email_only=1 multi=1 size=6 tabindex="#tabindex#" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</table>
</cfoutput>

