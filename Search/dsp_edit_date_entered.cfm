
<!--Search/dsp_edit_date_entered.cfm
	Author: Jeromy F Sy -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the form fields that are used to edit search tasks 
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="attributes.date_entered_operator" default="">
<cfparam name="attributes.date_entered" default="">
</cfsilent>
<cfoutput>
	<tr>
		<td align="center">
			<input type="checkbox" name="date_entered_box" value="1"<cfif isdefined("attributes.date_entered_box") AND IsDate(attributes.date_entered)>checked="checked"</cfif> class="RegText">
		</td>
		<td class="RegText">
			Date entered
		</td>
		<td class="RegText">
			<select name="date_entered_operator" class="RegText">
				<option value="1"<cfif attributes.due_date_operator EQ 1> SELECTED="selected"</cfif>>Less Than</option>
				<option value="2"<cfif attributes.due_date_operator EQ 2> SELECTED="selected"</cfif>>Between</option>
				<option value="3"<cfif attributes.due_date_operator EQ 3> SELECTED="selected"</cfif>>Greater Than</option>
			</select>&nbsp;<input type="Text" name="date_entered" size="12" value="#attributes.date_entered#"  onclick="gfPop.fPopCalendar(this.form.date_entered);checkbox_date_entered()" class="RegText" maxlength="10">
		</td>
	</tr>
</cfoutput>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="date_entered">

