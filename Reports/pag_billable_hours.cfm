
<!--Reports/pag_billable_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I show the billiable AND non-billable hours reports, depending on the fuseaction (non_billable_ind is set in circuit.xml).

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.month_loop=0>
<cfset variables.column_count=5>
<cfset variables.total_hours=0>
<cfset variables.grand_total_hours=0>
<cfset variables.emp_type_hours=0>
<cfset query="get_monthly_hours">
</cfsilent>
<cfinclude template="act_verify_dates.cfm">
<cfinclude template="qry_get_monthly_hours.cfm">

<cfinclude template="dsp_code_reports.cfm">

<cfmodule template="dsp_from_thorugh_date.cfm" report_name="#attributes.report_name#" required="yes">