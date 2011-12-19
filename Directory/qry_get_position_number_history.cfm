
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
	Revision 1.0  2006/05/19 13:13:13  pciske
	Initial revision

	

	||
	Variables:
	--> 

 --->
<cfquery name="get_emp_position_number_history" datasource="#application.datasources.main#">
SELECT position_id, effective_start_date, effective_end_date
FROM  Position_History
WHERE emp_id=#attributes.emp_id#
ORDER BY effective_start_date
</cfquery>
</cfsilent>
