<!-- Administration/dsp_administer_user_menu.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_administer_user_menu.cfm">
	<responsibilities>
		I display the user information in a form when existing users are being edited.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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

<cfif NOT comparenocase(attributes.method, "cancel")>
	<cflocation url="index.cfm?fuseaction=Administration.manage_user_profiles">
</cfif>

<cfoutput>
<cfif len(attributes.display_message)><div class="alert">#attributes.display_message#</div></cfif>
<h2>
	<ul class="breadcrumb">
		<li><a href="index.cfm?fuseaction=Administration.manage_user_profiles">Manage User Profiles</a> <span class="divider">/</span></li>
		<li class="active">#get_user_information.first_name# #get_user_information.last_name#</li>
	</ul>
</h2>
<a href="javascript:edit_navigation_access(#attributes.user_account_id#);" class="btn">Manage User's Access</a> <a href="javascript:view_user_activity('#attributes.user_account_id#');" class="btn">View User Activity</a>
<cfform name="administer_user_menu" action="index.cfm?fuseaction=Administration.administer_user_menu" method="post" class="form-horizontal">
	<fieldset>
		<legend><h3>Edit User</h3></legend>
		<div class="control-group">
			<label class="control-label" for="first_name">First Name</label>
			<div class="controls">
				<cfinput type="text" name="first_name" id="first_name" size="50" maxlength="4000" required="yes" message="You must enter your full name" value="#get_user_information.first_name#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="middle_initial">Middle Initial</label>
			<div class="controls">
				<cfinput type="text" name="middle_initial" id="middle_initial" size="50" maxlength="4000" required="no" message="You must enter your full name" value="#get_user_information.middle_initial#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="last_name">Last Name</label>
			<div class="controls">
				<cfinput type="text" name="last_name" id="last_name" size="50" maxlength="4000" required="yes" message="You must enter your full name" value="#get_user_information.last_name#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="username">Username</label>
			<div class="controls">
				<span id="username">#get_user_information.user_name#</span>
				<p class="help-block">Usernames cannot be changed.</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="email_address">Email</label>
			<div class="controls">
				<input type="email" name="email_address" id="email_address" value="#get_user_information.email_address#" maxlength="4000" required="required" class="span3" />
				<!-- Use CF to create backup validation script <cfinput type="text" name="email_address" id="email_address" required="yes" validate="email" message="You must enter a valid email address." /> -->
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="work_phone">Phone</label>
			<div class="controls">
				<cfset attributes.work_phone=replace(get_user_information.work_phone, "+", "", "ALL")>
				<cfinput type="text" name="work_phone" id="work_phone" size="50" maxlength="4000" required="no" validate="telephone" value="#attributes.work_phone#">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="center_id">Center</label>
			<div class="controls">
				<cfselect name="center_id" id="center_id" query="get_ref_center" value="center_id" display="abbreviation" selected="#get_user_information.center_id#">
				</cfselect>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="account_status_id">Account Status</label>
			<div class="controls">
				<!--- only allow to lock and unlock when the user information being modified is not the current user --->
				<cfif get_user_information.user_account_id NEQ variables.user_identification>
					<cfloop query="get_ref_account_status">
						<label class="radio inline" for="account_status_id_#account_status_id#"><input type="radio" name="account_status_id" id="account_status_id_#account_status_id#" value="#account_status_id#"<cfif get_user_information.account_status_id EQ account_status_id> checked="checked"</cfif>/>#description#</label>
					</cfloop>
				<cfelse>
					#get_user_information.account_status#
					<input type="hidden" name="account_status_id" value="#get_user_information.account_status_id#" />
				</cfif>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="password_reset">Password</label>
			<div class="controls" id="password_reset">
				<a href="javascript:reset_password(#attributes.user_account_id#);" onclick="hide();" title="Resetting the password will make the system send a new, random, password to the user's email address on file." class="btn btn-danger"><i class="icon-random icon-white"></i> Reset Password</a>
				<p class="help-block">Password last updated #dateformat(get_user_password.created_date, "m/d/yyyy")# #timeformat(get_user_password.created_date)# by #get_user_password.first_name# #get_user_password.last_name#.</p>
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="user_account_id" value="#get_user_information.user_account_id#" />
			<input type="hidden" name="uupic" value="#get_user_information.uupic#" />
			<input type="submit" name="method" value="Update Information" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>