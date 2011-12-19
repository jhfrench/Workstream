
<!--Directory/qry_get_contact_phones.cfm
	Author: Victor B -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve all the phone types that workstream tracks.
	||
	Name: Victor Blell
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:47:00  daugherty
	Initial revision

	Revision 1.0  2003-03-21 11:33:51-05  blell
	created template


	||
	Variables:
	--> application.datasources.main: datasource for the application
	--> variables.emp_id: contains the unique identifier of this employee
	<--  Phone_Type_ID: string containing Phone Type ID for a person
    <--  Phone_Type: string containing Phone Type for a person 
	<--  Phone_Number: string containing Phone Number for a person
    <--  Extension: string containing Phone Extension for a person
	<--  Phone_id: string containing Phone ID for a person
 --->
<cfquery name="get_contact_phones" datasource="#application.datasources.main#">
SELECT Rpt.Phone_Type_ID, 
    Rpt.Phone_Type, Ph.Phone_Number, 
    Ph.Extension, Ph.Phone_id
FROM REF_Phone_Type Rpt LEFT OUTER JOIN
    Phone Ph ON 
    Rpt.Phone_Type_ID = Ph.Phone_type_id 
		AND 
    Ph.Emp_ID = #variables.emp_id#
</cfquery>
</cfsilent>

