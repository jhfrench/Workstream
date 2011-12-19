
<!--Search/dsp_team_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the pull down for team members for the search page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:58:26  daugherty
	Initial revision

	Revision 1.2  2002-04-19 11:58:57-04  french
	Removed 'used_by"search' because it performed no function. Tabbed comments over.

	Revision 1.1  2001-10-11 10:55:24-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../timekeeping/qry_get_task_stati.cfm">
	<tr valign="top">
		<td align="center">
			<input type="checkbox" name="task_stati_box" value="1" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">Task Status</td>
		<td>
			<select name="task_stati" multiple size="4" onclick="checkbox_task_stati()" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<cfoutput query="get_task_stati">
				<option value="#status_id#">#status#</option>
			</cfoutput>
			</select>
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_stati">

