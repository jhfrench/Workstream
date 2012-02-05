<!-- Administration/dsp_edit_module_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_module_access.cfm">
	<responsibilities>
		I help the user assign NSM structure privileges.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/27/2007" role="FuseCoder" comments="Created File">
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

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_user_access" fuseaction="Administration.view_user_access" field_name="user_account_id" field_value="">

<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="Table displays managing user access">
	<tr>
		<th align="left">
			<h2 style="margin:0px" id="top-side"><a href="index.cfm?fuseaction=Administration.manage_user_access">Manage User Access</a> &gt; <a href="javascript:view_user_access('<cfoutput>#attributes.user_account_id#</cfoutput>');">View User Access</a> &gt; Edit Access</h2>
		</th>
	</tr>
</table>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_nsm_privileges" fuseaction="Administration.edit_nsm_privileges" field_name="module_id" field_value="" processform="1" field2_name="user_account_id" field2_value="#attributes.user_account_id#" program_year_id="#attributes.program_year_id#">

<cfset variables.assigned_module_id=valuelist(get_user_module_access.module_id)>
<cfform name="specify_module_for_nsm_edit" action="index.cfm?fuseaction=Administration.edit_navigation_access" method="post">
<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="This table describes the table that houses the administering user access form below">
	<cfif isdefined("attributes.access_administration_type")>
	<tr>
		<td>Module access changes have been applied</td>
	</tr>
	</cfif>
	<tr class="alt_list1">
		<th>
			You are administering module access for: <cfoutput query="get_user_information">#first_name# #last_name#<cfif currentrow NEQ recordcount>, </cfif></cfoutput>
		</th>
	</tr>
</table>
<div class="datachart" style="border:1px solid #999999">
<table width="100%" border="0" cellspacing="1" cellpadding="4" summary="Table used to give user permissions">
	<tr bgcolor="#808080">
		<th>Grant Access</th>
		<th colspan="2">Module</th>
	</tr>
	<cfoutput query="get_ref_module">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<td align="center">&nbsp;
		<cfif required_ind>
			(mandatory)<input type="hidden" name="module_id" value="#module_id#"/>
		<cfelse>
			<input type="checkbox" name="module_id" value="#module_id#"<cfif listfind(variables.assigned_module_id,module_id)> checked="checked"</cfif>/>
		</cfif>
		</td>
		<td>
			<label for="module_id_#module_id#">#description#</label>
		</td>
		<td>
			&nbsp;
			<cfif assign_hier_privileges_ind AND listfind(variables.assigned_module_id,module_id)>
				<a href="javascript:edit_nsm_privileges(#module_id#);">Edit NSM Access</a>
			</cfif>
		</td>
	</tr>
	</cfoutput>
	<tr bgcolor="#808080">
		<td align="center" colspan="3">
			<cfoutput>
			<input type="hidden" name="access_administration_type" value="module" />
			<input type="hidden" name="assigned_module_id" value="#variables.assigned_module_id#" />
			<input type="hidden" name="program_year_id" value="#attributes.program_year_id#" />
			<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
			</cfoutput>
			<input type="submit" alt="Save" value="Save"/>
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>