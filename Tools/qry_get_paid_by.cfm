
<!--Tools/qry_get_paid_by.cfm
	Author: Damon S  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the  different sources of expense payments for the expense form and the expense report.
	||
	Name: Damon Scott
	||
	Edits:
	 || 
	END FUSEDOC --->
<cfquery name="get_paid_by" datasource="#application.datasources.main#" >
SELECT *
FROM REF_Paid_By
ORDER BY order_by
</cfquery>
</cfsilent>
