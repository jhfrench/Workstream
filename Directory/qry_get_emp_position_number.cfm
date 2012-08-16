
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
SELECT position_id, effective_start_date, effective_end_date
FROM position_history
WHERE emp_id = #attributes.emp_id#
ORDER BY effective_start_date
</cfquery>
</cfsilent>