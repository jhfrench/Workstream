
<!--Tools/qry_REF_paid_by.cfm
	Author: Damon S  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: 
	||
	Name: Damon Scott
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