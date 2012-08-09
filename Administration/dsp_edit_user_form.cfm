<!-- Administration/dsp_edit_user_form.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_user_form.cfm">
	<responsibilities>
		I display the form for editing user.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/5/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/6/7) I moved this template from common_files because it's only being called from the Administration module.
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

<cfoutput>
#variables.display_message#
<form name="form_edit_user" action="index.cfm?fuseaction=#attributes.fuesaction#" method="post">
<table  summary="Table displays user information">
	<tr>
		<td><label for="demographics_id">Demographics</label>:</td>
		<td><select name="demographics_id" id="demographics_id">
				<cfif NOT comparenocase(attributes.action, "add_user")><option value="" selected="selected">--Select a User--</option></cfif>
				<cfloop query="get_user_information">
				<option value="#demographics_id#"<cfif isdefined("attributes.demographics_id") AND attributes.demographics_id EQ demographics_id> selected="selected"</cfif>>#last_name#, #first_name#</option>
				</cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td><label for="user_name">Username</label>:</td>
		<td><input name="user_name" id="user_name" type="text" size="20"  maxlength="4000" <cfif NOT comparenocase(attributes.action, "edit_user")>value="#user_name#" readonly="readonly"<cfelse>value="#attributes.user_name#"</cfif>/></td>

	</tr>
	<!--- Regularly if you are an administrator that has access to the list of users, you do not need to put old password --->
	<cfif NOT isdefined("attributes.user_account_id")>
	<tr>
		<td><label for="old_password">Current Password</label>:</td>
		<td><input name="old_password" id="old_password" type="password" size="20" value="#attributes.old_password#" /></td>
	</tr>
	</cfif>
	<tr>
		<td><label for="password">New Password</label>:</td>
		<td><input name="password" id="password" type="password" size="20" value="#attributes.password#"/>
		<!--- $issue$ change this to a drop down of REF_Account_Status, with user's status pre-selected --->
		<cfif NOT comparenocase(attributes.action, "edit_user") AND get_user_information.user_account_id NEQ session.user_account_id>
			<input type="checkbox" name="account_status_id" value="1"<cfif account_status_id NEQ 1> checked</cfif>/> Lock
		</cfif>
		</td>
	</tr>
	<tr>
		<td><label for="confirm_password">Confirm Password</label>:</td>
		<td><input name="confirm_password" id="confirm_password" type="password" size="20" value="#attributes.confirm_password#"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<input name="user_account_id" type="hidden" value="#get_user_information.user_account_id#" />
			<input type="submit" name="method" alt="update user" size="20" value="<cfif NOT comparenocase(attributes.action, 'edit_user')>Update<cfelse>Add</cfif> User" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</form>
</cfoutput>
