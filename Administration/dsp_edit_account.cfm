
<!--Admin/dsp_edit_account.cfm
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
<cfif session.user_account_id EQ 1>
	<cfset variables.type="text">
<cfelse>
	<cfset variables.type="password">
</cfif>
<cfset variables.module_name="">
<cfset variables.module_num="1,2,3,4,5,6,7,8,9,10,11">
<cfset variables.module_color="808080,008000,970000,000000,0000ff,008080,E2B412,78A0EB,772862,18AEB6,778899,9C615A">
</cfsilent>
<cfoutput query="get_all_modules_and_reports">
<cfif NOT CompareNoCase(report_name, "edit employee") and object_security>
	<tr>
		<td align="left" class="RegText#session.workstream_text_size#" colspan="2">
		<a href="javascript:edit_employee('#emp_id#');" onmouseover="MM_displayStatusMsg('#JSStringFormat('Edit #get_user_details.lname# #get_user_details.name#.')#');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">Edit Employee Information</a>
		</td>
	</tr>
	</cfif>
</cfoutput>	
<cfoutput query="get_user_details" maxrows="1">
	<tr valign="top" class="RegText#session.workstream_text_size#">
		<td colspan="2">&nbsp;Username: <cfinput type="Text" name="username" value="#username#" required="Yes" message="Please enter a username." class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr valign="top" class="RegText#session.workstream_text_size#">
		<td colspan="2">&nbsp;Password: <cfinput type="#variables.type#" name="password" value="#password#" required="Yes" message="Please enter a password." class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr valign="top" class="RegText#session.workstream_text_size#">
		<td colspan="2">&nbsp;Disable User: <input type="checkbox" name="disable"<cfif disable> checked</cfif>  class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<cfmodule template="../common_files/dsp_submit_options.cfm" include_reset="1" reset_value="Reset Options" submit_value="Save Settings">
	<input type="hidden" name="old_username" value="#username#">
	<input type="hidden" name="old_password" value="#password#">
	<input type="hidden" name="old_disable" value="#disable#">
	<input type="hidden" name="obj_list" value="#valuelist(get_all_modules_and_reports.object_id)#">
	<input type="hidden" name="module_list" value="#valuelist(get_all_modules_and_reports.module_id)#">
</cfoutput>
<cfoutput query="get_all_modules_and_reports">
<cfif compare(variables.module_name, module_name)>
<cfset index=ListFind(module_num,module_id)>
	<tr bgcolor="#listgetat(module_color,index)#" valign="top" class="RegText#session.workstream_text_size#">
		<td class="SubHeadText#session.workstream_text_size#<cfif module_id NEQ 4>White</cfif>">
			<input type="checkbox" name="M#module_id#"<cfif module_security> checked</cfif>  class="RegText#session.workstream_text_size#"> #module_name#
		</td>
		<td class="SubHeadText#session.workstream_text_size#<cfif module_id NEQ 4>White</cfif>">All Option</td>
	</tr>
</cfif>
	<tr bgcolor="##e6e6e6" valign="top" class="RegText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="R#object_id#"<cfif object_security> checked</cfif>  class="RegText#session.workstream_text_size#"> #report_name#
		</td>
		<td class="RegText#session.workstream_text_size#"><input type="checkbox" name="A_O#object_id#"<cfif object_all_option_editable> checked</cfif> <cfif not object_all_option> disabled</cfif> class="RegText#session.workstream_text_size#"></td>
	</tr>
	<cfset variables.module_name=module_name>
</cfoutput>
	<input type="hidden" name="emp_id" value="<cfoutput>#attributes.emp_id#</cfoutput>">
	<input type="hidden" name="make_changes" value="1">