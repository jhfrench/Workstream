
<!--Customers/qry_get_user_field_types.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all the form fields that a user is allowed to specify as custom fields for an project.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_user_field_types" datasource="#application.datasources.main#">
SELECT user_field_type_id, name AS user_field_type
FROM REF_User_Field_Type
</cfquery>
</cfsilent>

