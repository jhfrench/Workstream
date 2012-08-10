<!-- Home/dsp_message_commands.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_message_commands.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="10/2/2007" role="FuseCoder" comments="Created File">
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

<cfinclude template="../common_files/qry_get_system_note.cfm">
<div style="color:white;padding-bottom:3px;font-weight: bold;">Messages (<cfoutput>#get_system_note.recordcount#</cfoutput>):</div>
<table cellspacing="1" cellpadding="3" border="0" width="100%" align="center" style="border:1px solid white;" summary="Table displays message command">
<cfoutput query="get_system_note">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="bbbbbb">
	<cfelse>
		<cfset variables.row_color="aaaaaa">
	</cfif>
	<tr>
		<td bgcolor="###variables.row_color#">
			<p style="margin-top:0px;margin-bottom:2px;color:black">#note_text#</span></p>
			<p align="right" style="margin-top:0px;margin-bottom:0px;"><small><i>&raquo;#created_by#&ndash;#dateformat(created_date,"m/d/yyyy")#</small></i></p>
		</td>
	</tr>
</cfoutput>
</table>
<script type="text/javascript" language="javascript">
	checkTrack();
</script>
