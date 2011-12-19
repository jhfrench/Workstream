<!-- Home/dsp_login.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_login.cfm">
	<responsibilities>
		I display the login form.
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<form name="form_login" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
	<table border="0" cellpadding="0" cellspacing="0" summary="Table displays login form">
		<tr>
			<td align="right" class="formtextlabel">
				<img src="images/spacer.gif" width="100" height="1" alt="" border="0"><br />
				<label for="user_name" accesskey="u" class="formtextlabel">Username</label>:
			</td>
			<td>
				<img src="images/spacer.gif" width="180" height="1" alt="" border="0"><br />
				<input type="text" name="user_name" id="user_name" value="#xmlformat(attributes.user_name)#" size="20" maxlength="4000" tabindex="1">
			</td>
		</tr>
		<tr>
			<td align="right" class="formtextlabel">
				<img src="images/spacer.gif" width="100" height="1" alt=""><br />
				<label for="password" accesskey="p" class="formtextlabel">Password</label>:
			</td>
			<td><input type="password" name="password" id="password" value="" size="20" tabindex="2"></td>
		</tr>
		<tr>
			<td>
				<img src="images/spacer.gif" width="100" height="29" alt="">
			</td>
			<td>
				<input type="hidden" name="requested_page" value="#xmlformat(attributes.requested_page)#">
				<input type="submit" name="method" value="Login" alt="Login" size="20" tabindex="3">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<div id="response" style="color:yellow;">#variables.display_message#&nbsp;</div>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<a href="index.cfm?fuseaction=Home.forget_username" tabindex="4" style="color:yellow;">Forgotten Your Username?</a><br />
				<a href="index.cfm?fuseaction=Home.forget_password" tabindex="4" style="color:yellow;">Forgotten Your Password?</a>
			</td>
		</tr>
	</table>
</form>
</cfoutput>

<script language="javascript">
<cfif len(variables.display_message)>
	setTimeout("new Effect.Shake('loginB');",1250);
</cfif>
</script>