<!-- Administration/dsp_view_log_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_view_log_upload.cfm">
	<responsibilities>
		I show a list of files that have been uploaded into the system.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="2/28/11" role="FuseCoder" comments="Created File">
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
<div class="datachart" style="border:1px solid #999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" cols="7" summary="table displays list of files that have been uploaded into the system">
		<tr>
			<th>upload_id</th>
			<th>File&nbsp;Name</th>
			<th>Created&nbsp;Date</th>
			<th>Created&nbsp; By</th>
			<th>Active Indicator</th>
		</tr>
	<cfif get_log_upload.recordcount>
		<cfoutput query="get_log_upload">
		<cfif currentrow MOD 2>
			<cfset variables.row_color="eeeeee">
		<cfelse>
			<cfset variables.row_color="dddddd">
		</cfif>
		<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';" onclick="javascript:Element.toggle('var_id_#currentrow#'); return false;">
			<td scope="row">#upload_id#</td>
			<td><a href="Uploaded_Files/#archived_file_name#" title="#upload_source#, archived name is now #archived_file_name#" target="upload_id">#original_file_name#</a></td>
			<td>#dateformat(created_date)# #timeformat(created_date)#</td>
			<td><div title="from IP address #user_ip_address#">#created_by#</div></td>
			<td>#active_ind#</td>
		</tr>
		</cfoutput>
	</cfif>
	</table>
</div>