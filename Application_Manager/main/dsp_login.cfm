<!-- main/dsp_login.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_login.cfm">
	<responsibilities>
		I display the login form.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
			<td align="right">
				<img src="images/spacer.gif" width="100" height="1" alt="" border=0><br />
				<span id="Label1" class="formtextlabel">
				<label for="username" accesskey="u">Username</label>:
				</span>
			</td>
			<td>
				<img src="images/spacer.gif" width="180" height="1" alt=""><br />
				<input name="user_name" id="user_name" type="text"  maxlength="4000" size="20" value="#attributes.user_name#" />
			</td>
		</tr>
		<tr>
			<td align="right">
				<img src="images/spacer.gif" width="100" height="1" alt=""><br />
				<span id="Label2" class="formtextlabel">
				<label for="password">Password</label>:
				</span>
			</td>
			<td><input name="password" id="password" type="password" size="20" value="" /></td>
		</tr>
		<tr>
			<td>
				<img src="images/spacer.gif" width="100" height="29" alt="">
			</td>
			<td>
				<input name="requested_page" type="hidden" value="#attributes.requested_page#" />
				<input name="method" type="submit" alt="Login" size="20" value="Login" />
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<div id="response" style="color:red;">#variables.display_message#&nbsp;</div>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<!--- <a href="##">How to get an account</a>
				<br /> ---><a href="index.cfm?fuseaction=Application_Manager.forget_password">Forgot Password?</a>
			</td>
		</tr>
	</table>
</form>
</cfoutput>

<cfif len(variables.display_message)>
<script language="javascript">
	setTimeout("new Effect.Shake('loginB');",1250);
</script>
</cfif>