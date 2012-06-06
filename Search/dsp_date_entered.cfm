
<!--Search/dsp_date_entered.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the form fields that are used to search tasks by when they were entered into workstream.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr>
		<td align="center">
			<input type="checkbox" name="date_entered_box" value="1">
		</td>
		<td>
			Date entered
		</td>
		<td>
			<select name="date_entered_operator">
				<option value="1">Less Than</option>
				<option value="2">Between</option>
				<option value="3">Greater Than</option>
			</select>&nbsp;<input type="Text" name="date_entered" size="12"  onclick="gfPop.fPopCalendar(this.form.date_entered);checkbox_date_entered()" maxlength="10">
		</td>
	</tr>
</cfoutput>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="date_entered">

