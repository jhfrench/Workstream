<!-- common_files/dsp_email_category.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_email_category.cfm">
	<responsibilities>
		I show records from the REF_Email_Category table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/5/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.show_buttons_ind" default="1">
<cfif isdefined("variables.user_identification")>
	<cfparam name="attributes.user_account_id" default="#variables.user_identification#">
</cfif>
<cfparam name="attributes.subscribed_email_category_id" default="0">
<cfmodule template="../common_files/qry_get_ref_email_category.cfm" email_category_id="0">
<cfoutput>
<table align="center" border="0" cellspacing="0" cellpadding="1" cols="2" width="100%" summary="table displays available email categories">
	<cfloop query="get_ref_email_category">
	<cfif listfindnocase(attributes.subscribed_email_category_id,email_category_id)>
		<cfset variables.category_selected="yes">
	<cfelse>
		<cfset variables.category_selected="no">
	</cfif>
	<tr<cfif currentrow MOD 2> bgcolor="##eeeeee"</cfif>>
		<td colspan="2">
			<label for="email_category_id_#email_category_id#">#description#</label>
		</td>
	</tr>
	<tr<cfif currentrow MOD 2> bgcolor="##eeeeee"</cfif>>
		<td valign="top">
			<cfinput type="checkbox" name="email_category_id" id="email_category_id_#email_category_id#" value="#email_category_id#" checked="#variables.category_selected#" />
		</td>
		<td scope="row">
			#notes#&nbsp;
		</td>
	</tr>
	</cfloop>
	<cfif attributes.show_buttons_ind>
	<tr>
		<td align="center" colspan="2">
			<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
			<input type="submit" value="confirm" />
		</td>
	</tr>
	</cfif>
</table>
</cfoutput>