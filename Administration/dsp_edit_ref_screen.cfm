<!-- Administration/dsp_edit_ref_screen.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_screen.cfm">
	<responsibilities>
		I display the form for screen maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/15/2007" role="FuseCoder" comments="Created File">
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

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="#cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="#cccccc"><th><strong><cfif attributes.screen_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> SCREEN</strong></th></tr>
	<tr bgcolor="#eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0"  summary="Table displays new user information">
			<cfform name="choose_screen" action="" method="post">
			<tr>
				<td colspan="3">
					<cfselect name="screen_id" value="screen_id" display="fuseaction" query="get_ref_screen" selected="#attributes.screen_id#"></cfselect><input type="submit" alt="Retrieve Screen Settings" value="Retrieve Screen Settings" />
					<br /><a href="index.cfm?fuseaction=Administration.edit_ref_screen">Add new REF_Screen record</a>
				</td>
			</tr>
			</cfform>
			<cfform name="ref_screen_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
			<tr>
				<td><label for="module_id">Module</label>: </td>
				<td align="left" colspan="2">
				<cfselect name="module_id" id="module_id" query="get_ref_module" value="module_id" display="description" selected="#attributes.module_id#" required="yes" message="Please specify module.">
				</cfselect>
				</td>
			</tr>
			<tr>
				<td><label for="new_fuseaction">Fuseaction (no need to type '[module].')</label>: </td>
				<td align="left" colspan="2">
					<cfinput type="text" name="new_fuseaction" id="fuseaction" value="#listlast(attributes.new_fuseaction,'.')#" size="45" maxlength="45" required="yes" message="Please enter fuseaction">
				</td>
			</tr>
			<tr>
				<td><label for="business_function_id">Business Function</label>: </td>
				<td align="left" colspan="2">
					<cfselect name="business_function_id" id="business_function_id" query="get_business_function" value="business_function_id" display="description" selected="#attributes.business_function_id#" required="yes" message="Please specify business function.">
					</cfselect>
				</td>
			</tr>
			<tr>
				<td><label for="check_variable">Check variable</label>: </td>
				<td align="left">
					<cfinput type="text" name="check_variable" id="check_variable" size="30" maxlength="100" value="#attributes.check_variable#">
					<br />(If supplied, system will check for the existence of this variable. If the variable is not defined, system will redirect user to fuseaction selected as 'relocate')
				</td>
				<cfif attributes.screen_id EQ 0>
					<input type="hidden" name="active_ind" value="1"/>
				<cfelse>
				<td align="left">
					<cfif attributes.active_ind>
						<cfset variables.yes_check="yes">
						<cfset variables.no_check="no">
					<cfelse>
						<cfset variables.yes_check="no">
						<cfset variables.no_check="yes">
					</cfif>
					<span title="describes the purpose of the radio buttons following">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes </label>
				 		<cfinput type="radio" name="active_ind" id="active_ind_no" value="0" ><label for="active_ind_no">No </label>
				</td>
				</cfif>
			</tr>
			<tr>
				<td><label for="relocate">Relocate</label>: </td>
				<td align="left">
					<cfselect name="relocate" id="relocate" query="get_ref_screen" value="fuseaction" display="fuseaction" selected="#attributes.relocate#">
					</cfselect>
				</td>
				<td align="left">
					<cfif attributes.starting_point_ind>
						<cfset variables.yes_check="yes">
						<cfset variables.no_check="no">
					<cfelse>
						<cfset variables.yes_check="no">
						<cfset variables.no_check="yes">
					</cfif>
					<span title="describes the purpose of the following radio buttons">Starting Point Indicatior?</span>
					<br />
					<cfinput type="radio" name="starting_point_ind" id="starting_point_ind_yes" value="1" checked="#variables.yes_check#"><label for="starting_point_ind_yes">Yes </label>
				 	<cfinput type="radio" name="starting_point_ind" id="starting_point_ind_no" value="0" checked="#variables.no_check#"><label for="starting_point_ind_no">No </label>
				</td>
			</tr>
			<tr>
				<td><label for="body_onload">Body Onload</label>: </td>
				<td align="left"><cfinput type="text" name="body_onload" id="body_onload" size="40" maxlength="4000" value="#attributes.body_onload#" required="no"></td>
				<td align="left">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="#dddddd">
		<td align="center" colspan="3">
			<cfoutput>
			<input type="hidden" name="screen_id" value="#attributes.screen_id#" />
			<input type="submit" alt="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
			</cfoutput>
		</td>
	</tr>
	</cfform>
</table>
</div>