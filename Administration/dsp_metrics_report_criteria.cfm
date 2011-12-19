<!-- Administration/dsp_metrics_report_criteria.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_metrics_report_criteria.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/13/2009" role="FuseCoder" comments="Created File">
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

<!--- <!--- Query gets funds that are in the Internal Execution Plan data --->
<cfinclude template="../common_files/qry_get_ref_business_category.cfm">
<cfinclude template="../common_files/qry_get_ref_naics.cfm">
 --->

<h2 style="margin:0px" id="top-side">Search Vendors</h2>
<cfoutput>
<cfform name="mainform" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Criteria form for Operating Plan Control Report.">
	<tr bgcolor="##cccccc">
		<th colspan="2" scope="col"><strong>Vendor Search Criteria</strong></th>
	</tr>
	<tr bgcolor="##eeeeee">
		<td nowrap><label for="start_date">Start Date</label>:</td>
		<td><cfinput type="text" name="start_date" id="start_date" size="8" maxlength="10" value="" tabindex="1" required="no" validate="date" message="Please enter a properly formatted start date (mm/dd/yyyy)."></td>
	</tr>
	<tr bgcolor="##eeeeee">
		<td nowrap><label for="end_date">End Date</label>:</td>
		<td><cfinput type="text" name="end_date" id="end_date" size="8"  maxlength="10" value="" tabindex="2" required="no" validate="date" message="Please enter a properly formatted end date (mm/dd/yyyy)."></td>
	</tr>
	<cfinclude template="../common_files/dsp_report_output_format.cfm">
	<tr bgcolor="##dddddd">
		<td align="center" colspan="2">
			<input name="search" type="submit" alt="Run Report" value="Run Report" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
