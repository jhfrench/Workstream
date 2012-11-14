
<!--Directory/qry_get_position_number_history.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve position number history based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	--> 

 --->
<cfquery name="get_emp_position_number_history" datasource="#application.datasources.main#">
SELECT employment_position_id, effective_start_date, effective_end_date
FROM Position_History
WHERE user_account_id=#attributes.user_account_id#
ORDER BY effective_start_date
</cfquery>
</cfsilent>
