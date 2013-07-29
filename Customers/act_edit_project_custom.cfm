
<!--Customers/act_edit_project_custom.cfm
	Author: Jeromy French -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: Within a transaction, I first unretire all custom fields for the project, then I retire the fields the user specifies for retirement. Next, I add a new drop down box and/or text box, if one is specified by the user.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC ---></cfsilent>
<!--- <cftransaction isolation="READ_COMMITTED"></cftransaction> --->
<cfquery name="get_user_fields" datasource="#application.datasources.main#">
UPDATE User_Fields
SET active_ind=1
FROM User_Fields
	INNER JOIN User_Field_Project_Link ON User_Fields.user_field_id=User_Field_Project_Link.user_field_id
		AND User_Field_Project_Link.project_id=<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />
WHERE User_Fields.active_ind=0;
<cfif isdefined("attributes.retire")>
UPDATE User_Fields
SET active_ind=0
FROM User_Fields
	INNER JOIN User_Field_Project_Link ON User_Fields.user_field_id=User_Field_Project_Link.user_field_id
		AND User_Field_Project_Link.project_id=<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />
WHERE User_Fields.active_ind=1
	AND User_Fields.user_field_id IN (<cfqueryparam value="#attributes.retire#" cfsqltype="cf_sql_integer" list="true" />);
</cfif>
</cfquery>
<cfif len(attributes.type_1_num_1_name) NEQ 0 OR len(attributes.type_2_num_1_name) NEQ 0>
	<cfinclude template="qry_get_user_field_types.cfm">
	<cfloop query="get_user_field_types">
		<cfif len(evaluate("attributes.type_#user_field_type_id#_num_1_name")) NEQ 0>
			<cfset variables.field_title=replace(evaluate("attributes.type_#user_field_type_id#_num_1_name"), "', /,%", "''", "All")>
			<cftransaction>
				<cfquery name="insert_user_fields" datasource="#application.datasources.main#">
				INSERT INTO User_Fields (field_user_field_type_id, field_title, created_by)
				VALUES (<cfqueryparam value="#user_field_type_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#variables.field_title#" cfsqltype="cf_sql_varchar" />, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
				RETURNING user_field_id
				</cfquery>
				<cfquery name="add_to_link_table" datasource="#application.datasources.main#">
				INSERT INTO User_Field_Project_Link (user_field_id, project_id, created_by)
				VALUES(#insert_user_fields.user_field_id#, <cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
				</cfquery>
				<cfif user_field_type_id EQ 1>
				<cfloop from="1" to="8" index="variables.opt_ii">
					<cfset variables.selection_title=replace(evaluate("attributes.type_#user_field_type_id#_num_1_opt_#variables.opt_ii#"), "', /,%", "''", "All")>
					<cfif len(variables.selection_title)>
						<cfquery name="add_custom_field_options" datasource="#application.datasources.main#">
						INSERT INTO User_Field_Items (user_field_id, selection_title, created_by)
						VALUES(#insert_user_fields.user_field_id#, <cfqueryparam value="#variables.selection_title#" cfsqltype="cf_sql_varchar" />, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
						</cfquery>
					</cfif>
				</cfloop>
				</cfif>
		</cftransaction>
		</cfif>
	</cfloop>
</cfif>
<div class="alert alert-success">
	<strong>No problem!</strong>
	<cfif listcontains(variables.allowed_business_function_id,634)><p><a href="index.cfm?fuseaction=Reports.project_dashboard" class="btn">Check out the project dashboard</a></p></cfif>
</div>
