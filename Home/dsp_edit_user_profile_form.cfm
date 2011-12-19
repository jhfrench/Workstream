<!-- Home/dsp_edit_user_profile_form.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_user_profile_form.cfm">
	<responsibilities>
		I display the form for editing user profile.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/3/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.work_phone" default="">

<cfoutput>
<cfform action="index.cfm?fuseaction=Home.edit_user_profile" method="post" name="Edit_user_profile_form">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table head describes the table within that houses the form">
	<tr bgcolor="##cccccc"><th><strong>Edit User Profile</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays user search information">
			<tr>
				<td><label for="first_name">First Name</label>:</td>
				<td>
					<cfinput type="text" name="first_name" id="first_name" value="#get_user_information_profile.first_name#" size="50" maxlength="4000" required="yes" message="You must enter your full name">
				</td>
			</tr>
			<!--- add middle_initial here --->
			<tr>
				<td><label for="middle_initial">Middle Initial</label>:</td>
				<td>
					<cfinput type="text" name="middle_initial" value="#get_user_information_profile.middle_initial#" size="50" maxlength="50" required="no" message="You must enter your full name" />
				</td>
			</tr>
			<tr>
				<td><label for="last_name">Last Name</label>:</td>
				<td>
					<cfinput type="text" name="last_name" id="last_name" value="#get_user_information_profile.last_name#" size="50" maxlength="4000" required="yes" message="You must enter your full name" />
				</td>
			</tr>
			<tr>
				<td><label for="username">Username</label>: </td>
				<td id="username">#get_user_information_profile.user_name#</td>
			</tr>
			<tr>
				<td><label for="email_address">Email</label>:</td>
				<td>
					<cfinput type="text" name="email_address" id="email_address" value="#get_user_information_profile.email_address#" size="50" maxlength="4000" required="yes" validate="email" validateat="onserver, onsubmit" message="You must enter a valid email address." />
				</td>
			</tr>
			<tr>
				<td><label for="work_phone">Phone</label>:</td>
				<td>
					<cfset attributes.work_phone=replace(get_user_information_profile.work_phone, "+", "", "ALL")>
					<cfinput type="text" name="work_phone" id="work_phone" value="#attributes.work_phone#" size="50" maxlength="4000" required="no" validate="telephone" validateat="onserver,onsubmit">
				</td>
			</tr>
			<tr>
				<td><label for="center_id">Center</label>:</td>
				<td>
					<cfselect name="center_id" id="center_id" query="get_ref_center" value="center_id" display="abbreviation" selected="#get_user_information_profile.center_id#"></cfselect>
				</td>
			</tr>
			<tr>
				<td><label for="account_status_id">Account Status</label>:</td>
				<td>
					#get_user_information_profile.account_status#
					<input type="hidden" name="account_status_id" value="#get_user_information_profile.account_status_id#" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input name="user_account_id" type="hidden" value="#get_user_information_profile.user_account_id#">
			<input name="method" type="submit" alt="Update Information" value="Update Information">
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>