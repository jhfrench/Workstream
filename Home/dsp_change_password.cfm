<!-- Home/dsp_change_password.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_change_password.cfm">
	<responsibilities>
		I display a form for changing password. I take old password and new password.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/5/2007" role="FuseCoder" comments="Created File">
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
<cfif len(variables.display_message)>
	<ul>
		#variables.display_message#
	</ul>
</cfif>
<form name="form_change_password" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend><h1>Change Password</h1></legend>
			<div class="alert alert-info">
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
			</div>
			<div class="control-group">
				<label for="old_password" class="control-label">Current password</label>
				<div class="controls">
					<input name="old_password" id="old_password" type="password" size="50" maxlength="50" value="">
					<p class="help-block">The last password you used to login</p>
				</div>
			</div>
			<div class="control-group">
				<label for="password" class="control-label">New password</label>
				<div class="controls">
					<input name="password" id="password" type="password" size="50" maxlength="16" value="">
				</div>
			</div>
			<div class="control-group">
				<label for="confirm_password" class="control-label">Confirm password</label>
				<div class="controls">
					<input name="confirm_password" id="confirm_password" type="password" size="50" maxlength="16" value="" />
				</div>
			</div>
			<div class="form-actions">
				<input type="hidden" name="requested_page" value="#attributes.requested_page#" />
				<input type="hidden" name="user_account_id" value="#get_user_information.user_account_id#" />
				<input type="submit" name="method" size="20" value="Change Password" class="btn btn-primary" />
				<input type="reset" value="Reset" class="btn" />
			</div>
	</fieldset>
</form>
</cfoutput>