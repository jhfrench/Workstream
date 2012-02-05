<!-- Administration/dsp_edit_nsm_privileges.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_nsm_privileges.cfm">
	<responsibilities>
		I help the user assign NSM structure privileges.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/27/2007" role="FuseCoder" comments="Created File">
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
<cfsetting requesttimeout="3000">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_user_access" fuseaction="Administration.view_user_access" field_name="user_account_id" field_value="">
<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the data held in the table below">
	<tr>
		<th align="left">
			<h2 style="margin:0px" id="top-side"><a href="index.cfm?fuseaction=Administration.manage_user_access">Manage User Access</a> &gt; <a href="javascript:view_user_access('<cfoutput>#attributes.user_account_id#</cfoutput>');">View User Access</a> &gt; Edit <abbr title="NASA Structure Management">NSM</abbr> Access</h2>
		</th>
	</tr>
</table>

<cfif isdefined("attributes.organization_id") AND len(attributes.organization_id)>
	<cfinclude template="../common_files/act_hierarchy_breadcrumbs.cfm">
</cfif>

<cfif attributes.center_ind EQ 1>
	<cfset variables.id_label="center_id">
<cfelse>
	<cfset variables.id_label="organization_id">
</cfif>

<cfform name="form_edit_nsm_privileges" action="index.cfm?fuseaction=Administration.edit_nsm_privileges" method="post">
<cfoutput>
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table allows user to edit FAAD access">
	<tr bgcolor="##cccccc"><th><strong>Edit <abbr title="NASA Structure Management">NSM</abbr> Access</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
			<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table lists users whose NSM access can be updated">
				<tr bgcolor="##eeeeee">
					<td colspan="#get_module_privilege_details.recordcount+2#" class="alt_list1">
						Editing program year #get_program_year.description# #get_ref_module.description# privileges for the '#get_grouper_options_and_user_privileges.hierarchy_description#' <abbr title="NASA Structure Management">NSM</abbr> level for: <cfloop query="get_user_information">#first_name# #last_name#<cfif currentrow NEQ recordcount>, </cfif></cfloop>
					</td>
				</tr>
				<tr bgcolor="##bbbbbb">
					<th align="left"><label for="hierarchy_description">#get_grouper_options_and_user_privileges.hierarchy_description#</label></th>
					<th align="left"><label for="organization_code">Code</label></th>
					<cfloop query="get_module_privilege_details">
					<script language="JavaScript" type="text/javascript">
					<!--
					function check_all_#get_module_privilege_details.privilege_id#(field)
					{
						if (document.form_edit_nsm_privileges.checked_status_#get_module_privilege_details.privilege_id#.value==2)
						{
							// reset
							for (i=0; i < field.length; i++)
								field[i].checked=field[i].defaultChecked ;
							document.form_edit_nsm_privileges.checked_status_#get_module_privilege_details.privilege_id#.value=0;
						}
						else if(document.form_edit_nsm_privileges.checked_status_#get_module_privilege_details.privilege_id#.value==1)
						{
							//uncheck all
							for (i=0; i < field.length; i++)
								field[i].checked=false ;
							document.form_edit_nsm_privileges.checked_status_#get_module_privilege_details.privilege_id#.value=2;
						}
						else
						{
							//check all
							for (i=0; i < field.length; i++)
								field[i].checked=true ;
							document.form_edit_nsm_privileges.checked_status_#get_module_privilege_details.privilege_id#.value=1;
						}
					}
					//-->
					</script>
					<th align="left">
						<label for="privilege_id"><a href="javascript:check_all_#get_module_privilege_details.privilege_id#(document.form_edit_nsm_privileges.privilege_#get_module_privilege_details.privilege_id#_#variables.id_label#);">#get_module_privilege_details.privilege_label#</a></label>
					</th>
					</cfloop>
				</tr>
				</cfoutput>
				<cfif get_grouper_options_and_user_privileges.recordcount NEQ 0>
					<cfoutput query="get_grouper_options_and_user_privileges">
						<cfloop list="#get_grouper_options_and_user_privileges.columnlist#" index="ii">
							<cfset "variables.#ii#"=evaluate(ii)>
						</cfloop>
						<cfif attributes.center_ind EQ 1>
							<cfset variables.organization_code=center_code>
						<cfelse>
							<cfset variables.organization_code=organization_code>
						</cfif>
				
						<!--- set alternating row colors --->
						<cfif currentrow MOD 2>
							<cfset variables.row_color="eeeeee">
						<cfelse>
							<cfset variables.row_color="dddddd">
						</cfif>
			
						<cfif variables.next_l_p_y_h_id NEQ 0 AND attributes.center_ind NEQ 1>
							<cfset variables.start_link_text='<a href="javascript:edit_nsm_privileges(#organization_id#)">'>
							<cfset variables.end_link_text='</a>'>
						<cfelse>
							<cfset variables.show_apply_to_children_ind=0>
							<cfset variables.start_link_text=''>
							<cfset variables.end_link_text=''>
						</cfif>
						<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
							<td id="hierarchy_description" title="describes the hiuerarchy of the organization in the table cell to the right">
								#variables.start_link_text##description##variables.end_link_text#
							</td>
							<td id="organization_code">
								<label for="privilege_#get_module_privilege_details.privilege_id#_#variables.id_label#">#variables.start_link_text##organization_code##variables.end_link_text#</label>
							</td>
							<cfloop query="get_module_privilege_details">
							<td id="privilege_id">
								<input type="checkbox" name="privilege_#get_module_privilege_details.privilege_id#_#variables.id_label#" value="#evaluate('variables.#variables.id_label#')#"<cfif evaluate("variables.#get_module_privilege_details.privilege_label#_ind")> checked="checked"</cfif> />
								<input type="hidden" name="checked_status_#get_module_privilege_details.privilege_id#" value="0" />
							</td>
							</cfloop>
						</tr>
					</cfoutput>
					<cfmodule template="../common_files/dsp_hierarchy_drilldown_options.cfm" colspan="8" form_name="edit_nsm_privileges" alternate_form_name="form_edit_nsm_privileges">
					<cfoutput>
					<tr>
						<td colspan="#get_module_privilege_details.recordcount+2#">
							<input type="hidden" name="affected_#variables.id_label#" value="<cfif get_grouper_options_and_user_privileges.recordcount LT 1000>#evaluate('valuelist(get_grouper_options_and_user_privileges.#variables.id_label#)')#<cfelse>#evaluate('variables.affected_#variables.id_label#')#</cfif>" />
							<input type="hidden" name="affected_privilege_id" value="#variables.relevant_privileges#" />
							<input type="hidden" name="hierarchy_level" value="#attributes.hierarchy_level#" />
							<input type="hidden" name="insert_ind" value="1" />
							<input type="hidden" name="<cfif get_next_hierarchy_drilldown_options.recordcount GT 1>original_</cfif>l_p_y_h_id" value="#listfirst(attributes.l_p_y_h_id)#" />
							<input type="hidden" name="module_id" value="#attributes.module_id#" />
							<input type="hidden" name="nsm_drilldown_organizations" value="#attributes.nsm_drilldown_organizations#" />
							<input type="hidden" name="program_year_id" value="#attributes.program_year_id#" />
							<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
							<cfif variables.show_apply_to_children_ind><label for="apply_to_children_ind"><input type="checkbox" name="apply_to_children_ind" id="apply_to_children_ind" value="1" />&nbsp;Apply these selections to children <abbr title="NASA Structure Management">NSM</abbr> entities</label></cfif>
						</td>
					</tr>
					</cfoutput>
				<cfelse>
					<cfoutput>
					<tr>
						<td colspan="8">
							<!--- if the top hierarchy for the year doesn't have any options than we need to configure the system for the selected program year --->
							<cfif compare(attributes.nsm_drilldown_organizations,0)>
								There are no options at this level to which the user can be assigned privileges. Adding privileges at a higher <abbr title="NASA Structure Management">NSM</abbr> level may present more options at this level.
							<cfelse>
								Please define the <abbr title="NASA Structure Management">NSM</abbr> structure for program year #get_program_year.description#.
							</cfif>
						</td>
					</tr>
					</cfoutput>
				</cfif>
			</table>
		</td>
	</tr>
	<cfif get_grouper_options_and_user_privileges.recordcount NEQ 0>
	<tr align="center" bgcolor="#dddddd">
		<td>
			<input type="submit" alt="Save" value=" Save " />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
	</cfif>
</table>
</div>
</cfform>
