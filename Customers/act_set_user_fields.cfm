
<!--Customers/act_set_user_fields.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the page that builds user defined fields when adding a new project.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfif isdefined("attributes.delete_user_field_list") AND len(attributes.delete_user_field_list)>
	<cfquery name="deactivate_user_fields" datasource="#application.datasources.main#">
	UPDATE User_Fields
	SET active_ind=0
	WHERE user_field_id IN (#attributes.delete_user_field_list#)
	</cfquery>
</cfif>
<cfif attributes.req_custom NEQ 0 AND (attributes.field1 NEQ 0 OR attributes.field2 NEQ 0)>
<cfinclude template="qry_get_user_field_types.cfm">
<cfloop query="get_user_field_types">
	<cfif evaluate("attributes.field#type_id#") NEQ 0>
		<cfloop from="1" to="#evaluate("attributes.field#type_id#")#" index="ii">
			<cfset variables.current_field_title=evaluate("attributes.type_#type_id#_num_#ii#_name")>
			<cfquery name="insert_user_fields" datasource="#application.datasources.main#">
			INSERT INTO User_Fields (field_type_id, field_title, active_ind,
				created_by)
			VALUES (#type_id#, '#variables.current_field_title#', 2,
				<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
			RETURNING user_field_id
			</cfquery>
			<cfquery name="add_to_link_table" datasource="#application.datasources.main#">
			INSERT INTO User_Field_Project_Link(user_field_id, project_id, created_by)
			VALUES(#insert_user_fields.user_field_id#, #get_project_id.project_id#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
			</cfquery>
			<cfif type_id EQ 1>
			<cfloop from="1" to="8" index="opt_ii">
				<cfset variables.current_selection_title=replace(evaluate("attributes.type_#type_id#_num_#ii#_opt_#opt_ii#"), "', /,%", "''", "All")>
				<cfif len(variables.current_selection_title)>
					<cfquery name="add_custom_field_options" datasource="#application.datasources.main#">
					INSERT INTO User_Field_Items(user_field_id, selection_title, created_by)
					VALUES(#insert_user_fields.user_field_id#, '#variables.current_selection_title#', <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
					</cfquery>
					</cfif>
			</cfloop>
			</cfif>
		</cfloop>
	</cfif>
</cfloop>
</cfif>
</cfsilent>

