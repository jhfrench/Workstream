
<!--common_files/qry_get_user_fields.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the custom fields for a project.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:42:09  daugherty
	Initial revision

	Revision 1.4  2001-11-28 13:52:12-05  french
	Modified code to recognize options that should be ignored as specified by the user during timeline creation.

	Revision 1.3  2001-11-06 14:16:58-05  french
	Changed ORDER BY to user_field_id.

	Revision 1.2  2001-11-01 16:26:01-05  french
	Made changes that allows workstream to map one custom field to multiple projects.

	Revision 1.1  2001-10-30 11:16:29-05  french
	Updated responsibilities.

	Revision 1.0  2001-10-18 11:56:50-04  french
	Moved to common_files from Customers.
	||
	END FUSEDOC --->
<cfquery name="get_user_fields" datasource="#application.datasources.main#">
SELECT User_Fields.user_field_id, User_Fields.field_type_id, 
	User_Fields.field_title, User_Fields.active_id
FROM User_Fields, User_Field_Project_Link
WHERE User_Fields.user_field_id=User_Field_Project_Link.user_field_id
	AND User_Field_Project_Link.project_id=#attributes.project_id#<cfif isdefined("attributes.active_only")>
	AND User_Fields.active_id=2</cfif><cfif isdefined("attributes.one_field")>
	AND User_Fields.user_field_id=#attributes.one_field#</cfif>
ORDER BY User_Fields.user_field_id
</cfquery>
</cfsilent>

