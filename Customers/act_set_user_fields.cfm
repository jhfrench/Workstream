
<!--Customers/act_set_user_fields.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the page that builds user defined fields when adding a new engagement.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfif isdefined("delete_user_field_list")>
	<cfif comparenocase(delete_user_field_list,"None")>
		<cfloop from="1" to="#ListLen(Delete_User_Field_List)#" index="ii">
			<cfset current_user_field_delete=listgetat(Delete_User_Field_List,ii)>
			<cfquery name="Add_User_Field_Items" datasource="#application.datasources.main#">
			UPDATE User_Fields
			SET active_ind=0
			WHERE user_field_id=#current_user_field_delete#
			</cfquery>
		</cfloop>
	</cfif>
</cfif>
<cfif attributes.req_custom NEQ 0 AND (attributes.field1 NEQ 0 OR attributes.field2 NEQ 0)>
<cfinclude template="qry_get_user_field_types.cfm">
<cfloop query="get_user_field_types">
	<cfif evaluate("attributes.field#type_id#") NEQ 0>
		<cfloop from="1" to="#evaluate("attributes.field#type_id#")#" index="ii">
			<cfset variables.current_field_title=evaluate("attributes.type_#type_id#_num_#ii#_name")>
			<cfquery name="add_custom_fields" datasource="#application.datasources.main#">
			INSERT INTO User_Fields (field_type_id, field_title, active_ind)
			VALUES (#type_id#, '#variables.current_field_title#', 2)
			</cfquery>
			<cfquery name="add_to_link_table" datasource="#application.datasources.main#">
			INSERT INTO User_Field_Project_Link(user_field_id, project_id)
			VALUES(CURRVAL('User_Fields_user_field_id_SEQ'), #get_project_id.project_id#)
			</cfquery>
			<cfif type_id EQ 1>
			<cfloop from="1" to="8" index="opt_ii">
				<cfif len(evaluate("attributes.type_#type_id#_num_#ii#_opt_#opt_ii#"))>
				<cfset variables.current_selection_title=evaluate("attributes.type_#type_id#_num_#ii#_opt_#opt_ii#")>
				<cfquery name="add_custom_field_options" datasource="#application.datasources.main#">
				INSERT INTO user_field_items(user_field_id, selection_title)
				VALUES(CURRVAL('User_Fields_user_field_id_SEQ'), '#variables.current_selection_title#')
				</cfquery>
				</cfif>
			</cfloop>
			</cfif>
		</cfloop>
	</cfif>
</cfloop>
</cfif>
</cfsilent>

