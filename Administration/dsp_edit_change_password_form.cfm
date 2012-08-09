<!-- Administration/dsp_edit_change_password_form.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_change_password_form.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/6/2007" role="FuseCoder" comments="Created File">
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

<script language="JavaScript" type="text/javascript">
function trim (){
	return this.replace(/^\s+|\s+$/g,'');
}

String.prototype.trim=trim;
function isMatch(s1,s2) {
	return s1==s2;
}

function confirmPassword(frm){
	alert(frm); alert(frm['password'].value); alert(frm['confirm_password'].value);
	var isMatching=isMatch(frm['password'].value,frm['confirm_password'].value);

	if (!isMatching){
		alert ("Passwords do not match!");
		frm['confirm_password'].FAAD();
		return false;
	}

	alert('Submitting form');
	alert(frm.action);
	frm.submit();
	return true;
}
</script>

<cfparam name="attributes.user_name" default="">
<cfoutput query="get_user_information">
<form name="form_edit_change_password" action="index.cfm?fuseaction=#attributes.fuesaction#" method="post">
<table summary="Table displays user information">
	<tr>
		<td><label for="demographics_id">Demographics</label>:</td>
		<td><select name="demographics_id" id="demographics_id">
				<cfif NOT comparenocase(attributes.action, "add_user")><option value="" selected="selected">--Select a User--</option></cfif>
				<cfloop query="get_user_information">
				<option value="#demographics_id#"<cfif isdefined("attributes.demographics_id") AND attributes.demographics_id EQ demographics_id> selected="selected"</cfif>>#last_name#, #first_name#</option>
				</cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td><label for="user_name">Username</label>:</td>
		<td><input name="user_name" id="user_name" type="text" maxlength="4000" size="20" <cfif NOT comparenocase(attributes.action, "edit_user")>value="#user_name#" readonly="yes"<cfelse>value="#attributes.user_name#"</cfif>/></td>
	</tr>
	<tr>
		<td><label for="old_password">Current Password</label>:</td>
		<td><input name="old_password" id="old_password" type="password" size="20" maxlength="20" value="#attributes.old_password#"/></td>
	</tr>
	<tr>
		<td><label for="password">New Password</label>:</td>
		<td><input name="password" id="password" type="password" size="20" maxlength="20" value="#attributes.password#" onblur="this.value=this.value.trim();"/></td>
	</tr>
	<tr>
		<td><label for="confirm_password">Confirm Password</label>:</td>
		<td><input name="confirm_password" id="confirm_password" type="password" size="20" maxlength="20" value="#attributes.confirm_password#" onblur="this.value=this.value.trim();"/></td>
	</tr>
	<tr>
		<td>
			<cfif NOT comparenocase(attributes.action, "edit_user")>
				<input name="user_account_id" type="hidden" value="#user_account_id#"/>
			</cfif>
		</td>
		<td>
			<input name="method" type="button" size="20" value="<cfif NOT comparenocase(attributes.action, 'edit_user')>Update User<cfelse>Add User</cfif>" onclick="return confirmPassword(this.form);"/>
		</td>
	</tr>
</table>
</form>
</cfoutput>