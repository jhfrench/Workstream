<!-- Administration/dsp_add_user_not_in_ldap.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_add_user_not_in_ldap.cfm>
	<responsibilities>
		I display the user information in a form when new user is to be added.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head descriibes the table held within this table">
	<tr bgcolor="##cccccc">
		<th><strong>User Registration</strong></th>
	</tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays user information">
			<tr>
				<td width="20%"><label for="first_name">First Name</label>:</td>
				<td width="80%">
					<cfinput type="text" name="first_name" id="first_name" size="50" maxlength ="4000" required="yes" message="You must enter your full name" value="#attributes.first_name#">
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="middle_initial">Middle Initial</label>:</td>
				<td width="80%">
					<cfinput type="text" name="middle_initial" id="middle_initial" size="50" maxlength ="4000" required="no" value="#attributes.middle_initial#">
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="last_name">Last Name</label>:</td>
				<td width="80%">
					<cfinput type="text" name="last_name" id="last_name" size="50" maxlength ="4000" required="yes" message="You must enter your full name" value="#attributes.last_name#">
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="user_name">Username</label>:</td>
				<td width="80%">
					<cfinput type="text" name="user_name" id="user_name" size="50" maxlength ="4000" required="yes" message="You must enter a user name" value="#attributes.user_name#">
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="email_address">Email</label>:</td>
				<td width="80%">
					<input type="email" name="email_address" id="email_address" maxlength="4000" required="required" value="#attributes.email_address#" class="span3" />
					<!-- Use CF to create backup validation script <cfinput type="text" name="email_address" id="email_address" required="yes" validate="email" validateat="onserver, onsubmit" message="You must enter a valid email address."  /> -->
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="work_phone">Work Phone</label>:</td>
				<td width="80%">
					<cfinput type="text" name="work_phone" id="work_phone" size="50" maxlength ="4000" required="no" validate="telephone" validateat="onserver, onsubmit" value="#attributes.work_phone#">
				</td>
			</tr>
			<tr>
				<td width="20%"><label for="center_description">Center</label>:</td>
				<td width="80%">
					#get_ref_center.abbreviation#
					<input type="hidden" name="center_description" value="#attributes.center_description#" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td colspan="2" class="btn-group">
			<input type="hidden" name="center_id" value="#get_ref_center.center_id#" />
			<input name="method" type="submit" alt="Add User" value="Add User" class="btn btn-primary" />
			<input name="cancel" type="button" value="Cancel" onclick="this.form.action='index.cfm?fuseaction=Administration.add_user'; this.form.reset(); this.form.submit();" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfoutput>
