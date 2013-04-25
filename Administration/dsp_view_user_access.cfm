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
<cfset variables.privilege_column_count=get_ref_privilege.recordcount>
<cfparam name="variables.show_buttons_ind" default="1">
<cfsetting requesttimeout="3000">
<cfoutput>
<cfloop query="get_user_information">
	<cfset variables.module_name="this will never_match">
	<cfset variables.currentrow=0>
	<!--- get all of user's access for display --->
	<cfmodule template="../common_files/qry_get_user_module_access.cfm" program_year_id="#attributes.program_year_id#" user_account_id="#get_user_information.user_account_id#">
	<cfmodule template="../common_files/qry_get_user_privileges.cfm" program_year_id="#attributes.program_year_id#" user_account_id="#get_user_information.user_account_id#" privilege_id="#valuelist(get_ref_privilege.privilege_id)#">
	<h2>#last_name#, #first_name# <small></small>(#user_name#)</h2>
	<p class="info">
		User has program year #get_user_module_access.program_year_description# access to
		<cfswitch expression="#get_user_module_access.recordcount#">
			<cfcase value="0">no modules</cfcase>
			<cfcase value="1">the #get_user_module_access.module_description# module</cfcase>
			<cfdefaultcase>these modules: #listchangedelims(valuelist(get_user_module_access.module_description),", ")#</cfdefaultcase>
		</cfswitch>
	</p>
	<cfif get_user_privileges.recordcount EQ 0>
		<p class="warning">User has no assigned privileges</p>
	<cfelse>
		<cfloop query="get_user_privileges">
			<cfif comparenocase(variables.module_name,module_description)>
				<cfset variables.module_name=module_description>
				<cfif get_user_privileges.currentrow NEQ 1>
					</tbody>
				</table>
				</cfif>
				<table class="table table-striped table-bordered table-condensed">
					<caption><h3>#module_description# Priveleges</h3></caption>
					<thead>
						<tr>
							<th>Organization</th>
							<cfloop query="get_ref_privilege"><th>#description#</th></cfloop>
						</tr>
					</thead>
					<tbody>
			<cfelse>
						<cfset variables.currentrow=incrementvalue(variables.currentrow)>
						<tr>
							<td><cfloop from="1" to="#workstream_level#" index="ii">&nbsp;&nbsp;</cfloop>#organization_description# (#organization_code#)</td>
							<cfloop query="get_ref_privilege"><td align="center"><cfif evaluate("get_user_privileges['privilege_#privilege_id#'][#variables.currentrow#]")><i class="icon-ok"></i></cfif></td></cfloop>
						</tr>
			</cfif>
		</cfloop>
					</tbody>
				</table>
	</cfif>
</cfloop>
<cfif variables.show_buttons_ind>
	<form name="view_user_access" action="index.cfm?fuseaction=Administration.edit_navigation_access" method="post">
		<div class="row-fluid">
			<div class="span12">
				<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
				<input type="hidden" name="program_year_id" value="#attributes.program_year_id#" />
				<input type="submit" name="administration_type" value="Edit Access" class="btn btn-primary" />
				<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
			</div>
		</div>
	</form>
</cfif>
</cfoutput>