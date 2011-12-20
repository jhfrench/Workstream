
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
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_get_task_stati.cfm">
	<tr valign="top">
		<td align="center">
			<input type="checkbox" name="task_stati_box" value="1" <cfif len(attributes.task_stati)>checked="checked"</cfif> class="RegText">
		</td>
		<td class="RegText">Task Status</td>
		<td>
			<select name="task_stati" multiple size="4" onclick="checkbox_task_stati()" class="RegText">
			<cfoutput query="get_task_stati">
				<option value="#status_id#"<cfif ListFind(attributes.task_stati, get_task_stati.status_id,",")>selected</cfif>>#status#</option>
			</cfoutput>
			</select>
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_stati">


