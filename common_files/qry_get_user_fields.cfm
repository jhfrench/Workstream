
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
	||
	END FUSEDOC --->
<cfquery name="get_user_fields" datasource="#application.datasources.main#">
SELECT User_Fields.user_field_id, User_Fields.field_type_id,  User_Fields.field_title,
	User_Fields.active_ind
FROM User_Fields, User_Field_Project_Link
WHERE User_Fields.user_field_id=User_Field_Project_Link.user_field_id
	AND User_Field_Project_Link.project_id=#attributes.project_id#<cfif isdefined("attributes.active_only")>
	AND User_Fields.active_ind=1</cfif><cfif isdefined("attributes.one_field")>
	AND User_Fields.user_field_id=#attributes.one_field#</cfif>
ORDER BY User_Fields.user_field_id
</cfquery>
</cfsilent>

