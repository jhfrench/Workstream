
<!--Reports/pag_manager_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the manager hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfif isdefined("attributes.from_date")>
	<cfinclude template="act_verify_dates.cfm">
	<cfif attributes.from_date LTE now() AND attributes.from_date LTE attributes.through_date>
		<cfinclude template="qry_get_manager_hours_report_output.cfm">
		<cfinclude template="dsp_manager_hours.cfm">
	</cfif>
</cfif>
<cfinclude template="dsp_manager_hours_input.cfm">
