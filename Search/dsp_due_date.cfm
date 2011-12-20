
<!--Search/dsp_due_date.cfm
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
			<input type="checkbox" name="due_date_box" value="1" class="RegText">
		</td>
		<td class="RegText">
			Due date
		</td>
		<td class="RegText">
			<select name="date_entered_operator" class="RegText">
				<option value="1">Less Than</option>
				<option value="2">Between</option>
				<option value="3">Greater Than</option>
			</select>&nbsp;<input type="Text" name="due_date" size="12" onclick="gfPop.fPopCalendar(this.form.due_date);checkbox_due_date()" class="RegText" maxlength="10">
		</td>
	</tr>
</cfoutput>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="due_date">

