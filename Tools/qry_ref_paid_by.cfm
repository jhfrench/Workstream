
<!--Tools/qry_REF_paid_by.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	 || 
	END FUSEDOC --->
<cfquery name="REF_paid_by" datasource="#application.datasources.main#">
SELECT *
FROM REF_Paid_By
ORDER BY order_by
</cfquery>
</cfsilent>