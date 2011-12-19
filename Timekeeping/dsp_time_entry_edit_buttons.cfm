
<!--Timekeeping/dsp_time_entry_edit_buttons.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the buttons that allow a user to delete, edit, or retreat from the time entry/notes edit page..
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> attributes.referer: string that incidicates which fuseaction to pursue.
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
<cfif time_entry_edit.date GTE dateformat(now()-variables.go_back_to,"mm/dd/yy")>
	<tr align="center" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td colspan="6">
			<input type="submit" name="save" value="Save Changes" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
	</tr>
</cfif>
	<tr align="center" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td colspan="6">
			<a href="index.cfm?fuseaction=<cfoutput>#attributes.referer#</cfoutput>" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">Return to the previous page without saving.</a>
		</td>
	</tr>

