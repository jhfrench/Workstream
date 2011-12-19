<!-- Reports/dsp_quarterly_tape_output.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_quarterly_tape_output.cfm">
	<responsibilities>
		I display the quarterly tape report.
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
		<br />QUARTERLY EXTRACT BY CONTRACTOR FOR FY #left(attributes.fiscal_qtr,4)# QTR #right(attributes.fiscal_qtr,1)#
	</div>
	<div id="column_right">
		AS OF DATE #get_quarter_as_of.as_of_date#
	</div>
</div>
<p>
<table cols="27">
	<tr>
		<th align="center" scope="col">CFDA-NUMBER</th>
		<th align="center" scope="col">SAI-NUMBER</th>
		<th align="center" scope="col">REC-NAME</th>
		<th align="center" scope="col">REC-CITY-CD</th>                                                                   
		<th align="center" scope="col">REC-CITY-NAME</th>
		<th align="center" scope="col">REC-COUNTY-CD</th> 
		<th align="center" scope="col">REC-COUNTY-NAME</th>
		<th align="center" scope="col">REC-STATE</th>
		<th align="center" scope="col">REC-ZIP-CD</th>
		<th align="center" scope="col">PROJ-DESC</th>
		<th align="center" scope="col">TYPE-RECIP</th>
		<th align="center" scope="col">TYPE-ACTION</th>
		<th align="center" scope="col">REC-CONG-DIST</th>
		<th align="center" scope="col">AG-ORG-CD</th>
		<th align="center" scope="col">FED-AWARD-ID-NUMBER</th>
		<th align="center" scope="col">MOD-NUM</th>
		<th align="center" scope="col">FED-FUND-SIGN</th>
		<th align="center" scope="col">FED-FUND-AMOUNT</th>
		<th align="center" scope="col">NONFED-FUND-SIGN</th>
		<th align="center" scope="col">NONFED-FUND-AMOUNT</th>
		<th align="center" scope="col">ACTION-DATE</th>
		<th align="center" scope="col">START-DATE</th>
		<th align="center" scope="col">END DATE</th>
		<th align="center" scope="col">TYPE ASSIST</th>
		<th align="center" scope="col">RECORD TYPE</th>
		<th align="center" scope="col">LATE INDICATOR</th>
		<th align="center" scope="col">CORRECTION</th>
		<th align="center" scope="col">GEOG-CD</th>
	</tr>
<cfloop query="get_quarterly_tape">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cccccc';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<td>#cfda_number#</td>
		<td>#sai_number#</td>
		<td>#rec_name#</td>
		<td>#rec_city_cd#</td>                                                                   
		<td>#rec_city_name#</td>
		<td>#rec_county_cd#</td> 
		<td>#rec_county_name#</td>
		<td>#rec_state#</td>
		<td>#rec_zip_cd#</td>
		<td>#proj_desc#</td>
		<td>#type_recip#</td>
		<td>#type_action#</td>
		<td>#rec_cong_dist#</td>
		<td>#ag_org_cd#</td>
		<td scope="row"><a href="javascript:special_maintenance(#faad_internal_data_id#);">#fed_award_id_number#</a></td>
		<td>#mod_num#</td>
		<td>#fed_fund_sign#</td>
		<td align="right">#numberformat(fed_fund_amount)#</td>
		<td>#nonfed_fund_sign#</td>
		<td align="right">#numberformat(nonfed_fund)#</td>
		<td align="right">#action_date#</td>
		<td align="right">#start_date#</td>
		<td align="right">#end_date#</td>
		<td>#type_assist#</td>
		<td>#record_type#</td>
		<td>#late_indicator#</td>
		<td>#correction#</td>
		<td>#geog_cd#</td>
	</tr>
</cfloop>
</table>
</cfoutput>