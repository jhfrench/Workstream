
<!--common_files/qry_get_user_fields.cfm
	Author: Jeromy F -->
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
FROM User_Fields
	INNER JOIN User_Field_Project_Link ON User_Fields.user_field_id=User_Field_Project_Link.user_field_id
		AND User_Field_Project_Link.active_ind=1
		AND User_Field_Project_Link.project_id=<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />
WHERE 1=1<cfif isdefined("attributes.active_only")>
	AND User_Fields.active_ind=1</cfif><cfif isdefined("attributes.one_field")>
	AND User_Fields.user_field_id=<cfqueryparam value="#attributes.one_field#" cfsqltype="cf_sql_integer" /></cfif>
ORDER BY User_Fields.user_field_id
</cfquery>
</cfsilent>