
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
	<tr align="right">
		<td valign="top">
			<span class="SubHeadText">Custom Fields:</span></td>
			
		<td align="left" colspan="100%">	
			
			
<cfloop query="get_user_fields">
	<cfinclude template="../common_files/qry_get_drop_down_options.cfm">
			#field_title#: <cfif field_type_id EQ 1>
					<cfloop query="get_drop_down_options">
						<cfif listfind(variables.custom_answers,user_field_items_id)>
							&nbsp;#get_drop_down_options.selection_title#</cfif>
					</cfloop>
				<br />
				<cfset variables.custom_drops=listappend(variables.custom_drops,user_field_id)>
			<cfelseif field_type_id EQ 2>
					<cfset variables.text_answer="">
					<cfloop query="get_drop_down_options">
					<cfif listfind(variables.custom_answers,user_field_items_id)>
						<cfset variables.text_answer=listgetat(variables.custom_answers_text,listfind(variables.custom_answers,user_field_items_id),"|")>
					</cfif>
					</cfloop>
				#variables.text_answer#<br />
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

