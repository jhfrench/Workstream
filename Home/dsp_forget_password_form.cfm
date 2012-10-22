<!-- Home/dsp_forget_password_form.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_forget_password_form.cfm">
	<responsibilities>
		I provide the form where a user enters username to get password reset.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/31/2007" role="FuseCoder" comments="Created File">
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
<cfform name="form_forget_password" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend>Forgotten Password</legend>
		<div class="alert alert-info">
			Please enter your username and click the submit button. The system will send a new password to your email.
		</div>
		<div class="control-group">
			<label for="username" accesskey="u" class="control-label">Username</label>
			<div class="controls">
				<cfinput type="text" name="user_name" id="user_name" size="20" value="#xmlformat(attributes.user_name)#" required="yes" message="Please enter username" maxlength="4000" />
			</div>
		</div>
		<div class="form-actions">
			<input type="submit" name="method" value="Submit" class="btn btn-primary" />
			<input type="reset" value="Reset" class="btn" />
			<p class="help-block"><a href="index.cfm?fuseaction=Home.forget_username">Forgotten Your Username?</a></p>
		</div>
	</fieldset>
</cfform>
</cfoutput>