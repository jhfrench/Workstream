<!-- Administration/dsp_edit_link_module_privilege.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_link_module_privilege.cfm">
	<responsibilities>
		I display the form for link module privilege maintenance.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="9/17/2007" role="FuseCoder" comments="Created File">
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
<cfform name="form_link_module_privilege" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table displays business function hierarchy">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.l_m_p_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> LINK MODULE PRIVILEGE</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays module information">
			<tr>
				<td><label for="module_id">Module</label>: 
					<br /><cfselect name="module_id" id="module_id" query="get_ref_module" value="module_id" display="description" selected="#attributes.module_id#" required="yes" message="Please specify module."></cfselect>
				</td>
				<td><label for="privilege_id">Privilege</label>: 
					<br /><cfselect name="privilege_id" id="privilege_id" query="get_ref_privilege" value="privilege_id" display="description" selected="#attributes.privilege_id#" required="yes" message="Please specify privilege."></cfselect>
				</td>
			</tr>
			<tr>
				<cfif attributes.l_m_p_id EQ 0>
					<input type="hidden" name="active_ind" value="1"/>
				<cfelse>
				<td colspan="2"><span title="describes the purpose of the radio buttons that follow">Active?</span>
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
			<input type="hidden" name="l_m_p_id" value="#attributes.l_m_p_id#"/>
			<input type="submit" alt="submit" name="submit" value="Submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>

