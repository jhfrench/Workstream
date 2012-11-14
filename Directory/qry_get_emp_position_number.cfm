
<!--Directory/qry_get_position_number.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees position number info.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log: 

	||
	Variables:
	-->

 --->
<cfquery name="get_emp_position_number" datasource="#application.datasources.main#">
SELECT employment_position_id, effective_start_date, effective_end_date
FROM Link_User_Account_Employment_Position
WHERE user_account_id=#attributes.user_account_id#
ORDER BY effective_start_date
</cfquery>
</cfsilent>