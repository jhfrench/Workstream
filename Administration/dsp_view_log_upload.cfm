<!-- Administration/dsp_view_log_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_view_log_upload.cfm">
	<responsibilities>
		I show a list of files that have been uploaded into the system.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="2/28/11" role="FuseCoder" comments="Created File">
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
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>View Uploaded Files</h2></caption>
	<thead>
		<tr>
			<th>upload_id</th>
			<th>File&nbsp;Name</th>
			<th>Created&nbsp;Date</th>
			<th>Created&nbsp; By</th>
			<th>Active Indicator</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_log_upload">
		<tr>
			<td scope="row">#upload_id#</td>
			<td><a href="Uploaded_Files/#archived_file_name#" title="#upload_source#, archived name is now #archived_file_name#" target="upload_id">#original_file_name#</a></td>
			<td>#dateformat(created_date)# #timeformat(created_date)#</td>
			<td><span title="from IP address #user_ip_address#">#created_by#</span></td>
			<td>#active_ind#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>