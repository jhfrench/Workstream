
<!-- Admin/dsp_manage_workstream_options.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the form that allows an workstream administrator to update variables that in turn allow some cached queries to reload.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	--> session.workstream_text_size: string indicating the size the user's text size preference
	<-- [attributes.change_me]: list of variable names to update to the current date/time
	<-- [attributes.application_variables]: boolean that tells workstream to update the application name, thereby resetting all application variables
	||
	END FUSEDOC --->
<cfoutput>
<form action="index.cfm?fuseaction=Administration.manage_workstream" name="manage_workstream" method="post">
	<tr bgcolor="##e6e6e6">
		<td class="RegText">
			<label for="application_variables"><input type="checkbox" name="application_variables" value="1" id="application_variables" class="RegText"> All application variables.</label>
		</td>
	</tr>
	<tr bgcolor="##e6e6e6">
		<td class="RegText">
			<label for="icons_changed"><input type="checkbox" name="change_me" value="icons_changed" id="icons_changed" class="RegText"> Icon caching</label>
		</td>
	</tr>
	<tr bgcolor="##e6e6e6">
		<td class="RegText">
			<label for="team_changed"><input type="checkbox" name="change_me" value="team_changed" id="team_changed" class="RegText"> Team change (for task select list, main directory list, etc).</label>
		</td>
	</tr>
	<tr bgcolor="##e6e6e6">
		<td align="center" class="RegText">
			<input type="Reset" class="RegText"> | <input type="submit" value="Update" class="RegText">
		</td>
	</tr>
</form>
</cfoutput>

