<!-- Home/dsp_user_preferences.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_user_preferences.cfm">
	<responsibilities>
		I display the form for a user for editing preferences.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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
#attributes.display_message#
</cfoutput>
<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the data held in the table below">
	<tr>
		<th align="left"><h2 style="margin:0px" id="top-side">User Preferences</h2></th>
	</tr>
</table>
<img src="images/spacer.gif" alt="" width="560" height="1"><br />
<cfoutput>
<cfform name="form_user_preferences_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the table within that houses the form">
	<tr bgcolor="##cccccc"><th><strong>Edit User Preference</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
			<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays program edit user preferences">
				<tr>
					<td><label for="program_year_id"><strong>Program Year: </strong></label></td>
					<td>
						<cfselect name="program_year_id" id="program_year_id" query="get_user_program_year_access" value="program_year_id" display="description" selected="#session.program_year_id#" required="yes" message="Please specify the program year(s).">
						</cfselect>
					</td>
				</tr><!---
				<tr>
					<td title="associated with the radio button following"><strong>Dollar Formatting:</strong></td>
					<td>
						<cfset attributes.numeric_multiplier_id=session.numeric_multiplier_id>
						<cfinclude template="../common_files/dsp_numeric_multiplier.cfm">
					</td>
				</tr>--->
				<tr>
					<td><strong>Text Size:</strong></td>
					<td>
						<input type="radio" name="text_size" value="none" onclick="chooseStyle(this.value, 365)" id="small"<cfif NOT comparenocase(session.text_size,"none")> checked="checked"</cfif>><label for="small"> Small (default)&nbsp;</label>
						<input type="radio" name="text_size" value="alt2" onclick="chooseStyle(this.value, 365)" id="medium"<cfif NOT comparenocase(session.text_size,"alt2")> checked="checked"</cfif>><label for="medium">Medium&nbsp;</label>
						<input type="radio" name="text_size" value="alt3" onclick="chooseStyle(this.value, 365)" id="large"<cfif NOT comparenocase(session.text_size,"alt3")> checked="checked"</cfif>><label for="large">Large&nbsp;</label>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<cfinput type="submit" alt="submit" name="submit" value=" Submit ">
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>