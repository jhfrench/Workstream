<!-- Home/pag_main.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_main.cfm">
	<responsibilities>
		I display the my ICET page to the user
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="3/15/2009" role="FuseCoder" comments="Created File">
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
<cfinclude template="../common_files/qry_get_internal_control_evaluation_entries.cfm">

<cfscript>
	variables.organization_id=-1;
	variables.parent_control_environment_id=-1;
	variables.parent_responsibility_id=-1;
	variables.parent_work_activity_id=-1;
	variables.parent_risk_id=-1;
	variables.parent_mitigation_id=-1;
	variables.parent_control_id=-1;
</cfscript>

<table border="0" cols="5">
<cfoutput query="get_internal_control_evaluation_entries">
<cfif variables.organization_id NEQ organization_id>
	<cfif currentrow NEQ 1></tbody></cfif>
	<thead>
	<tr>
		<td colspan="5" scope="col">
			<hr />
			<cfset variables.organization_id=organization_id>
			<cfset variables.write_access_ind=write_ind>
			<h2>#organization_description#</h2>
			<cfif variables.parent_control_environment_id NEQ parent_control_environment_id>
				<cfset variables.parent_control_environment_id=parent_control_environment_id>
				<cfif parent_control_environment_id NEQ 0>
					#left(rereplacenocase(control_environment,"<[^>]*>","","ALL"),200)#... <a href="javascript:edit_organization(#variables.parent_control_environment_id#);"><cfif variables.write_access_ind>Edit<cfelse>View</cfif></a>
				</cfif>
			</cfif>
			<cfif variables.write_access_ind AND len(control_environment) EQ 0>
				<a href="javascript:add_organization(#variables.organization_id#);">Add a related control environment</a>
			</cfif>
			<cfif variables.write_access_ind><br /><a href="javascript:add_responsibility(#variables.organization_id#);">Specify a related key work responsibility</a></cfif>
		</td>
	</tr>
<cfif parent_responsibility_id NEQ 0>
	<tr>
		<th bgcolor="##999999" scope="col" valign="bottom">Responsibility</th>
		<th bgcolor="##999999" scope="col" valign="bottom">Work Activity</th>
		<th bgcolor="##999999" scope="col" valign="bottom">Risk</th>
		<th bgcolor="##999999" scope="col" valign="bottom">Mitigation</th>
		<th bgcolor="##999999" scope="col" valign="bottom">Control Assessment</th>
	</tr>
</cfif>
	</thead>
</cfif>
<cfif parent_responsibility_id NEQ 0>
	<tbody>
	<tr bgcolor="##<cfif currentrow MOD 2>eeeeee<cfelse>ffffff</cfif>">
		<td valign="top" title="#organization_description#" scope="row">
			<cfif variables.parent_responsibility_id NEQ parent_responsibility_id>
				<cfset variables.parent_responsibility_id=parent_responsibility_id>
				<cfif variables.parent_responsibility_id NEQ 0>
					#left(rereplacenocase(responsibility_description,"<[^>]*>","","ALL"),200)#... <a href="javascript:edit_responsibility(#variables.parent_responsibility_id#);"><cfif variables.write_access_ind>Edit<cfelse>View</cfif></a>
					<cfif variables.write_access_ind><br /><a href="javascript:add_activity(#variables.parent_responsibility_id#);"><img src="images/expand.gif" alt="Specify a related key work activity" border="0" height="9" width="9" /> related key work activity</a></cfif>
				</cfif>
			</cfif>&nbsp;
		</td>
		<td valign="top">
			<cfif variables.parent_work_activity_id NEQ parent_work_activity_id>
				<cfset variables.parent_work_activity_id=parent_work_activity_id>
				<cfif variables.parent_work_activity_id NEQ 0>
					#work_activity_title# <a href="javascript:edit_activity(#variables.parent_work_activity_id#);"><cfif variables.write_access_ind>Edit<cfelse>View</cfif></a>
					<cfif variables.write_access_ind><br /><a href="javascript:add_risk(#variables.parent_work_activity_id#);"><img src="images/expand.gif" alt="Specify a relatedrisk" border="0" height="9" width="9" /> related risk</a></cfif>
				</cfif>
			</cfif>&nbsp;
		</td>
		<td valign="top">
			<cfif variables.parent_risk_id NEQ parent_risk_id>
				<cfset variables.parent_risk_id=parent_risk_id>
				<cfif variables.parent_risk_id NEQ 0>
					#left(rereplacenocase(risk_description,"<[^>]*>","","ALL"),200)#... <a href="javascript:edit_risk(#variables.parent_risk_id#);"><cfif variables.write_access_ind>Edit<cfelse>View</cfif></a>
					<cfif variables.write_access_ind><br /><a href="javascript:add_mitigation(#variables.parent_risk_id#);"><img src="images/expand.gif" alt="Specify a related mitigation" border="0" height="9" width="9" /> related mitigation</a></cfif>
				</cfif>
			</cfif>&nbsp;
		</td>
		<td valign="top">
			<cfif variables.parent_mitigation_id NEQ parent_mitigation_id>
				<cfset variables.parent_mitigation_id=parent_mitigation_id>
				<cfif variables.parent_mitigation_id NEQ 0>
					#left(rereplacenocase(mitigation,"<[^>]*>","","ALL"),200)#... <a href="javascript:edit_mitigation(#variables.parent_mitigation_id#);"><cfif variables.write_access_ind>Edit<cfelse>View</cfif></a>
					<cfif variables.write_access_ind><br /><a href="javascript:add_control(#variables.parent_mitigation_id#);"><img src="images/expand.gif" alt="Specify a related control" border="0" height="9" width="9" /> related control</a></cfif>
				</cfif>
			</cfif>&nbsp;
		</td>
		<td valign="top">
			<cfif variables.parent_control_id NEQ parent_control_id>
				<cfset variables.parent_control_id=parent_control_id>
				<cfif variables.parent_control_id NEQ 0>
					#left(rereplacenocase(control_method,"<[^>]*>","","ALL"),200)#... <a href="javascript:edit_control(#variables.parent_control_id#);"><cfif variables.write_access_ind>Edit<cfelse>View</cfif></a>
				</cfif>
			</cfif>&nbsp;
		</td>
	</tr>
</tbody></cfif>
</cfoutput>
	
</table>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="add_organization" fuseaction="Data_Entry.add_organization" field_name="organization_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_organization" fuseaction="Data_Entry.add_organization" field_name="parent_control_environment_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="add_responsibility" fuseaction="Data_Entry.add_responsibility" field_name="organization_id" field2_name="parent_responsibility_id" field2_value="0">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_responsibility" fuseaction="Data_Entry.add_responsibility" field_name="parent_responsibility_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="add_activity" fuseaction="Data_Entry.add_activity" field_name="parent_responsibility_id" field2_name="parent_work_activity_id" field2_value="0">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_activity" fuseaction="Data_Entry.add_activity" field_name="parent_work_activity_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="add_risk" fuseaction="Data_Entry.add_risk" field_name="parent_work_activity_id" field2_name="parent_risk_id" field2_value="0">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_risk" fuseaction="Data_Entry.add_risk" field_name="parent_risk_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="add_mitigation" fuseaction="Data_Entry.add_mitigation" field_name="parent_risk_id" field2_name="parent_mitigation_id" field2_value="0">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_mitigation" fuseaction="Data_Entry.add_mitigation" field_name="parent_mitigation_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="add_control" fuseaction="Data_Entry.add_control" field_name="parent_mitigation_id" field2_name="parent_control_id" field2_value="0">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_control" fuseaction="Data_Entry.add_control" field_name="parent_control_id">