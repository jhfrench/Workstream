<!-- Administration/dsp_add_user_in_ldap.cfm
	Author: Jeromy French -->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_add_user_in_ldap.cfm">
	<responsibilities>
		I help the administrator to add new user using HQTS information from HQ.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="9/6/2007" role="FuseCoder" comments="Created File">
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

<cfoutput>
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong>User Registration</strong></th></tr><cfif application.application_specific_settings.allow_non_demographics_user_ind>
	<tr>
		<td align="left" class="menuItem" bgcolor="##eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'##5394bd',endcolor:'##5394bd',restorecolor:'##5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'##999999',endcolor:'##bbbbbb',restorecolor:'##eeeeee'});"><a href="index.cfm?fuseaction=Administration.add_user">Add a user that does not show in the demographics warehouse</a></td>
	</tr></cfif>
	<cfloop query="get_external_demographics_data">
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays user details">
			<tr>
				<td width="20%"><label for="first_name">First Name</label>:</td>
				<td width="80%">
					<cfinput type="text" name="first_name" id="first_name" size="50" maxlength ="4000" required="yes" message="You must enter your full name" value="#givenname#">
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="middle_initial">Middle Initial</label>:</td>
				<td width="80%">
					<cfinput type="text" name="middle_initial" id="middle_initial" size="50" maxlength="4000" required="no" value="#initials#">
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="last_name">Last Name</label>:</td>
				<td width="80%">
					<cfinput type="text" name="last_name" id="last_name" size="50" maxlength ="4000" required="yes" message="You must enter your full name" value="#sn#">
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="user_name">Username</label>:</td>
				<td width="80%">#agencyuid#
					<input type="hidden" name="user_name" id="user_name" size="50" maxlength ="4000" required="yes" message="You must enter a user name" value="#agencyuid#" />
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="email_address">Email</label>:</td>
				<td width="80%">
					<cfinput type="text" name="email_address" id="email_address" size="50" maxlength="4000" required="yes" validate="email" validateat="onserver, onsubmit" message="You must enter a valid email address." value="#nasaPrimaryEmail#" />
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="work_phone">Work Phone</label>:</td>
				<td width="80%">
					<cfset attributes.work_phone=replace(telephonenumber, "+", "", "ALL")>
					<cfinput type="text" name="work_phone" id="work_phone" size="50" maxlength ="4000" required="no" validate="telephone" validateat="onserver, onsubmit" value="#attributes.work_phone#">
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="center_description">Center</label>:</td>
				<td width="80%">
					#get_ref_center.abbreviation#
				</td>
			</tr>
		</table>
		</td>
	</tr>
	</cfloop>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="center_id" value="#get_ref_center.center_id#" />
			<input type="hidden" name="uupic" value="#attributes.uupic#" />
			<cfinput name="method" type="submit" alt="Add User" value="Add User">
			<cfinput name="cancel" type="button" value="Cancel" alt="cancel" onclick="this.form.action='index.cfm?fuseaction=Administration.add_user'; this.form.reset(); this.form.submit();">
		</td>
	</tr>
</table>
</div>
</cfoutput>