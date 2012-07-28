<!-- Administration/dsp_final_privileges.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_final_privileges.cfm">
	<responsibilities>
		I help the user assign NSM structure privileges.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="8/31/2007" role="FuseCoder" comments="Created File">
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

<cfoutput>
<cfform name="form_edit_nsm_privileges" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table  summary="Table displays access assignments for  user">
	<tr>
		<td colspan="2" title="table cell describes the data held in the table within this table">
			You've assigned access for every <abbr title="NASA Structure Management">NSM</abbr> level that applies to program year #get_program_year.description#
		</td>
	</tr>
	<tr>
		<th colspan="2">
			Assign access for this combination:
		</th>
	</tr>
		</td>
	</tr>
	<tr>
		<td><label for="program_year_id">Program Year</label>:</td>
		<td>
			<!--- force a reset so we can see all the program year options --->
			<cfset attributes.program_year_id=0>
			<cfinclude template="../common_files/qry_get_program_year.cfm">
			<cfselect name="program_year_id" query="get_program_year" value="program_year_id" display="description"></cfselect>
		</td>
	</tr>
	<tr>
		<td><label for="module_id">Module</label>:</td>
		<td>
			<!--- force a reset so we can see all the module options --->
			<cfset attributes.module_id=0>
			<cfinclude template="../common_files/qry_get_ref_module.cfm">
			<cfselect name="module_id" query="get_ref_module" value="module_id" display="description"></cfselect>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="hidden" name="insert_ind" value="1" />
			<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
			<input type="submit" name="submit" value=" Submit " alt="submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</cfform>
</cfoutput>