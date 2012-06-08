<!-- Administration/dsp_edit_link_program_year_hierarchy.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_link_program_year_hierarchy.cfm">
	<responsibilities>
		I display the form for link program year hierarchy maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/6/2007" role="FuseCoder" comments="Created File">
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
<cfform name="form_link_program_year_hierarchy" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="the table head describes the table held within that houses the form">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.l_p_y_h_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> LINK PROGRAM HIERARCHY</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays hierarchy level">
			<tr>
				<td><label for="hierarchy_level_id">Hierarchy Level</label>: 
					<br /><cfselect name="hierarchy_level_id" id="hierarchy_level_id" query="get_ref_hierarchy_level" value="hierarchy_level_id" display="description" selected="#attributes.hierarchy_level_id#" required="yes" message="Please specify hierarchy level."></cfselect>
				</td>
				<td><label for="program_year_id">Program Year</label>: 
					<br /><cfselect name="program_year_id" id="program_year_id" query="get_program_year" value="program_year_id" display="description" selected="#attributes.program_year_id#" required="yes" message="Please specify program year."></cfselect>
				</td>
			</tr>
			<tr>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" size="3" maxlength="3" value="#get_link_program_year_hierarchy.recordcount+1#" required="yes" message="Please enter sort order.">
				</td>
				<cfif attributes.l_p_y_h_id EQ 0>
					<cfinput type="hidden" name="active_ind" value="1">
				<cfelse>
				<td><span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes </label>
						<cfinput type="radio" name="active_ind" id="active_ind_no" value="0" ><label for="active_ind_no">No </label>
				</td>
				</cfif>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#"/>
			<input type="hidden" name="l_p_y_h_id" value="#attributes.l_p_y_h_id#"/>
			<input type="submit" alt="submit" name="submit" value="Submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>

