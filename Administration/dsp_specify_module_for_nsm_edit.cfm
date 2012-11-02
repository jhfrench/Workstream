<!-- Administration/dsp_specify_module_for_nsm_edit.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_specify_module_for_nsm_edit.cfm">
	<responsibilities>
		I help the user assign NSM structure privileges.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/31/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/19/10) Cleaning up verbiage and row coloring.
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

<ul class="breadcrumb">
  <li>Manage Users <span class="divider">/</span></li>
  <li><a href="index.cfm?fuseaction=Administration.manage_user_access">Manage User Access</a> <span class="divider">/</span></li>
  <li><a href="javascript:view_user_access('<cfoutput>#attributes.user_account_id#</cfoutput>');">View User Access</a> <span class="divider">/</span></li>
  <li class="active">Edit hierarchy Access</li>
</ul>
<cfform name="specify_module_for_nsm_edit" action="index.cfm?fuseaction=Administration.edit_nsm_privileges" method="post">
<div class="datachart" style="border:1px solid #999999">
<table width="100%" border="0" cellspacing="1" cellpadding="4" summary="Table contains user information">
	<tr class="alt_list1">
		<td colspan="2" title="The user that the form below will edit access privleges">
			You are administering user access for: <cfoutput query="get_user_information">#first_name# #last_name#<cfif currentrow NEQ recordcount>, </cfif></cfoutput>
		</td>
	</tr>
	<tr bgcolor="#808080">
		<th colspan="2">Module</th>
	</tr>
	<cfoutput query="get_ref_module">

	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<td><cfif assign_hier_privileges_ind><cfinput type="radio" name="module_id" value="#module_id#" id="module_id_#module_id#" required="yes" message="Please choose which module you'd like to administer."></cfif></td>
		<td><label for="module_id">#description#</label></td>
	</tr>
	</cfoutput>
	<tr bgcolor="#808080">
		<td align="center" colspan="2">
			<cfoutput>
			<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
			<input type="submit" name="submit" value="Edit NSM Access" alt="Edit NSM Access" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
			</cfoutput>
		</td>
	</tr>
</table>
</div>
</cfform>