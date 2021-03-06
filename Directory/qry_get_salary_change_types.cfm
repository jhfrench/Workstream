
<!--Directory/qry_get_salary_change_types.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the different types of salary changes.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log: 

	||
	Variables:

 --->
<cfquery name="get_salary_change_types" datasource="#application.datasources.main#">
	SELECT 	salary_change_type_id,
			description
	FROM REF_Salary_Change_Type
	WHERE active_ind = 1
	ORDER BY sort_order
</cfquery>
</cfsilent>
