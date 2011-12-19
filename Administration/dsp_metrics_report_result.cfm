<!-- Administration/dsp_metrics_report_result.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_metrics_report_result.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/13/2009" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 9/9/9)
			Making corrections depicted in 508_jm_2009_09_09_5.png.
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
<cfif attributes.report_output_format_id EQ 1>
<a onclick="javascript:Element.toggle('selected_criteria');Element.toggle('show_criteria');Element.toggle('hide_criteria');" id="show_criteria"><img src="images/expand.gif" border="0" alt="Show search criteria"> Show search criteria</a><a onclick="javascript:Element.toggle('selected_criteria');Element.toggle('show_criteria');Element.toggle('hide_criteria');" id="hide_criteria" style="display:none;"><img src="images/collapse.gif" border="0" alt="Hide search criteria" /> Hide search criteria</a>
<div id="selected_criteria" style="display:none;">
</cfif>
Start Date: <cfif len(attributes.start_date)>#attributes.start_date#<cfelse>None specified</cfif><br />
End Date: <cfif len(attributes.end_date)>#attributes.end_date#<cfelse>None specified</cfif>
</div>
</cfoutput>

<table align="center" cellpadding="0" cellspacing="0" border="0" summary="Table shows counts of different types of information for the specified date range. All numbers are for the entire Federal Assistance Award Data.">
	<tr bgcolor="#808080">
		<th scope="col">Registered Vendors</th>
		<th scope="col">New Registrations</th>
		<th scope="col">Renewed Registrations</th>
		<th scope="col">Registered Businesses</th>
		<th scope="col">Vendor Points of Contact</th>
	</tr>
<cfoutput query="get_metrics_report">
	<tr<cfif currentrow MOD 2> bgcolor="##cccccc"</cfif>>
		<td align="right">#registered_vendor_count#</td>
		<td align="right">#new_registration_count#</td>
		<td align="right">#renewed_registrations_count#</td>
		<td align="right">#registered_business_count#</td>
		<td align="right">#vendor_poc_count#</td>
	</tr>
</cfoutput>
</table>