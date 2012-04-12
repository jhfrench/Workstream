
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
 --->
<cfif comparenocase(listlast(attributes.fuseaction, '.'),"new_task")>
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
		<td class="HeadText" valign="top">
			Completion Notification
		</td>
	</tr>
	<tr bordercolor="##ffffff">
		<td valign="top" class="SubHeadText">
			Recipient List<cfset tabindex=incrementvalue(tabindex)>
			<cfset tabindex=incrementvalue(tabindex)><br /><cfmodule template="../common_files/dsp_team_select.cfm" select_name="notification_to_id" emp_id="#variables.to_list#" email_only=1 multi=1 size=6 tabindex="#tabindex#" class="RegText">
		</td>
		<td class="SubHeadText">
			'CC' List<cfset tabindex=incrementvalue(tabindex)>
			<cfset tabindex=incrementvalue(tabindex)><br /><cfmodule template="../common_files/dsp_team_select.cfm" select_name="notification_cc_id" emp_id="#variables.cc_list#" email_only=1 multi=1 size=6 tabindex="#tabindex#" class="RegText">
		</td>
	</tr>
</table>
</cfoutput>

