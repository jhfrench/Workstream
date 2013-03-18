
<!--Directory/qry_get_emp_job_titles.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees job title info.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log: 

	||
	Variables:
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested

 --->
<cfquery name="get_emp_job_titles" datasource="#application.datasources.main#">
SELECT job_title_id, date_start, date_end, title
FROM Job_Title
WHERE active_ind=1
	AND user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />
</cfquery>
</cfsilent>
