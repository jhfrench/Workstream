<!-- Administration/dsp_add_user_form.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_add_user_form.cfm">
	<responsibilities>
	I am the form used for adding and editing username and password for external demographics warehouse information
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
<cfparam name="attributes.user_name" default="">
<cfparam name="attributes.password" default="">
<cfparam name="attributes.demographics_id" default="0">
<cfparam name="attributes.account_status_id" default="0">
<cfparam name="variables.display_message" default="">
<cfparam name="variables.check_form_field" default=0>

<!--- get active demographics information --->
<cfinclude template="qry_get_demographics.cfm">
<cfoutput>
#variables.display_message#
<form name="form_add_user" action="#cgi.script_name#<cfif isdefined("cgi.query_string") AND len(cgi.query_string)>?#cgi.query_string#</cfif>" method="post">
<table summary="Table displays user information form">
	<tr>
		<td><label for="demographics_id">Demographics</label>:</td>
		<td><select name="demographics_id">
				<cfif NOT comparenocase(attributes.action, "add_user")><option value="0" selected>--Select a User--</option></cfif>
				<cfloop query="get_demographics">
				<option value="#demographics_id#"<cfif isdefined("attributes.demographics_id") AND attributes.demographics_id EQ demographics_id> selected</cfif>>#last_name#, #first_name#</option>
				</cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td><label for="user_name">Username</label>:</td>
		<td><input type="text" name="user_name" id="user_name" size="20" maxlength="4000" <cfif NOT comparenocase(attributes.action, "edit_user")>value="#user_name#" readonly="yes"<cfelse>value="#attributes.user_name#"</cfif>/></td>
	</tr>
	<tr>
		<td><label for="password">Password</label>:</td>
		<td><input type="password" name="password" id="password" size="20" maxlength="4000" value="#attributes.password#"/></td>
	</tr>
	<tr>
		<td>
			<cfset variables.button_label="Add User">
			<cfif NOT comparenocase(attributes.action, "edit_user")>
				<input name="user_account_id" type="hidden" value="#user_account_id#"/>
				<cfset variables.button_label="Update User">
			</cfif>
		</td>
		<td>
			<input name="method" type="submit" alt="#variables.button_label#" size="20" value="#variables.button_label#"/>
		</td>
	</tr>
</table>
</form>
</cfoutput>