
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
<cfparam name="attributes.due_date" default="">
<cfparam name="attributes.due_date_operator" default="">
</cfsilent>
<cfoutput>
	<tr>
		<td align="center">
			<input type="checkbox" name="due_date_box" value="1" <cfif len(attributes.due_date)>checked="checked"</cfif>class="RegText#session.workstream_text_size#">
		</td>
		<td class="RegText#session.workstream_text_size#">
			Due date 
		</td>
		<td class="RegText#session.workstream_text_size#">

			<select name="due_date_operator" class="RegText#session.workstream_text_size#">
				<option value="1"<cfif attributes.due_date_operator EQ 1> SELECTED="selected"</cfif>>Less Than</option>
				<option value="2"<cfif attributes.due_date_operator EQ 2> SELECTED="selected"</cfif>>Between</option>
				<option value="3"<cfif attributes.due_date_operator EQ 3> SELECTED="selected"</cfif>>Greater Than</option>
			</select>&nbsp;<input type="Text" name="due_date" size="12" value="#attributes.due_date#" onclick="gfPop.fPopCalendar(this.form.due_date);checkbox_due_date()" class="RegText#session.workstream_text_size#" maxlength="10"> 
		</td>
	</tr>
</cfoutput>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="due_date">


