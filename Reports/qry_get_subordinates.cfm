
<!--Reports/qry_get_subordinates.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run the queries that show PTO-elligible employees in the drop-down selection.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:13:35  stetzer
<>

	||
	END FUSEDOC --->
<cfquery name="get_subordinates" datasource="#application.datasources.main#">
SELECT emp_id
FROM Link_Employee_Supervisor 
WHERE supervisor_id=#session.user_account_id#
	AND GETDATE() BETWEEN date_start and ISNULL(date_end, DATEADD(d, 1, GETDATE()))
</cfquery>
</cfsilent>

