
<!--Timekeeping/pag_timekeeping.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the main timekeeping page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<cfif session.account_type_id EQ 1>
	<cfinclude template="act_pto_blurb.cfm">
	<cfinclude template="act_life_blurb.cfm">
<cfelse>
	<!--- $issue$: queries that support latest/remaining/unbilled work will go here --->
<cfquery name="get_most_recent_relevant_time_entry" datasource="#application.datasources.main#">
/* 50 most recent time entries relevant to your company */
SELECT Time_Entry.task_id, Time_Entry.work_date, Time_Entry.hours,
	Notes.note, Demographics.last_name, Demographics.first_name
FROM Customer
	INNER JOIN Project ON Customer.customer_id=Project.customer_id
	INNER JOIN Time_Entry ON Project.project_id=Time_Entry.project_id
	INNER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
	INNER JOIN Demographics ON Time_Entry.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Customer.contact_user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
	OR Project.contact_user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
ORDER BY Time_Entry.work_date DESC, Time_Entry.time_entry_id DESC
LIMIT 50;
</cfquery>
</cfif>
<cfinclude template="act_hours_blurb.cfm">
<cfinclude template="../common_files/qry_get_revenue_goal.cfm">
<cfinclude template="qry_get_operations_blurb.cfm">
<cfinclude template="dsp_timekeeping_columns.cfm">