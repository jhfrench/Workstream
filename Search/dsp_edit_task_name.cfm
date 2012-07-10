
<!--Search/dsp_team_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the pull down for team members for the search page.
	||
	Name: 
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr>
		<td align="center">
			<input type="checkbox" name="task_name_box" value="1" <cfif isdefined("attributes.Task_Name")AND len(attributes.Task_Name)>checked="checked"</cfif>>
		</td>
		<td>
			Task Name
		</td>
		<td>
			<input type="Text" name="Task_Name" size="30" onclick="checkbox_task_name()" value="#attributes.Task_Name#"> Separate multiple phrases with commas.
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_name">

</cfoutput>