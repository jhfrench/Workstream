
<!--Search/dsp_edit_date_entered.cfm
	Author: Jeromy F Sy -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the form fields that are used to edit search tasks 
	||
	Edits:
	$Log$
	Revision 1.2  2006/05/04 18:59:20  csy
	Task 42743 Dynamically populated the date entered operator drop down list.

	Revision 1.1  2006-05-03 12:04:03-04  csy
	task42742 Did some clean up by getting rid of some old comments

	Revision 1.0  2006-04-07 14:12:22-04  csy
	task 42742 Edit task date entered field

	

	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
<cfparam name="attributes.date_entered_operator" default="">
<cfparam name="attributes.date_entered" default="">
</cfsilent>
<cfoutput>
	<tr>
		<td align="center">
			<input type="checkbox" name="date_entered_box" value="1"<cfif isdefined("attributes.date_entered_box") AND IsDate(attributes.date_entered)>checked="checked"</cfif> class="RegText#session.workstream_text_size#">
		</td>
		<td class="RegText#session.workstream_text_size#">
			Date entered
		</td>
		<td class="RegText#session.workstream_text_size#">
			<select name="date_entered_operator" class="RegText#session.workstream_text_size#">
				<option value="1"<cfif attributes.due_date_operator EQ 1> SELECTED="selected"</cfif>>Less Than</option>
				<option value="2"<cfif attributes.due_date_operator EQ 2> SELECTED="selected"</cfif>>Between</option>
				<option value="3"<cfif attributes.due_date_operator EQ 3> SELECTED="selected"</cfif>>Greater Than</option>
			</select>&nbsp;<input type="Text" name="date_entered" size="12" value="#attributes.date_entered#"  onclick="gfPop.fPopCalendar(this.form.date_entered);checkbox_date_entered()" class="RegText#session.workstream_text_size#" maxlength="10">
		</td>
	</tr>
</cfoutput>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="date_entered">

