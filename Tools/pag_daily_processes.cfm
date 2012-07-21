
<!--Tools/pag_daily_processes.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I run all of the automatic daily processes for NGuage.
	||
	Name: Jeromy French
	 || 
	--->
</cfsilent>
<cftransaction>
	<cfinclude template="qry_get_daily_email_list.cfm">
	<cfif get_daily_email_list.recordcount>
		<cfoutput query="get_daily_email_list">
			<cfset variables.email_body="#get_daily_email_list.name#,
				The following task needs review: #get_daily_email_list.task_name# (#get_daily_email_list.task_id#)
				Due: #get_daily_email_list.due_date#
				Description: #get_daily_email_list.description#">
			<cfmodule template="../common_files/act_email.cfm" email_to="#get_daily_email_list.email_to#" email_from="#get_daily_email_list.email_from#" email_subject="Status Change: #get_daily_email_list.task_name#" email_body="#variables.email_body#" task_id="get_daily_email_list.task_id">
			<cfinclude template="qry_update_log_sent_emails.cfm">
		</cfoutput>
		
	</cfif>
</cftransaction>
Daily emails have been processed.