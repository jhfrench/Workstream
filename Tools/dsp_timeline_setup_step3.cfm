
<!--Tools/dsp_timeline_setup_step3.cfm
	Author: Jeromy F -->
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
<cfset attributes.one_field=attributes.user_field_id>
</cfsilent>
<cfinclude template="../common_files/qry_get_user_fields.cfm">
<cfoutput>
<tr>
	<td width="50%">
	Allow these people<cfif listlen(session.workstream_selected_company_id) GT 1> or companies</cfif> to view the new timeline<br />
	<cfmodule template="../common_files/dsp_team_select.cfm" multi="1" size="5" valuelist="1">
	</td>
	<td valign="top" class="Note" width="50%"><cfset variables.start=incrementvalue(variables.start)>
		<ol type="1" start="#variables.start#" class="Note"><li>Assign access to new timeline.</li></ol></td>
</tr>
<cfif get_user_fields.field_type_id EQ 1>
<tr>
	<td>
<cfloop query="get_user_fields">
	Do not show tasks that are marked with this selection<br />
		<cfinclude template="../common_files/qry_get_drop_down_options.cfm">
		<cfselect name="hide_user_field_item_id" required="yes">
			<option value="0">Use all the options</option>
			<cfloop query="get_drop_down_options">
			<option value="#get_drop_down_options.user_field_items_id#">#get_drop_down_options.selection_title#</option>
			</cfloop>
		</cfselect>
</cfloop>
	</td>
	<td valign="top" class="Note"><cfset variables.start=incrementvalue(variables.start)>
		<ol type="1" start="#variables.start#" class="Note"><li>Optional: choose which option to use to omit tasks from timeline.</li></ol></td>
</tr>
</cfif>
<input type="hidden" name="project_id" value="#attributes.project_id#">
<input type="hidden" name="project_planning_name" value="#attributes.project_planning_name#">
<input type="hidden" name="user_field_id" value="#attributes.user_field_id#">
<input type="hidden" name="last_submitted" value="#now()#">
<input type="hidden" name="step" value="4">
</cfoutput>

