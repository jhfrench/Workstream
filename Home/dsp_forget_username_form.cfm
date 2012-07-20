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
<cfform name="form_forget_username" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
	<div style="position:relative;top:-30px;width:250px;color:white;">
	<table cellspacing="1" cellpadding="4" border="0" width="250" summary="table displays forgotten password information">
		<tr>
			<th colspan="2" style="color:white;"><strong>FORGOTTEN USERNAME</strong><br />
			Please enter your email address and click the submit button. The system will send your username to your email box.<br />
			</th>
		</tr>
		<tr>
			<td width="41%" align="right" style="color:white;">
				<label for="email_address">Email Address</label>:
			</td>
			<td width="59%">
				<cfinput type="text" name="email_address" id="email_address" size="20" maxlength="4000" required="yes" validate="email" validateat="onserver, onsubmit" message="You must enter a valid email address." value="#xmlformat(attributes.email_address)#" />
			</td>
		</tr>
		<tr>
			<td>&nbsp;
				
			</td>
			<td>
				<input name="method" type="submit" alt="submit" size="20" value="Submit">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<a href="index.cfm?fuseaction=Home.forget_password" style="color:yellow;">Forgotten Your Password?</a>
			</td>
		</tr>
	</table>
	</div>
</cfform>
</cfoutput>