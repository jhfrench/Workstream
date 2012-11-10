
<!--Report/pag_hours_by_code.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the hours by code report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfparam name="attributes.from_date" default="#month(now())#/1/#year(now())#">
<cfparam name="attributes.through_date" default="#month(now())#/#daysinmonth(now())#/#year(now())#">
<cfset attributes.report_name="Hours by Code Report">
<cfinclude template="qry_get_hours_by_code.cfm">

<cfinclude template="dsp_hours_by_code.cfm">

<cfmodule template="dsp_from_through_date.cfm" report_name="#attributes.report_name#" required="yes" fuseaction="#attributes.fuseaction#">