
<!-- Reports/qry_get_pto_year_summary.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfquery name="get_pto_year_summary" dbtype="query">
SELECT transaction_year, SUM(hours_out) AS hours_out, SUM(hours_in) AS hours_in
FROM get_pto_detail
GROUP transaction_year
ORDER BY transaction_year
</cfquery>
</cfsilent>
