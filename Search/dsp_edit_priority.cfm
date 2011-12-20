
<!--Search/dsp_priority.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the pull down for task priorities for the search page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_get_priorities.cfm">
<cfoutput>
	<tr valign="top">
		<td align="center">
			<input type="checkbox" name="priority_id_box" value="1" <cfif len(attributes.priority_id)>checked="checked"</cfif>class="RegText#session.workstream_text_size#">
		</td>
		<td class="RegText#session.workstream_text_size#">Priority</td>
		<td>
			<select name="priority_id" multiple size="3" onclick="checkbox_priority_id()" class="RegText#session.workstream_text_size#"></cfoutput>
			<cfoutput query="get_priorities">
				<option value="#priority_id#" <cfif ListFind(attributes.priority_id,get_priorities.priority_id,",")>selected</cfif>>#description#</option>
			</cfoutput>
			</select>
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="priority_id">

