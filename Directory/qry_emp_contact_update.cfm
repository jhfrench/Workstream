
<!-- directory/qry_emp_contact_update.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the emp_contact table

	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:46:55  daugherty
	Initial revision

	Revision 1.0  2002-03-11 13:47:20-05  long
	Created the file

	||
	Variables:
	
	END FUSEDOC --->
	
	<cfquery name="update_emp_contact" datasource="#application.datasources.main#">
    UPDATE Emp_contact
    SET name = '#attributes.name#', lname = '#attributes.lname#', mi = '#attributes.mi#',
	Credentials = '#attributes.Credentials#', Emp_contact_Type = #attributes.Emp_contact_Type#
    WHERE emp_id = #attributes.emp_id#
    </cfquery>
</cfsilent>
