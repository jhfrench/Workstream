
<!--Reports/pag_code_report.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the code report fuses.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.month_loop=1>
<cfset variables.total_hours=0>
<cfset variables.grand_total_hours=0>
<cfset variables.emp_type_hours=0>
<cfset variables.query="get_code_report">

<cfparam name="attributes.from_date" default="#month(now())#/1/#year(now())#">
<cfparam name="attributes.through_date" default="#month(now())#/#daysinmonth(now())#/#year(now())#">
</cfsilent>

<cfif isdefined("attributes.project_id")>
	<cfinclude template="act_verify_dates.cfm">
	
	<cfset variables.eval_month=month(variables.from_date)>
	<cfloop from="#variables.from_date#" to="#variables.through_date#" step="1" index="variables.ii">
	<cfif month(variables.ii) NEQ variables.eval_month>
		<cfset variables.month_loop=variables.month_loop+1>
		<cfset variables.eval_month=month(variables.ii)>
	</cfif>
	</cfloop>
	
	<cfset variables.column_count=variables.month_loop+4>
	<cfinclude template="qry_code_report_get_code.cfm">
	<cfinclude template="qry_get_code_report.cfm">
	<h1>Monthly Hours Report for #get_code.display#</h1>
	<h2>From #attributes.from_date# &nbsp;To #attributes.through_date#</h2>
	<cfset variables.column_count=variables.column_count-1>
	<cfinclude template="dsp_code_reports.cfm">
</cfif>

<cfinclude template="../common_files/qry_project_code.cfm">
<cfinclude template="dsp_code_report_input.cfm">