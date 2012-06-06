
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
	||
	END FUSEDOC --->
</cfsilent>
	<tr>
		<td align="center">
			<input type="checkbox" name="notes_box" value="1">
		</td>
		<td>
			Notes
		</td>
		<td>
			<input type="Text" name="notes" size="30" onclick="checkbox_notes()"> Separate multiple phrases with commas.
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="notes">

