
<!--Directory/act_job_title_submit.cfm
	Author: Damon S -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I call the queries that are used to enter a new job title entry.
	||
	Name: Damon Scott
	||
	Edits:
	$Log: 
	||
	END FUSEDOC --->
</cfsilent>
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="qry_emp_job_title_entry.cfm">
	<cfinclude template="../common_files/js_reload_and_close.cfm">
</cftransaction>
