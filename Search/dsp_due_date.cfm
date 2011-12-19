
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
	Revision 1.1  2006/05/04 18:54:42  csy
	Task 42743 Dynimically populate the due date operator drop down list.

	Revision 1.0  2005-02-15 15:58:18-05  daugherty
	Initial revision

	Revision 1.1  2003-01-08 10:39:11-05  blell
	Added new calendar

	Revision 1.0  2001-10-17 10:39:27-04  french
	Created file to display date field search capability.

	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr>
		<td align="center">
			<input type="checkbox" name="due_date_box" value="1" class="RegText#session.workstream_text_size#">
		</td>
		<td class="RegText#session.workstream_text_size#">
			Due date
		</td>
		<td class="RegText#session.workstream_text_size#">
			<select name="date_entered_operator" class="RegText#session.workstream_text_size#">
				<option value="1">Less Than</option>
				<option value="2">Between</option>
				<option value="3">Greater Than</option>
			</select>&nbsp;<input type="Text" name="due_date" size="12" onclick="gfPop.fPopCalendar(this.form.due_date);checkbox_due_date()" class="RegText#session.workstream_text_size#" maxlength="10">
		</td>
	</tr>
</cfoutput>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="due_date">

