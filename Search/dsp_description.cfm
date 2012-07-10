
<!--Search/dsp_description.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the text box for searching description entered on a task.
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
			<input type="checkbox" name="description_box" value="1">
		</td>
		<td>
			Description
		</td>
		<td>
			<input type="Text" name="description" size="30" onclick="checkbox_description()"> Separate multiple phrases with commas.
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="description">

