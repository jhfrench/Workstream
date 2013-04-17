<!-- Administration/dsp_view_user_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_view_user_access.cfm">
	<responsibilities>
		I help the user assign NSM structure privileges.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/31/2007" role="FuseCoder" comments="Created File">
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
<!--- $issue$: does this template get used? --->
<cfset variables.privilege_column_count=get_ref_privilege.recordcount>
<cfparam name="variables.show_buttons_ind" default="1">
<cfsetting requesttimeout="3000">
<cfform name="view_user_access" action="index.cfm?fuseaction=Administration.welcome" method="post">

<div class="datachart" style="border:1px solid ##999999">
	<cfoutput query="get_user_information">
		<cfset variables.module_name="this will never_match">
		<cfset variables.currentrow=0>
		<!--- get all of user's access for display --->
		<cfmodule template="../common_files/qry_get_user_module_access.cfm" program_year_id="#attributes.program_year_id#" user_account_id="#get_user_information.user_account_id#">
		<cfmodule template="../common_files/qry_get_user_privileges.cfm" program_year_id="#attributes.program_year_id#" user_account_id="#user_account_id#" privilege_id="#valuelist(get_ref_privilege.privilege_id)#">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="table head describes the data held in the table below">
		<tr class="alt_list1">
			<th title="You are viewing the privileges for #first_name# #last_name#.">#last_name#, #first_name# (#user_name#)</th>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="1" cellpadding="4" summary="Table displays user access">
		<tr>
			<td colspan="#variables.privilege_column_count+1#">User has program year #get_user_module_access.program_year_description# access to
				<cfswitch expression="#get_user_module_access.recordcount#">
					<cfcase value="0">no modules</cfcase>
					<cfcase value="1">the #get_user_module_access.module_description# module</cfcase>
					<cfdefaultcase>these modules: #listchangedelims(valuelist(get_user_module_access.module_description),", ")#</cfdefaultcase>
				</cfswitch></td>
		</tr>
		<cfif get_user_privileges.recordcount EQ 0>
			<tr bgcolor="##dcdcdc">
				<td align="center" colspan="#variables.privilege_column_count+1#">User has no assigned privileges</td>
			</tr>
		<cfelse>
			<cfloop query="get_user_privileges">
			<cfif comparenocase(variables.module_name,module_description)>
				<cfset variables.module_name=module_description>
				<tr bgcolor="##808080">
					<td>#module_description#</td>
					<td colspan="#variables.privilege_column_count#">Privileges</td>
				</tr>
				<tr bgcolor="##808080">
					<td>NSM</td>
					<cfloop query="get_ref_privilege">
					<td align="center">#description#</td>
					</cfloop>
				</tr>
			</cfif>
			<cfset variables.currentrow=incrementvalue(variables.currentrow)>
			<tr bgcolor="##dcdcdc">
				<td><cfloop from="1" to="#nsm_level#" index="ii">&nbsp;&nbsp;</cfloop>#organization_description# (#organization_code#)</td>
				<cfloop query="get_ref_privilege">
				<td align="center"><cfif evaluate("get_user_privileges['privilege_#privilege_id#'][#variables.currentrow#]")>X</cfif></td>
				</cfloop>
			</tr>
			</cfloop>
		</cfif>
		<cfif variables.show_buttons_ind AND get_user_information.currentrow EQ get_user_information.recordcount>
			<tr bgcolor="##808080">
				<td align="center" colspan="#variables.privilege_column_count+1#">
					<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
					<input type="hidden" name="program_year_id" value="#attributes.program_year_id#" />
					<input type="button" name="administration_type" value="Edit Access" onclick="javascript:document.view_user_access.action='index.cfm?fuseaction=Administration.edit_navigation_access';document.view_user_access.submit();" class="btn" />
					<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
				</td>
			</tr>
		</cfif>
	</table>
	</cfoutput>
</div>
</cfform>