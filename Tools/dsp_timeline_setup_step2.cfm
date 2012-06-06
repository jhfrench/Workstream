
<!--Tools/dsp_timeline_setup_step2.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the change date locked screen.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfset attributes.active_only=1>
</cfsilent>
<cfinclude template="../common_files/qry_get_user_fields.cfm">
<cfoutput>
<tr valign="top">
	<td width="50%">
<cfloop query="get_user_fields">
	<cfinput type="radio" name="user_field_id" required="yes" message="Please choose a custom field." id="use#user_field_id#" value="#user_field_id#">
	#field_title#: <cfif field_type_id EQ 1>
		<cfinclude template="../common_files/qry_get_drop_down_options.cfm">
		<select name="#field_title#">
			<cfloop query="get_drop_down_options">
			<option value="#get_drop_down_options.user_field_items_id#">#get_drop_down_options.selection_title#</option>
			</cfloop>
		</select>
	<cfelseif field_type_id EQ 2>
		<input type="text" name="display_#get_user_fields.currentrow#" size="8" value="">
	</cfif><br />
</cfloop>
	</td>
	<td><cfset variables.start=incrementvalue(variables.start)>
		<ol type="1" start="#variables.start#" class="Note"><li>Choose the custom field used to organize tasks.</li></ol>
	</td>
</tr>
<input type="hidden" name="project_id" value="#attributes.project_id#">
<input type="hidden" name="project_planning_name" value="#attributes.project_planning_name#">
<input type="hidden" name="step" value="3">
</cfoutput>

