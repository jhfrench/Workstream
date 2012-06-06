
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
 --->
<cfoutput>
	<tr>
		<td align="left" colspan="2">
		<a href="javascript:edit_account('#attributes.emp_id#');">Edit Employee Account</a>
		<br /><a href="javascript:edit_employee('#attributes.emp_id#');">Edit Employee Demographic Information</a>
		</td>
	</tr>
	<tr valign="top">
		<td valign="top">Companies this user can view:
		</td>
		<td valign="top">
			<cfselect name="company_id" multiple="Yes" required="Yes" message="Please make sure this user has access to at least one company." size="10">
			<cfloop query="get_security_company_access_access">
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
