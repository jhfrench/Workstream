
<!-- Directory/qry_emp_contact_update.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the emp_contact table

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="update_emp_contact" datasource="#application.datasources.main#">
UPDATE Emp_contact
SET name = '#attributes.name#',
	lname = '#attributes.lname#',
	mi = '#attributes.mi#',
	credentials = '#attributes.Credentials#',
	emp_contact_type=#attributes.Emp_contact_Type#
WHERE emp_id = #attributes.emp_id#
</cfquery>
</cfsilent>
