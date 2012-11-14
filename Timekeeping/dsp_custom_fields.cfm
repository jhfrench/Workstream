
<!--Timekeeping/dsp_custom_fields.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the custom fields for a particular project.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfset variables.text_answer="">
<cfset variables.custom_drops="">
<cfset variables.custom_text="">
</cfsilent>
<cfinclude template="act_set_custom_responses.cfm">
<cfoutput>
<h4>Custom Fields</h4>
<cfloop query="get_user_fields">
	<cfinclude template="../common_files/qry_get_drop_down_options.cfm">
	<cfif field_type_id EQ 1>
		<label for="custom_drops#user_field_id#">#field_title#</label>: 
		<select name="custom_drops#user_field_id#" id="custom_drops#user_field_id#" size="1">
			<cfloop query="get_drop_down_options">
			<option value="#get_drop_down_options.user_field_items_id#"<cfif listfind(variables.custom_answers,user_field_items_id)> selected="selected"</cfif>>#get_drop_down_options.selection_title#</option>
			</cfloop>
		</select>
		<cfset variables.custom_drops=listappend(variables.custom_drops,user_field_id)>
	<cfelseif field_type_id EQ 2>
		<label for="custom_text#user_field_id#">#field_title#</label>: 
			<cfset variables.text_answer="">
			<cfloop query="get_drop_down_options">
			<cfif listfind(variables.custom_answers,user_field_items_id)>
				<cfset variables.text_answer=listgetat(variables.custom_answers_text,listfind(variables.custom_answers,user_field_items_id),"|")>
			</cfif>
			</cfloop>
		<input type="text" name="custom_text#user_field_id#" id="custom_text#user_field_id#" size="12" value="#variables.text_answer#" maxlength="50"><br />
		<cfset variables.custom_text=listappend(variables.custom_text,user_field_id)>
	</cfif>
</cfloop>
<cfif listlen(variables.custom_drops)>
	<input type="hidden" name="custom_drops_collection" value="#variables.custom_drops#">
</cfif>
<cfif listlen(variables.custom_text)>
	<input type="hidden" name="custom_text_collection" value="#variables.custom_text#">
</cfif>
</cfoutput>