
<!--Reports/act_efficiency_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the efficiency report for the engagement that corresponds to what the user requests (as determined by the fuseaction).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_get_hier_2_id.cfm">
<!--- <cfif get_hier_2_id.hier_2_id NEQ 0 AND get_hier_2_id.hier_2_id LT 4>
	<cfinclude template="qry_get_departments.cfm">
	<cfinclude template="qry_efficiency_report_main.cfm">
	<cfinclude template="qry_efficiency_report_sub.cfm">
<cfelse> --->
	<cfinclude template="../common_files/qry_get_subordinates.cfm">
	<cfif get_subordinates.recordcount>
		<cfinclude template="qry_efficiency_report_main.cfm">
		<cfinclude template="qry_efficiency_report_sub.cfm">
	</cfif>
<!--- </cfif> --->

