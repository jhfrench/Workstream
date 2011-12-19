
<!--Search/dsp_notes.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the text box for searching notes entered on a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:58:19  daugherty
	Initial revision

	Revision 1.0  2001-10-17 10:39:54-04  french
	Created file to allow user to search for tasks with notes containing some text specified by the user.

	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
	<tr>
		<td align="center">
			<input type="checkbox" name="notes_box" value="1" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			Notes
		</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<input type="Text" name="notes" size="30" onclick="checkbox_notes()" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"> Separate multiple phrases with commas.
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="notes">

