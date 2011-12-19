
<!--timekeeping/pag_change_password.cfm
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
<cfif isdefined("attributes.new_pass")>
	<cfinclude template="qry_get_user_details.cfm">
	<cfif NOT comparenocase(get_user_details.password,attributes.current_pass) AND NOT comparenocase(attributes.new_pass,attributes.confirm_pass)>
	<cfinclude template="act_change_pass.cfm">
	<cfoutput>
	<table align="center">
		<tr valign="top" align="center">
			<td colspan="2" class="SubHeadText#session.workstream_text_size#">Your password was successfully changed.</td>
		</tr>
	</table></cfoutput>
	<cfelse>
	<cfoutput>
	<table align="center">
		<tr valign="top" align="center">
			<td colspan="2" class="SubHeadText#session.workstream_text_size#">Your password can not be changed.</td>
		</tr>
		<tr valign="top">
			<td align="right" width="50%" class="SubHeadText#session.workstream_text_size#">This can be caused by:</td>
			<td class="RegText#session.workstream_text_size#">
				-you did not enter your current password correctly<br>
				-your new paasword does not match the confirmation password
			</td>
		</tr>
		<tr valign="top" align="center">
			<td colspan="2" class="SubHeadText#session.workstream_text_size#"><a href="index.cfm?fuseaction=change_password" class="SubHeadText#session.workstream_text_size#">Please try again.</a></td>
		</tr>
	</table>
	</cfoutput>
	</cfif>
<cfelse>
<cfform action="index.cfm?fuseaction=Administration.change_password" name="change_password" method="POST">
<cfinclude template="qry_get_user_details.cfm">
<cfoutput>
<table align="center" bgcolor="##cccccc" border="0" cellpadding="0" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;Password Change (#get_user_details.lname#, #get_user_details.name#)" section_color="808080" colspan="5" gutter=0 title_class="HeadText#session.workstream_text_size#">
	<tr valign="top" class="RegText#session.workstream_text_size#">
		<td class="SubHeadText#session.workstream_text_size#">&nbsp;Please choose a new password:</td>
	</tr>
	<tr>
		<td class="RegText#session.workstream_text_size#">
			&nbsp;Current Password:
		</td>
		<td>
			<cfinput type="Password" name="current_pass" maxlength="50" size="11" required="Yes" message="Please enter a password." class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr>
		<td class="RegText#session.workstream_text_size#">
			&nbsp;New Password: 
		</td>
		<td>
			<cfinput type="Password" name="new_pass" maxlength="50" size="11" required="Yes" message="Please enter a password." class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr>
		<td class="RegText#session.workstream_text_size#">
			&nbsp;Confirm Password: 
		</td>
		<td>
			<cfinput type="Password" name="confirm_pass" maxlength="50" size="11" required="Yes" message="Please enter a password." class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr>
		<td colspan="2" class="Note#session.workstream_text_size#">
			Please note that if your password is succesfully changed you will immediately have to log back in. 
		</td>
	</tr>
	</tr>
		<cfmodule template="../common_files/dsp_submit_options.cfm" include_reset="0" submit_value="Save This Password">
</table>
</cfoutput>
</cfform>
</cfif>

