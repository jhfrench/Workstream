<!-- Reports/dsp_current_month_records_output.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_current_month_records_output.cfm">
	<responsibilities>
		I display the current month report
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
<cfswitch expression="#right(action_date, 2)#">
	<cfcase value="10,11,12">
		<cfset variables.quarter_description="FIRST">
	</cfcase>
	<cfcase value="01,02,03">
		<cfset variables.quarter_description="SECOND">
	</cfcase>
	<cfcase value="04,05,06">
		<cfset variables.quarter_description="THIRD">
	</cfcase>
	<cfcase value="07,08,09">
		<cfset variables.quarter_description="FOURTH">
	</cfcase>
</cfswitch>
<div id="container">
	<div id="column_left">
		RUN DATE #dateformat(now(), "mm/dd/yyyy")#
	</div>
	<div align="center" id="column_center">
		NATIONAL AERONAUTICS AND SPACE ADMINISTRATION
		<br />HEADQUARTERS, WASHINGTON, D. C.
		<p>FINANCIAL AND CONTRACTUAL STATUS
		<p>FEDERAL ASSISTANCE AWARD DATA SYSTEM
		<br />LISTING OF KNOWN PROGRAMS PROCESSED DURING #ucase(monthasstring(right(action_date,2)))#  OF FISCAL YEAR #left(action_date,4)#
	</div>
	<div id="column_right">
		AS OF DATE #action_date##daysinmonth("#right(action_date,2)#/15/#left(action_date,4)#")#
	</div>
	<img src="images/spacer.gif" alt="" height="1" width="700" border="0" />
</div>
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="I display the Monthly report">
	<thead>
	<tr valign="bottom">
		<th align="center">Award Number</th>
		<th align="center">Modified Number</th>
		<th align="center">Recipient&nbsp;Organization</th>
		<th align="center">Date Posted</th>
		<th colspan="2" align="center">Dollar&nbsp;Value</th>
	</tr>
	</thead>
	<tbody>
<cfloop query="get_current_month_records">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cccccc';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<td nowrap="nowrap" scope="row"><a href="javascript:special_maintenance(#faad_internal_data_id#);">#contract_num#</a></td>
		<td align="right">#mod_num#</td>
		<td nowrap="nowrap">#recip_name#</td>
		<td align="right">#action_date#</td>
		<td>#fed_fund_sign# $</td>
		<td align="right">#numberformat(fed_fund_amount)#</td>
	</tr>
</cfloop>
	</tbody>
</table>
</cfoutput>