
<!--Directory/qry_get_present_supervisor.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve supervisor history based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested

 --->
<cfquery name="get_present_supervisor" dbtype="query">
SELECT *
FROM get_supervisor_history
WHERE current_supervisor_ind=1
</cfquery>
</cfsilent>
