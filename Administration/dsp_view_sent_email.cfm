<!-- Administration/dsp_view_sent_email.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_view_sent_email.cfm">
	<responsibilities>
		I show a list of emails that have been sent by the system.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="2/28/11" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 6/15/11)
			Added ability to view emails sent through the application.
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
	<caption><h2>View Sent Emails</h2></caption>
	<thead>
		<tr>
			<th>email_id</th>
			<th>Sender</th>
			<th>Recipients</th>
			<th>Subject</th>
			<th>Attachment</th>
			<th>Message</th>
			<th>Created&nbsp;Date</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_log_email" group="email_id" groupcasesensitive="no">
		<tr>
			<td scope="row">#email_id#</td>
			<td>#sender# (#reply_to#)</td>
			<td>#email_address#<cfif len(carbon_copy_to)> (CC: #carbon_copy_to#)</cfif></td>
			<td>#subject#</td>
			<td><a href="Uploaded_Files/#archived_file_name#" title="#upload_id#, archived name is now #archived_file_name#" target="upload_id">#original_file_name#</a></td>
			<td>#email_body#</td>
			<td>#dateformat(created_date)# #timeformat(created_date)#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>