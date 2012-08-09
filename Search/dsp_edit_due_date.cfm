
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
<cfparam name="attributes.due_date" default="">
<cfparam name="attributes.due_date_operator" default="">
</cfsilent>
<cfoutput>
	<tr>
		<td  class="btn-group">
			<input type="checkbox" name="due_date_box" value="1" <cfif len(attributes.due_date)>checked="checked"</cfif>class="RegText">
		</td>
		<td>
			Due date 
		</td>
		<td>

			<select name="due_date_operator">
				<option value="1"<cfif attributes.due_date_operator EQ 1> SELECTED="selected"</cfif>>Less Than</option>
				<option value="2"<cfif attributes.due_date_operator EQ 2> SELECTED="selected"</cfif>>Between</option>
				<option value="3"<cfif attributes.due_date_operator EQ 3> SELECTED="selected"</cfif>>Greater Than</option>
			</select>&nbsp;
			<input type="date" name="due_date" id="due_date" min="2011-09-01" max="#dateformat(now()+30, 'yyyy-mm-dd')#" value="#dateformat(attributes.due_date, 'yyyy-mm-dd')#" maxlength="10" class="span6 date" />
		</td>
	</tr>
</cfoutput>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="due_date">


