<!-- Administration/dsp_edit_navigation_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_navigation_access.cfm">
	<responsibilities>
		I help the administrator to administer user access.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="8/27/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/19/10) Adding ability to view user's activity.
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

<cfif isdefined("attributes.relevant_business_function_id") AND len(attributes.relevant_business_function_id)>
	<cfinclude template="qry_deactivate_access_user_business_function.cfm">
	<cfif len(attributes.business_function_id)>
		<cfinclude template="../common_files/qry_insert_access_user_business_function.cfm">
	</cfif>
</cfif>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_nsm_privileges" fuseaction="Administration.edit_nsm_privileges" field_name="module_id" field_value="" processform="1" field2_name="user_account_id" field2_value="#attributes.user_account_id#" program_year_id="#attributes.program_year_id#">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_user_access" fuseaction="Administration.view_user_access" field_name="user_account_id" field_value="" field2_name="program_year_id" field2_value="#attributes.program_year_id#">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="administer_user_menu" fuseaction="Administration.administer_user_menu" field_name="user_account_id" field_value="">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_user_activity" fuseaction="Administration.view_user_activity" field_name="user_account_id" field_value="">

<cfinclude template="../common_files/qry_get_user_information.cfm">
<cfinclude template="../common_files/qry_get_user_navigation_access.cfm">
<cfset variables.module_description="thiswill_never_match_jf">
<form name="form_edit_navigation_access" action="index.cfm?fuseaction=Administration.edit_navigation_access" method="post">


<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the data held in the table below">
	<tr>
		<td align="left">
			<h2 style="margin:0px" id="top-side"><a href="index.cfm?fuseaction=Administration.manage_user_access">Manage User Access</a> &gt; <a href="javascript:view_user_access('<cfoutput>#attributes.user_account_id#</cfoutput>');">View User Access</a> &gt; Edit User Access</h2>
		</td>
	</tr>
	<tr>
		<td><cfoutput>
			<a href="javascript:administer_user_menu('#attributes.user_account_id#');">Manage User's Profile</a><br />
			<a href="javascript:view_user_activity('#attributes.user_account_id#');">View User Activity</a></cfoutput>
		</td>
	</tr>
	<tr>
		<th>You are administering user access for: <cfoutput query="get_user_information">#first_name# #last_name#<cfif currentrow NEQ recordcount>, </cfif></cfoutput></th>
	</tr>
	<cfif isdefined("attributes.relevant_business_function_id") AND len(attributes.relevant_business_function_id)>
	<tr>
		<td>Module access changes have been applied</td>
	</tr>
	</cfif>
	<tr>
		<td>Check the business function's box to grant access to that function</td>
	</tr>
</table>

<div class="datachart" style="border:1px solid ##999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="Table used to display modules associated with business functions">
	<cfoutput query="get_user_navigation_access">
	<cfif comparenocase(module_description, variables.module_description)>
	<tr bgcolor="##999999">
		<td colspan="2" title="Module associated to #business_function_description#">
			#module_description#
			<cfset variables.module_description=module_description>
		</td>
	</tr>
	</cfif>
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<!--- <tr bgcolor="###IIF(currentrow MOD 2, DE('#eeeeee'), DE('#dddddd'))#" onMouseOver="this.bgColor='##cfdee3';this.style.cursor='hand';"> --->
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';" onclick="javascript:Element.toggle('var_id_#currentrow#'); return false;">
		<td>
			<input type="checkbox" name="business_function_id" id="business_function_id_#business_function_id#" value="#business_function_id#"#checked_ind#/>
		</td>
		<td>
			<label for="business_function_id_#business_function_id#">#business_function_description#</label>
		</td>
	</tr>
	</cfoutput>
	<tr bgcolor="#999999">
		<td align="center" colspan="2">
			<cfoutput>
			<input type="hidden" name="access_administration_type" value="business_function" />
			<input type="hidden" name="program_year_id" value="#attributes.program_year_id#" />
			<input type="hidden" name="relevant_business_function_id" value="#valuelist(get_user_navigation_access.business_function_id)#" />
			<input type="hidden" name="old_business_function_id" value="#valuelist(get_user_navigation_access.old_business_function_id)#" />
			<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
			</cfoutput>
			<input type="submit" alt="submit" name="submit" value="Submit" onclick="hide();" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</form>