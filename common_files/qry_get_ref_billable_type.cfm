
<!-- common_files/qry_get_ref_billable_type.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all of the information from the REF_Billable_Type table.
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_ref_billable_type" datasource="#application.datasources.main#">
SELECT *
FROM REF_Billable_Type
ORDER BY sort_order
</cfquery>
</cfsilent>