
<!--Tools/qry_get_emp_name.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all the modules that a user is allowed to see.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	END FUSEDOC --->
<cfquery name="get_emp_name" datasource="#application.datasources.main#">
SELECT lname || ', ' || name AS name
FROM Emp_Contact
WHERE user_account_id=#attributes.user_account_id#
</cfquery>
</cfsilent>
