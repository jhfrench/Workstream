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
<cfform name="form_forget_username" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend>Forgotten Username</legend>
		<div class="alert alert-info">
			Please enter your email address and click the submit button. The system will send your username to your email box.
		</div>
		<div class="control-group">
			<label for="email_address" class="control-label">Email Address</label>
			<div class="controls">
				<input type="email" name="email_address" id="email_address" value="#xmlformat(attributes.email_address)#" maxlength="4000" required="required" class="span4" />
				<!-- Use CF to create backup validation script <cfinput type="text" name="email_address" id="email_address" required="yes" validate="email" validateat="onserver, onsubmit" message="You must enter a valid email address." /> -->
			</div>
		</div>
		<div class="form-actions">
			<input type="submit" name="method" value="Submit" class="btn btn-primary" />
			<input type="reset" value="Reset" class="btn" />
			<p class="help-block"><a href="index.cfm?fuseaction=Home.forget_password">Forgotten Your Password?</a></p>
		</div>
	</fieldset>
</cfform>
</cfoutput>