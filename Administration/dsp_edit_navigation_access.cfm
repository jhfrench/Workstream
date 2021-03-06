<!-- Administration/dsp_edit_navigation_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_navigation_access.cfm">
	<responsibilities>
		I help the administrator to administer user access.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/27/2007" role="FuseCoder" comments="Created File">
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

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_nsm_privileges" fuseaction="Administration.edit_nsm_privileges" field_name="module_id" field_value="" process_form_ind="1" field2_name="user_account_id" field2_value="#attributes.user_account_id#" program_year_id="#attributes.program_year_id#">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_user_access" fuseaction="Administration.view_user_access" field_name="user_account_id" field_value="" field2_name="program_year_id" field2_value="#attributes.program_year_id#">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="administer_user_menu" fuseaction="Administration.administer_user_menu" field_name="user_account_id" field_value="">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_user_activity" fuseaction="Administration.view_user_activity" field_name="user_account_id" field_value="">

<cfset variables.module_description="thiswill_never_match_jf">

<cfoutput>
<h2>
	<ul class="breadcrumb">
		<li><a href="index.cfm?fuseaction=Administration.manage_user_access">Manage User Access</a> <span class="divider">/</span></li>
		<li><a href="javascript:view_user_access('#attributes.user_account_id#');">View User Access</a> <span class="divider">/</span></li>
		<li class="active">Edit User Access</li>
	</ul>
</h2>
<cfif isdefined("attributes.relevant_business_function_id") AND len(attributes.relevant_business_function_id)>
	<div class="alert alert-success"><strong>You got it!</strong><br />Business function access changes have been applied</div>
</cfif>
<div class="alert alert-info">
	<p>You are managing user access for:
		<ul>
			<cfloop query="get_user_information"><li>#first_name# #last_name# <a href="javascript:administer_user_menu(#user_account_id#);" class="btn btn-small">Manage User's Profile</a> <a href="javascript:view_user_activity(#user_account_id#);" class="btn btn-small">View User Activity</a></li></cfloop>
		</ul>
	</p>
	<p>Check the business function's box to grant access to that function</p>
</div>

<form name="form_edit_navigation_access" action="index.cfm?fuseaction=Administration.edit_navigation_access" method="post" class="form-horizontal">
<cfloop query="get_user_navigation_access">
	<cfif comparenocase(module_description, variables.module_description)>
		<cfset variables.module_description=module_description>
	<cfif currentrow NEQ 1>
			</div>
		</div>
	</fieldset></cfif>
	<fieldset>
		<legend>#module_description#</legend>
		<div class="control-group">
			<div class="controls">
	</cfif>
				<label for="business_function_id_#business_function_id#" class="checkbox">
					<input type="checkbox" name="business_function_id" id="business_function_id_#business_function_id#" value="#business_function_id#"#checked_ind# />
					#business_function_description#
				</label>
</cfloop>
			</div>
		</div>
	</fieldset>
	<div class="form-actions">
		<input type="hidden" name="access_administration_type" value="business_function" />
		<input type="hidden" name="program_year_id" value="#attributes.program_year_id#" />
		<input type="hidden" name="relevant_business_function_id" value="#valuelist(get_user_navigation_access.business_function_id)#" />
		<input type="hidden" name="old_business_function_id" value="#valuelist(get_user_navigation_access.old_business_function_id)#" />
		<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
		<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
		<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
	</div>
</form>
</cfoutput>