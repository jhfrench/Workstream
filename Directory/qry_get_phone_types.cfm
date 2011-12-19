
<!--Directory/qry_get_phone_types.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve all the phone types that workstream tracks.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:47:10  daugherty
	Initial revision

	Revision 1.0  2001-10-16 17:05:53-04  french
	Initial revision

	||
	Variables:
	--> application.datasources.main: datasource for the application
 --->
<cfquery name="get_phone_types" datasource="#application.datasources.main#">
SELECT phone_type_id, phone_type
FROM REF_Phone_Type
</cfquery>
</cfsilent>

