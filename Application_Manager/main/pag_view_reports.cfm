<!-- Application_Manager/main/pag_view_reports.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_view_reports.cfm" Specification="2.0">
	<responsibilities>
		I provide an interface for entering data about a new support contact.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/25/2008" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfinclude template="act_view_reports.cfm">

<cfform name="reports_menu" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table width="60%">
	<tr>
		<td colspan="2" class="Forum_AltHeaderText">Report Criteria</td>
	</tr>
	<tr>
		<td width="50">Report Type</td>
		<td>
			<label for="report_type_id_1"><cfinput type="radio" name="report_type_id" id="report_type_id_1" value="1" checked="#variables.report_type_id_1_selected_ind#" onChange="toggle_installation_id_row();" required="yes" message="please specify the type of report you want to run" />Trend</label>
			<label for="report_type_id_2"><cfinput type="radio" name="report_type_id" id="report_type_id_2" value="2" checked="#variables.report_type_id_2_selected_ind#" onChange="toggle_installation_id_row();" required="yes" message="please specify the type of report you want to run" />Benchmark</label>
		</td>
	</tr>
	<tr>
		<td width="50">Metrics</td>
		<td>
			<label for="metric_1"><cfinput type="checkbox" name="metric_id" id="metric_1" value="1" checked="#variables.metric_1_selected_ind#" required="yes" message="please specify at least one metric to include" />Page loads</label>
			<label for="metric_2"><cfinput type="checkbox" name="metric_id" id="metric_2" value="2" checked="#variables.metric_2_selected_ind#" required="yes" message="please specify at least one metric to include" />Errors</label>
			<label for="metric_3"><cfinput type="checkbox" name="metric_id" id="metric_3" value="3" checked="#variables.metric_3_selected_ind#" required="yes" message="please specify at least one metric to include" />Error Rate</label>
		</td>
	</tr>
	<tr>
		<td width="50">Date Range</td>
		<td>
			<label for="date_start">Start date</label>: <cfinput type="text" name="date_start" id="date_start" value="#attributes.date_start#" size="8" maxlength="10" required="yes" message="Please enter a start date in m/d/yyyy format">
			<label for="date_end">End date</label>: <cfinput type="text" name="date_end" id="date_end" value="#attributes.date_end#" size="8" maxlength="10" required="yes" message="Please enter an end date in m/d/yyyy format">
		</td>
	</tr>
	<tr id="installation_id_row" style="display:none">
		<td width="50">Installation</td>
		<td>
			<cfselect name="installation_id" query="qry_get_installation_url" value="installation_id" display="url_to_base" selected="#attributes.installation_id#" required="yes" message="Please specify the installation.">
				<option value="0" selected="selected">All</option>
			</cfselect>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="Forum_AltHeaderText"><input type="submit" name="submit_form" value="Retrieve report" /></td>
	</tr>
</table>
</cfform>
<script language="javascript">
	toggle_installation_id_row();
</script>