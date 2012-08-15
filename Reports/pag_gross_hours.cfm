
<!--Reports/pag_gross_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the code for the Gross hours report.  I create a report that displays all the hours that the employees have worked in this month.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_office_select.cfm">
<cfinclude template="../common_files/qry_get_team_select.cfm">
<cfif isdefined("attributes.month")> 
	<cfparam name="statement" default="0">
	<cfset variables.daysinmonth=daysinmonth(createodbcdate("#attributes.month#/1/#attributes.year#"))>
	<cfinclude template="qry_gross_hours.cfm">
	<cfinclude template="dsp_gross_hours.cfm">
</cfif>
<cfinclude template="dsp_gross_hours_input.cfm">