
<!--Customers/qry_get_user_field_types.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all the form fields that a user is allowed to specify as custom fields for an engagement.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:46:15  daugherty
	Initial revision

	Revision 1.2  2001-11-01 16:25:06-05  french
	Made changes that allows workstream to map one custom field to multiple projects.

	Revision 1.1  2001-10-11 10:56:15-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfquery name="get_user_field_types" datasource="#application.datasources.main#">
SELECT type_id, name AS user_field_type
FROM REF_User_Field_Type
</cfquery>
</cfsilent>

