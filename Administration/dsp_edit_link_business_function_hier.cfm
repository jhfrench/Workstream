<!-- Administration/dsp_edit_link_business_function_hier.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_link_business_function_hier.cfm">
	<responsibilities>
		I display the form for link business function hier maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/17/2007" role="FuseCoder" comments="Created File">
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
<cfform name="form_link_business_function_hier" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="the table head describes the table within that houses the form">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.l_b_f_h_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> LINK BUSINESS FUNCTION HIER</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays business function hierarchy">
			<tr>
				<td><label for="business_function_id">Business Function</label>: 
					<br /><cfselect name="business_function_id" id="business_function_id" query="get_business_function" value="business_function_id" display="description" selected="#attributes.business_function_id#" required="yes" message="Please specify business function."></cfselect>
				</td>
				<td><label for="l_p_y_h_id">Link Program Year Hierarchy</label>: 
					<br /><cfselect name="l_p_y_h_id" id="l_p_y_h_id" query="get_link_program_year_hierarchy" value="l_p_y_h_id" display="program_year_hierarchy_level" selected="#attributes.l_p_y_h_id#" required="yes" message="Please specify link program year / hierarchy level."></cfselect>
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" size="3" maxlength="3" value="#get_link_business_function_hier.recordcount+1#" required="yes" message="Please enter sort order.">
				</td>
			</tr>
			<tr>
				<td><span title="describes the purpose of the radio buttons that follow">Required Indicator?</span>
					<br /><cfinput type="radio" name="required_ind" id="required_ind_yes" value="1" checked="yes"><label for="required_ind_yes">Yes </label>
				 		<cfinput type="radio" name="required_ind" id="required_ind_no" value="0" ><label for="required_ind_no">No </label>
				</td>
				<cfif attributes.l_b_f_h_id EQ 0>
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
			<input type="hidden" name="l_b_f_h_id" value="#attributes.l_b_f_h_id#"/>
			<input type="submit" alt="submit" name="submit" value="Submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
