<!-- Reports/dsp_current_quarter_records_output.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_current_quarter_records_output.cfm">
	<responsibilities>
		I display the my ICET dspe to the user
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="3/15/2009" role="FuseCoder" comments="Created File">
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
<div id="container">
	<div id="column_left">
		RUN DATE #dateformat(now(), "mm/dd/yyyy")#
	</div>
	<div align="center" id="column_center">
		NATIONAL AERONAUTICS AND SPACE ADMINISTRATION
		<br />HEADQUARTERS, WASHINGTON, D. C.
		<p>FINANCIAL AND CONTRACTUAL STATUS
		<p>FEDERAL ASSISTANCE AWARD DATA SYSTEM
		<br />QUARTERLY EXTRACT BY <cfif NOT comparenocase(listfirst(sort_order),"contract_num")>AWARD NUMBER<cfelse>CONTRACTOR</cfif> FOR <acronym title="fiscal year">FY</acronym> #left(attributes.fiscal_qtr,4)# QTR #right(attributes.fiscal_qtr,1)#
	</div>
	<div id="column_right">
		AS OF DATE #get_quarter_as_of.as_of_date#
	</div>
	<img src="images/spacer.gif" alt="" height="1" width="720" border="0" />
</div>
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="I display the Quarterly report">
	<thead>
	<tr valign="bottom">
		<th align="center">Award Number</th>
		<th align="center">Modified Number</th>
		<th align="center">Action Date</th>
		<th align="center">Type Assist</th>
		<th align="center">Type Recipient</th>
		<th align="center">Contractor Name</th>
	</tr>
	</thead>
	<tbody>
<cfloop query="get_current_quarter_records">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cccccc';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<td scope="row"><a href="javascript:special_maintenance(#faad_internal_data_id#);">#contract_num#</a></td>
		<td>#mod_num#</td>
		<td align="right">#action_date#</td>
		<td align="right">#type_assist#</td>
		<td align="right">#type_recip#</td>
		<td>#recip_name#</td>
	</tr>
</cfloop>
	</tbody>
</table>
</cfoutput>