<!-- Administration/pag_edit_link_user_account_status.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_link_user_account_status.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/10/2007" role="FuseCoder" comments="Created File">
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

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_link_user_account_status.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_link_user_account_status.cfm">
</cfif>

<cfparam name="attributes.l_u_a_s_id" default="0">
<cfparam name="attributes.user_account_id" default="0">
<cfparam name="attributes.account_status_id" default="0">

<cfinclude template="qry_get_user_account.cfm">
<cfinclude template="../common_files/qry_get_ref_account_status.cfm">
<cfinclude template="qry_get_link_user_account_status.cfm">

<!---<cfif get_ref_hierarchy_level.recordcount>
	<cfset attributes.hierarchy_level_id=get_ref_hierarchy_level.hierarchy_level_id>
</cfif>

<cfif get_program_year.recordcount>
	<cfset attributes.program_year_id=get_program_year.program_year_id>
</cfif>--->

<cfoutput>
<cfform name="form_link_user_account_status" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table cellspacing="5" cellpadding="5" width="80%" summary="Table displays user account status">
	<tr>
		<th colspan="2">
			Link_User_Account_Status
		</th>
	</tr>
	<tr>
		<td>
			<label for="user_account_id">User Name</label>: 
			<br /><cfselect name="user_account_id" id="user_account_id" query="get_user_account" value="user_account_id" display="user_name" selected="#attributes.user_account_id#" required="yes" message="Please specify user name.">
				</cfselect>
		</td>
		<td>
			<label for="account_status_id">Account Status</label>: 
			<br /><cfselect name="account_status_id" id="account_status_id" query="get_ref_account_status" value="account_status_id" display="description" selected="#attributes.account_status_id#" required="yes" message="Please specify account status.">
				</cfselect>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<span title="describes the purpose of the radio buttons following">Active?</span>
			<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes </label> <cfinput type="radio" name="active_ind" id="active_ind_no" value="0" ><label for="active_ind_no">No </label>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="l_u_a_s_id" value="#attributes.l_u_a_s_id#" />
			<input type="submit" alt="submit" name="submit" value=" Submit " />
		</td>
	</tr>
</table>
</cfform>
</cfoutput>