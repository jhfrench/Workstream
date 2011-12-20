
<!--Directory/qry_get_review_types.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the different types of reviews.
	||
	Name: Damon Scott
	||
	Edits: 
	$Log: 

	||
	Variables:
		
 --->
<cfquery name="get_review_types" datasource="#application.datasources.main#">
SELECT 	review_type_id, description
FROM REF_Review_Type
WHERE active_ind = 1
ORDER BY sort_order
</cfquery>
</cfsilent>