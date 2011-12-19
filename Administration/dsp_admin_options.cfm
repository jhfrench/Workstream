
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
Revision 1.4  2006/09/15 22:26:35  csy
<>

Revision 1.0  2006-08-16 09:31:59-04  csy
Initial revision

Revision 1.3  2006-07-07 14:01:26-04  csy
task 43700 Included instructions to set and save a profile

Revision 1.2  2006-05-31 15:21:37-04  csy
<>

Revision 1.1  2006-05-04 10:43:56-04  csy
task 43700 Modified code so that user's new selection of companies to be viewed is saved to the database. When a user logs into workstream the next time ,his/her last selection fo company names in the "View These Companies" drop down list  is still  highlighted.

Revision 1.0  2005-02-15 15:27:22-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:38-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfinclude template="../common_files/qry_get_teams.cfm">
<input type="hidden" name="evaluate_app_options">
<cfoutput>
	<tr valign="top">
		<td class="SubHeadText#session.workstream_text_size#">
			Text Size<br>
			<select name="text_size" class="RegText#session.workstream_text_size#">
				<option value="Lg"<cfif NOT compare(session.workstream_text_size,"Lg")> selected</cfif>>Large</option>
				<option value="Md"<cfif NOT compare(session.workstream_text_size,"Md")> selected</cfif>>Medium</option>
				<option value="Sm"<cfif NOT compare(session.workstream_text_size,"Sm")> selected</cfif>>Small</option>
			</select>
			
			<p class="SubHeadText#session.workstream_text_size#">
			<cfinclude template="dsp_save_profile_instructions.cfm">
			<a href="index.cfm?fuseaction=save_profile" class="RegText#session.workstream_text_size#"><img src="#request.dir_level##application.application_specific_settings.image_dir#save_button.gif" width="15" height="15" alt="Save the current settings to a profile." border="0">&nbsp;Save the current settings to a profile</a><br>
			<a href="index.cfm?fuseaction=load_profile" class="RegText#session.workstream_text_size#"><img src="#request.dir_level##application.application_specific_settings.image_dir#load_button.gif" width="16" height="13" alt="Load a previously saved profile." border="0">&nbsp;Load a previously saved profile</a>
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			View These Companies<br>
			<select name="company_select_list" size="#min(get_teams.recordcount,5)#" multiple class="RegText#session.workstream_text_size#"></cfoutput>
				<cfoutput query="get_teams">
				<option value="#company_id#"<cfif listfind(session.workstream_company_select_list,company_id)> selected</cfif>>#company#</option></cfoutput><cfoutput>
			</select>
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Engagement list display order<br>
			<cfselect name="project_list_order" required="yes" message="Please choose an order for your engagement list." class="RegText#session.workstream_text_size#">
				<option value="1"<cfif session.workstream_project_list_order EQ 1> selected</cfif>>Engagement (Code)</option>
				<option value="2"<cfif session.workstream_project_list_order EQ 2> selected</cfif>>Code - Engagement</option>
			</cfselect>
		</td>
	</tr>
</cfoutput>

