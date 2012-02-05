<!-- Home/dsp_change_password.cfm
	Author: Omoniyi Fajemidupe-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_change_password.cfm">
	<responsibilities>
		I display a form for changing password. I take old password and new password.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Omoniyi Fajemidupe" type="create" date="6/5/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->
<cfparam name="attributes.old_password" default="">
<cfparam name="attributes.password" default="">
<cfparam name="attributes.confirm_password" default="">

<cfoutput>
<cfif len(variables.display_message)>
	<ul>
		#variables.display_message#
	</ul>
</cfif>
<form name="form_change_password" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong>Change Password</strong></th></tr>
	<tr bgcolor="##eeeeee"><td>
		Password rules
		<ul>
		<li>Must be 8-16 characters long</li>
		<li>Include a character from at least three of the following criteria
		<ul>
			<li>UPPER CASE</li>
			<li>lower case</li>
			<li>number (0-9)</li>
			<li>special character (!@##$%^&amp;*, etc)</li>
		</ul>
		</li>
		<li>You cannot reuse any of your last 10 passwords</li>
		</ul>
	</td></tr>
	<tr bgcolor="##eeeeee"><td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table allows  users to change password">
		<tr>
			<td width="20%"><label for="old_password">Current Password</label>:</td>
			<td width="80%"><input name="old_password" id="old_password" type="password" size="50" maxlength="50" value=""></td>
		</tr>
		<tr>
			<td width="20%"><label for="password">New Password</label>:</td>
			<td width="80%"><input name="password" id="password" type="password" size="50" maxlength="16" value=""></td>
		</tr>
		<tr>
			<td width="20%"><label for="confirm_password">Confirm Password</label>:</td>
			<td width="80%"><input name="confirm_password" id="confirm_password" type="password" size="50" maxlength="16" value=""></td>
		</tr>
		</table>
	</td></tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input name="requested_page" type="hidden" value="#attributes.requested_page#">
			<input name="user_account_id" type="hidden" value="#get_user_information.user_account_id#">
			<input name="method" type="submit" alt="Change Password" size="20" value="Change Password">
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</form>
</cfoutput>