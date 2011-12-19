
<!--Admin/dsp_edit_auxiliary.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr>
		<td align="left" class="RegText#session.workstream_text_size#" colspan="2">
		<a href="javascript:edit_account('#attributes.emp_id#');" onmouseover="MM_displayStatusMsg('#JSStringFormat('Edit other information for #get_user_details.lname# #get_user_details.name#.')#');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">Edit Employee Account</a>
		<br><a href="javascript:edit_employee('#attributes.emp_id#');" onmouseover="MM_displayStatusMsg('#JSStringFormat('Edit #get_user_details.lname# #get_user_details.name#.')#');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">Edit Employee Demographic Information</a>
		</td>
	</tr>
	<tr valign="top" class="RegText#session.workstream_text_size#">
		<td valign="top" class="RegText#session.workstream_text_size#">Companies this user can view:
		</td>
		<td valign="top" class="RegText#session.workstream_text_size#">
			<cfselect name="company_id" multiple="Yes" required="Yes" message="Please make sure this user has access to at least one company." size="10" class="RegText#session.workstream_text_size#">
			<cfloop query="get_link_company_emp_contact_access">
				<option value="#company_id#"#has_company_access#>#company#</option>
			</cfloop>
			</cfselect>
			</select>
		</td>
	</tr>
	<input type="hidden" name="emp_id" value="#attributes.emp_id#">
	<input type="hidden" name="make_changes" value="1">
	<input type="hidden" name="update_security_details" value="0">
</cfoutput>
