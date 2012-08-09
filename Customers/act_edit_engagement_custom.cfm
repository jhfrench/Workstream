
<!--Customers/act_edit_engagement_custom.cfm
	Author: Jeromy French  -->
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
FROM User_Fields, User_Field_Project_Link
WHERE User_Fields.active_ind=0
	AND User_Fields.user_field_id=User_Field_Project_Link.user_field_id
	AND User_Field_Project_Link.project_id=#attributes.project_id#
<cfif isdefined("attributes.retire")>
UPDATE User_Fields
SET active_ind=0
FROM User_Fields, User_Field_Project_Link
WHERE User_Fields.active_ind=1
	AND User_Fields.user_field_id=User_Field_Project_Link.user_field_id
	AND User_Field_Project_Link.project_id=#attributes.project_id#
	AND User_Fields.user_field_id IN (#attributes.retire#)
</cfif>
</cfquery>
<cfif len(attributes.type_1_num_1_name) NEQ 0 OR len(attributes.type_2_num_1_name) NEQ 0>
<cfinclude template="qry_get_user_field_types.cfm">
<cfloop query="get_user_field_types">
	<cfif len(evaluate("attributes.type_#user_field_type_id#_num_1_name")) NEQ 0>
		<cfset tmpVar=evaluate("attributes.type_#user_field_type_id#_num_1_name")>
		<cfset tmpVar=replace(tmpVar, "', /,%", "''", "All")>
			<cfquery name="add_custom_fields" datasource="#application.datasources.main#">
			INSERT INTO User_Fields (field_user_field_type_id, field_title, active_ind)
			VALUES (#user_field_type_id#, '#tmpVar#', 2)
			</cfquery>
			<cfquery name="get_last_custom_field" datasource="#application.datasources.main#">
			SELECT MAX(user_field_id) AS current_field
			FROM User_Fields
			</cfquery>
			<cfquery name="add_to_link_table" datasource="#application.datasources.main#">
			INSERT INTO User_Field_Project_Link(user_field_id, project_id)
			VALUES(#get_last_custom_field.current_field#, #attributes.project_id#)
			</cfquery>
			<cfif user_field_type_id EQ 1>
			<cfloop from="1" to="8" index="opt_ii">
				<cfif len(#evaluate("attributes.type_#user_field_type_id#_num_1_opt_#opt_ii#")#)>
				<cfset tmpVar1=evaluate("attributes.type_#user_field_type_id#_num_1_opt_#opt_ii#")>
				<cfset tmpVar1=replace(tmpVar1, "', /,%", "''", "All")>
				<cfquery name="add_custom_field_options" datasource="#application.datasources.main#">
				INSERT INTO user_field_items(user_field_id, selection_title)
				VALUES(#get_last_custom_field.current_field#, '#tmpVar1#')
				</cfquery>
				</cfif>
			</cfloop>
			</cfif>
	</cfif>
</cfloop>
</cfif>
<cfif engagement_dashboard_return EQ 1>
	<cflocation url="../index.cfm?fuseaction=Reports.engagement_dashboard&customer_id=#attributes.customer_id#&project_manager_emp_id=#attributes.project_manager_emp_id#&sort=#sort#&###Project_ID#" addtoken="no">
</cfif>


