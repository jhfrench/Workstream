
<!--Directory/qry_pto_rollover_entry.cfm
	Author:David L -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I insert a PTO Annual Accrual Hoours into the PTO_rollover table from the employee entry form
	||
	Name: Giwoong David Lee
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset attributes.Carryover_limit="40">

<cfparam name="attributes.PTO_override" default="">
<cfif len(attributes.PTO_override)>	
<cfquery name="pto_rollover_entry" datasource="#application.datasources.main#">
INSERT INTO PTO_Rollover (emp_id, pto_override, carryover_limit, rollover_year)
VALUES(#variables.emp_id#, '#attributes.pto_override#', '#attributes.carryover_limit#', EXTRACT(YEAR FROM CURRENT_TIMESTAMP))
</cfquery>
</cfif>
	
</cfsilent>

