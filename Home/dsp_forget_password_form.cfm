<!-- Home/dsp_forget_password_form.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_forget_password_form.cfm">
	<responsibilities>
		I provide the form where a user enters username to get password reset.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Omoniyi Fajemidupe" type="create" date="8/31/2007" role="FuseCoder" comments="Created File">
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
<cfform name="form_forget_password" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
	<div style="position:relative;top:-30px;width:250px;color:white;">
	<table cellspacing="1" cellpadding="4" border="0" width="250" summary="table displays forgotten password information">
		<tr>
			<th colspan="2" style="color:white;"><strong>FORGOTTEN PASSWORD</strong><br />
			Please enter your username and click the submit button. The system will send a new password to your email.<br />
			</th>
		</tr>
		<tr>
			<td width="11%" align="right" style="color:white;">
				<label for="username" accesskey="u">Username</label>:
			</td>
			<td width="89%">
				<cfinput name="user_name" id="user_name" type="text" size="20" value="#xmlformat(attributes.user_name)#" required="yes" message="Please enter username" maxlength="4000">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<input name="method" type="submit" alt="submit" size="20" value="Submit">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<a href="index.cfm?fuseaction=Home.forget_username" tabindex="4" style="color:yellow;">Forgotten Your Username?</a>
			</td>
		</tr>
	</table>
	</div>
</cfform>
</cfoutput>