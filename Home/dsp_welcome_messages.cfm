<!-- Home/dsp_welcome_messages.cfm
	Author: Jeromy French-->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_welcome_messages.cfm">
	<responsibilities>
		I display the form to show messages on Main page.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/24/2007" role="FuseCoder" comments="Created File">
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
<cfif listfind(variables.allowed_business_function_id,123)>
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_system_note" fuseaction="Administration.edit_system_note" field_name="system_note_id">
</cfif>
<cfoutput>
<table class="formname" border="0" cellpadding="6" cellspacing="0" bgcolor="##d1dee5" summary="Table displays edit messages">
	<tbody>
		<tr align="left" bgcolor="##999999">
			<th>System Messages (<span id="Message_count">#get_system_note.recordcount#</span>)</th>
		</tr>
		<cfloop query="get_system_note">
		<cfif currentrow MOD 2>
			<cfset variables.row_color="dddddd">
		<cfelse>
			<cfset variables.row_color="eeeeee">
		</cfif>
		<tr align="left" bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';" onmouseout="this.bgColor='###variables.row_color#';">
			<td id="message_#system_note_id#">
				<p style="margin-top:0px;margin-bottom:2px;"><span id="message2">#note_text#</span></p>
				<p align="right" style="margin-top:0px;margin-bottom:0px;font-style:italic;">&raquo;<span id="message2_owner">#created_by#</span>
				<br /><span id="message2_date">#dateformat(display_start_date, "mm/dd/yyyy")#<cfif len(display_end_date)> through #dateformat(display_end_date, "mm/dd/yyyy")#</cfif></em>
				<!--- if the user has access to edit system notes --->
				<cfif listfind(variables.allowed_business_function_id,123)><br /><a href="javascript:edit_system_note(#system_note_id#)">Edit System Note</a></cfif>
			</td>
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>