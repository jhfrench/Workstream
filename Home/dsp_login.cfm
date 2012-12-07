<!-- Home/dsp_login.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_login.cfm">
	<responsibilities>
		I display the login form.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
	<div id="display_message" class="alert alert-error">
		#variables.display_message#
	</div>
	<script type="text/javascript">
	var shake_ind=1;
	</script>
</cfif>
<form name="login_form" id="login_form" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend>Please Log In</legend>
		<div class="control-group">
			<label class="control-label" accesskey="u" for="user_name">Username</label>
			<div class="controls">
				<input type="text" name="user_name" id="user_name" value="#xmlformat(attributes.user_name)#" size="20" maxlength="4000" required="required" autofocus="autofocus" class="span2" />
				<p class="help-block"><a href="index.cfm?fuseaction=Home.forget_username">Forgotten Your Username?</a></p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="password" accesskey="p">Password</label>
			<div class="controls">
				<input type="password" name="password" id="password" value="" size="20" required="required" class="span2" />
				<p class="help-block"><a href="index.cfm?fuseaction=Home.forget_password">Forgotten Your Password?</a></p>
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="requested_page" value="#xmlformat(attributes.requested_page)#" />
			<input type="submit" name="method" value="login" class="btn btn-primary" />
		</div>
	</fieldset>
</form>
</cfoutput>
