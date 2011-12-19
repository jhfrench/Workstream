<!-- Administration/dsp_administer_user_menu.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_administer_user_menu.cfm">
	<responsibilities>
		I display the user information in a form when existing users are being edited.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/19/10) Cleaning up verbiage and row coloring.
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

<cfif not comparenocase(attributes.method, "cancel")>
	<cflocation url="index.cfm?fuseaction=Administration.manage_user_profiles">
</cfif>

<cfoutput>
#attributes.display_message#
<h2 style="margin:0px" id="top-side"><a href="index.cfm?fuseaction=Administration.manage_user_profiles">Manage User Profiles</a> &gt #get_user_information.first_name# #get_user_information.last_name#</h2>
<p>
	Password last updated #dateformat(get_user_password.created_date, "mm/dd/yyyy")# #timeformat(get_user_password.created_date)# by #get_user_password.first_name# #get_user_password.last_name#.
</p>
<a href="javascript:reset_password(#attributes.user_account_id#);">Reset Password</a><br />
<a href='javascript:edit_navigation_access(#attributes.user_account_id#);'>Manage User's Access</a><br />
<a href="javascript:view_user_activity('#attributes.user_account_id#');">View User Activity</a>
<cfform action="index.cfm?fuseaction=Administration.administer_user_menu" method="post" name="Edit_user_form">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="options for editing a user">
	<tr bgcolor="##cccccc"><th><strong>Edit User</strong></th></tr>
	<tr bgcolor="##eeeeee"><td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="options for editing a user">
		<tr>
			<td><label for="first_name">First Name</label>:</td>
			<td>
				<cfinput type="text" name="first_name" id="first_name" size="50" maxlength ="4000" required="yes" message="You must enter your full name" value="#get_user_information.first_name#">
			</td>
		</tr>
		<tr>
			<td><label for="middle_initial">Middle Initial</label>:</td>
			<td>
				<cfinput type="text" name="middle_initial" id="middle_initial" size="50" maxlength ="4000" required="no" message="You must enter your full name" value="#get_user_information.middle_initial#">
			</td>
		</tr>
		<tr>
			<td><label for="last_name">Last Name</label>:</td>
			<td>
				<cfinput type="text" name="last_name" id="last_name" size="50" maxlength ="4000" required="yes" message="You must enter your full name" value="#get_user_information.last_name#">
			</td>
		</tr>
		<tr>
			<td><label for="username">Username</label>:</td>
			<td>#get_user_information.user_name#</td>
		</tr>
		<tr>
			<td><label for="email_address">Email</label>:</td>
			<td>
				<cfinput type="text" name="email_address" id="email_address" size="50" maxlength="4000" required="yes" validate="email" validateat="onserver, onsubmit" message="You must enter a valid email address." value="#get_user_information.email_address#" />
			</td>
		</tr>
		<tr>
			<td><label for="work_phone">Phone</label>:</td>
			<td>
				<cfset attributes.work_phone=replace(get_user_information.work_phone, "+", "", "ALL")>
				<cfinput type="text" name="work_phone" id="work_phone" size="50" maxlength ="4000" required="no" validate="telephone" validateat="onserver,onsubmit" value="#attributes.work_phone#">
			</td>
		</tr>
		<tr>
			<td><label for="center_id">Center</label>:</td>
			<td>
				<cfselect name="center_id" id="center_id" query="get_ref_center" value="center_id" display="abbreviation" selected="#get_user_information.center_id#"></cfselect>
			</td>
		</tr>
		<tr>
			<td><label for="account_status_id">Account Status</label>:</td>
			<td>
				<!--- only allow to lock and unlock when the user information being modified is not the current user --->
				<cfif get_user_information.user_account_id NEQ session.user_account_id>
					<cfloop query="get_ref_account_status">
						<input type="radio" name="account_status_id" id="account_status_id_#account_status_id#" value="#account_status_id#"<cfif get_user_information.account_status_id EQ account_status_id> checked="checked"</cfif>/><label for="account_status_id_#account_status_id#">#description#</label>
					</cfloop>
				<cfelse>
					#get_user_information.account_status#
					<input type="hidden" name="account_status_id" value="#get_user_information.account_status_id#" />
				</cfif>
			</td>
		</tr>
		</table>
	</td></tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="user_account_id" value="#get_user_information.user_account_id#" />
			<input type="hidden" name="uupic" value="#get_user_information.uupic#" />
			<input type="submit" name="method" value="Update Information" alt="Update Information" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>