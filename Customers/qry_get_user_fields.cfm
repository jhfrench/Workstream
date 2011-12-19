
<!--Customers/qry_get_user_fields.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the main project details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:15  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:15-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_user_fields" datasource="#application.datasources.main#">
SELECT User_Fields.user_field_id, User_Fields.field_type_id, 
	User_Fields.field_title, User_Fields.active_id
FROM User_Fields
WHERE User_Fields.project_id=#attributes.project_id#
ORDER BY User_Fields.field_type_id
</cfquery>
</cfsilent>

