
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
	Revision 1.1  2006/05/04 18:53:57  csy
	Task 42743 Dynimically populate the date entered operator drop down list.

	Revision 1.0  2005-02-15 15:58:17-05  daugherty
	Initial revision

	Revision 1.1  2003-01-08 10:39:24-05  blell
	Added new calendar

	Revision 1.0  2001-10-17 10:39:26-04  french
	Created file to display date field search capability.

	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr>
		<td align="center">
			<input type="checkbox" name="date_entered_box" value="1" class="RegText#session.workstream_text_size#">
		</td>
		<td class="RegText#session.workstream_text_size#">
			Date entered
		</td>
		<td class="RegText#session.workstream_text_size#">
			<select name="date_entered_operator" class="RegText#session.workstream_text_size#">
				<cfloop query="get_date_operator">
			<option value="#operator_ind#">#operator#</option>
		</cfloop>
			
			</select>&nbsp;<input type="Text" name="date_entered" size="12"  onclick="gfPop.fPopCalendar(this.form.date_entered);checkbox_date_entered()" class="RegText#session.workstream_text_size#" maxlength="10">
		</td>
	</tr>
</cfoutput>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="date_entered">

