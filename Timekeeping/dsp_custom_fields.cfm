
<!--Timekeeping/dsp_custom_fields.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the custom fields for a particular engagement.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:20:44  stetzer
	<>

	Revision 1.3  2002-02-19 13:00:41-05  french
	Moved reseeding of variables.text_answer outside of get_drop_down_options loop.

	Revision 1.2  2002-02-05 10:10:32-05  french
	Added reseeding of variables.text_answer so that a blank answer would not be superceded by the value of a previous custom field.

	Revision 1.1  2002-02-04 18:18:27-05  french
	Fixing problem caused by commas in variables.custom_answers_text elements (which alters the list size and element positions). Changed delimiter to ';'.

	Revision 1.0  2001-10-18 16:17:12-04  french
	Created file for custom field support.

	||
 --->
<cfset variables.text_answer="">
<cfset variables.custom_drops="">
<cfset variables.custom_text="">
</cfsilent>
<cfinclude template="act_set_custom_responses.cfm">
<cfoutput>
	<tr valign="top">
		<td valign="top" class="RegText#session.workstream_text_size#">
			<span class="SubHeadText#session.workstream_text_size#">Custom Fields</span><br>
<cfloop query="get_user_fields">
	<cfinclude template="../common_files/qry_get_drop_down_options.cfm">
			#field_title#: <cfif field_type_id EQ 1>
				<select name="custom_drops#user_field_id#" size="1" class="RegText#session.workstream_text_size#">
					<cfloop query="get_drop_down_options">
					<option value="#get_drop_down_options.user_field_items_id#"<cfif listfind(variables.custom_answers,user_field_items_id)> selected</cfif>>#get_drop_down_options.selection_title#</option>
					</cfloop>
				</select><br>
				<cfset variables.custom_drops=listappend(variables.custom_drops,user_field_id)>
			<cfelseif field_type_id EQ 2>
					<cfset variables.text_answer="">
					<cfloop query="get_drop_down_options">
					<cfif listfind(variables.custom_answers,user_field_items_id)>
						<cfset variables.text_answer=listgetat(variables.custom_answers_text,listfind(variables.custom_answers,user_field_items_id),"|")>
					</cfif>
					</cfloop>
				<input type="text" name="custom_text#user_field_id#" size="12" value="#variables.text_answer#" maxlength="50" class="RegText#session.workstream_text_size#"><br>
				<cfset variables.custom_text=listappend(variables.custom_text,user_field_id)>
			</cfif>
</cfloop>
<cfif listlen(variables.custom_drops)>
	<input type="hidden" name="custom_drops_collection" value="#variables.custom_drops#">
</cfif>
<cfif listlen(variables.custom_text)>
	<input type="hidden" name="custom_text_collection" value="#variables.custom_text#">
</cfif>
		</td>
	</tr>
</cfoutput>

