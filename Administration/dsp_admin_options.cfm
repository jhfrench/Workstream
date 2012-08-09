
<!--Admin/dsp_admin_options.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the timekeeping options.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfinclude template="../common_files/qry_get_teams.cfm">
<input type="hidden" name="evaluate_app_options">
<cfoutput>
	<tr valign="top">
		<td class="SubHeadText">
			Text Size<br />
			<select name="text_size">
				<option value="Lg"<cfif NOT compare(session.workstream_text_size,"Lg")> selected="selected"</cfif>>Large</option>
				<option value="Md"<cfif NOT compare(session.workstream_text_size,"Md")> selected="selected"</cfif>>Medium</option>
				<option value="Sm"<cfif NOT compare(session.workstream_text_size,"Sm")> selected="selected"</cfif>>Small</option>
			</select>

			<p class="SubHeadText">
			<cfinclude template="dsp_save_profile_instructions.cfm">
			<a href="index.cfm?fuseaction=save_profile"><img src="#request.dir_level##application.application_specific_settings.image_dir#save_button.gif" width="15" height="15" alt="Save the current settings to a profile." border="0">&nbsp;Save the current settings to a profile</a><br />
			<a href="index.cfm?fuseaction=load_profile"><img src="#request.dir_level##application.application_specific_settings.image_dir#load_button.gif" width="16" height="13" alt="Load a previously saved profile." border="0">&nbsp;Load a previously saved profile</a>
		</td>
		<td class="SubHeadText">
			View These Companies<br />
			<select name="company_select_list" size="#min(get_teams.recordcount,5)#" multiple></cfoutput>
				<cfoutput query="get_teams">
				<option value="#company_id#"<cfif listfind(session.workstream_selected_company_id,company_id)> selected="selected"</cfif>>#company#</option></cfoutput><cfoutput>
			</select>
		</td>
		<td class="SubHeadText">
			Project list display order<br />
			<cfselect name="project_list_order" required="yes" message="Please choose an order for your engagement list.">
				<option value="1"<cfif session.workstream_project_list_order EQ 1> selected="selected"</cfif>>Project (Code)</option>
				<option value="2"<cfif session.workstream_project_list_order EQ 2> selected="selected"</cfif>>Code - Project</option>
			</cfselect>
		</td>
	</tr>
</cfoutput>

