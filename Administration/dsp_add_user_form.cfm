<!-- Administration/dsp_add_user_form.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_external_demographics_add_user_form.cfm">
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

<cfparam name="attributes.email_address" default="">
<cfparam name="attributes.first_name" default="">
<cfparam name="attributes.last_name" default="">
<cfparam name="attributes.middle_initial" default="">
<cfparam name="attributes.reset" default="">
<cfparam name="attributes.user_name" default="">
<cfparam name="attributes.uupic" default="">
<cfparam name="attributes.work_phone" default="">

<cfform action="index.cfm?fuseaction=Administration.add_user" method="POST" id="add_user_form" class="form-horizontal">
<cfoutput>
	<legend><h2>Add User</h2></legend>
	<div class="control-group">
		<label class="control-label" for="first_name">First Name</label>
		<div class="controls">
			<cfinput type="text" name="first_name" id="first_name" size="50" maxlength ="4000" required="yes" message="You must enter your full name" value="#attributes.first_name#" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="middle_initial">Middle Initial</label>
		<div class="controls">
			<cfinput type="text" name="middle_initial" id="middle_initial" size="50" maxlength ="4000" required="no" value="#attributes.middle_initial#" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="last_name">Last Name</label>
		<div class="controls">
			<cfinput type="text" name="last_name" id="last_name" size="50" maxlength ="4000" required="yes" message="You must enter your full name" value="#attributes.last_name#" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="user_name">Username</label>
		<div class="controls">
			<cfinput type="text" name="user_name" id="user_name" size="50" maxlength ="4000" required="yes" message="You must enter a user name" value="#attributes.user_name#" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="email_address">Email</label>
		<div class="controls">
			<input type="email" name="email_address" id="email_address" maxlength="4000" required="required" value="#attributes.email_address#" class="span3" />
			<!-- Use CF to create backup validation script <cfinput type="text" name="email_address" id="email_address" required="yes" validate="email" message="You must enter a valid email address."  /> -->
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="work_phone">Work Phone</label>
		<div class="controls">
			<cfinput type="text" name="work_phone" id="work_phone" size="50" maxlength ="4000" required="no" validate="telephone" value="#attributes.work_phone#" />
		</div>
	</div>
	<div class="form-actions">
		<input name="method" type="submit" alt="Add User" value="Add User" class="btn btn-primary" />
		<input name="cancel" type="button" value="Cancel" onclick="this.form.action='index.cfm?fuseaction=Administration.add_user'; this.form.reset(); this.form.submit();" class="btn" />
	</div>
</cfoutput>
</cfform>