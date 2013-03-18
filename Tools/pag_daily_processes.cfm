
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
			<cfsavecontent variable="variables.email_body">
				<p>#get_daily_email_list.name#,</p>
				
				<p>
					The following task needs review:
					<dl>
						<dt>Task:</dt><dd>#get_daily_email_list.task_name# (#get_daily_email_list.task_id#)</dd>
						<dt>Due:</dt><dd>#get_daily_email_list.due_date#</dd>
						<dt>Description:</dt><dd>#get_daily_email_list.description#</dd>
					</dl>
				</p>
				
				<p>Please <a href="http://#cgi.http_host#/index.cfm?fuseaction=Timekeeping.task_details&task_id=#get_daily_email_list.task_id#">view task #get_daily_email_list.task_id#</a>.</p>
			</cfsavecontent>
			<cfmodule template="../common_files/act_email.cfm" email_to="#get_daily_email_list.email_to#" email_from="#get_daily_email_list.email_from#" email_subject="Status Change: #get_daily_email_list.task_name#" email_body="#variables.email_body#">
			<cfinclude template="qry_update_log_sent_emails.cfm">
		</cfoutput>
	</cfif>
</cftransaction>
Daily emails have been processed.