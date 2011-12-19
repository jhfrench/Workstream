<!-- Reports/qry_get_quarterly_tape.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_quarterly_tape.cfm">
	<responsibilities>
		I display the my ICET page to the user
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="3/15/2009" role="FuseCoder" comments="Created File">
			$Id:$
			(jf | 1/12/10)
			Display mod number on the non-.txt views also.
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

<cfquery name="get_quarterly_tape" datasource="#application.datasources.main#">
SELECT<cfif isdefined("attributes.top_ind")> TOP 50</cfif> ISNULL(cfda,'43.AAA') AS cfda_number, 'SAI EXEMPT' AS sai_number, 
<cfif attributes.report_output_format_id EQ 4>CAST(ISNULL(recip_name,'') AS CHAR(45)) AS rec_name,
	CAST(ISNULL(recip_city_cd,'') AS CHAR(5)) AS rec_city_cd, CAST(ISNULL(recip_city_name,'') AS CHAR(21)) AS rec_city_name, CAST(ISNULL(recip_county_cd,'') AS CHAR(3)) AS rec_county_cd,
	CAST(ISNULL(recip_county_name,'') AS CHAR(21)) AS rec_county_name, CAST(ISNULL(recip_state,'') AS CHAR(2)) AS rec_state, CAST(ISNULL(recip_zip_cd,'') AS CHAR(9)) AS rec_zip_cd,
	CAST(ISNULL(proj_desc,'') AS CHAR(149)) AS proj_desc, CAST(ISNULL([type_recip],'') AS CHAR(2)) AS [type_recip], CAST(ISNULL(type_action,'') AS CHAR(1)) AS type_action,
	CAST(ISNULL(recip_cong_dist,'') AS CHAR(2)) AS rec_cong_dist, '8000' AS ag_org_cd, CAST(ISNULL(contract_num,'') AS CHAR(16))+CAST(mod_num AS CHAR(4)) AS fed_award_id_number,
	CAST(ISNULL(fed_fund_sign,'') AS CHAR(1)) AS fed_fund_sign, CAST(ABS(fed_fund_amount) AS CHAR(10)) AS fed_fund_amount, ' ' AS nonfed_fund_sign,
	'          ' AS nonfed_fund, CAST(ISNULL(action_date,'') AS CHAR(8)) AS action_date, CAST(ISNULL(start_date,'') AS CHAR(8)) AS start_date,
	CAST(ISNULL(end_date,'') AS CHAR(8)) AS end_date, CAST(ISNULL(type_assist,'') AS CHAR(2)) AS type_assist, '2' AS record_type,
	CAST(ISNULL(late_indicator,'') AS CHAR(1)) AS late_indicator, CAST(ISNULL(correction,'') AS CHAR(5)) AS correction, CAST(ISNULL(geog_cd,'') AS CHAR(7)) AS geog_cd,
	faad_internal_data_id
<cfelse>recip_name AS rec_name,
	recip_city_cd AS rec_city_cd, recip_city_name AS rec_city_name, recip_county_cd AS rec_county_cd,
	recip_county_name AS rec_county_name, recip_state AS rec_state, recip_zip_cd AS rec_zip_cd,
	proj_desc AS proj_desc, [type_recip], type_action AS type_action,
	recip_cong_dist AS rec_cong_dist, '8000' AS ag_org_cd, contract_num AS fed_award_id_number, mod_num,
	fed_fund_sign, ABS(fed_fund_amount) AS fed_fund_amount, '' AS nonfed_fund_sign,
	'' AS nonfed_fund, action_date, [start_date],
	[end_date], type_assist, '2' AS record_type,
	late_indicator, correction, geog_cd,
	faad_internal_data_id
</cfif>
FROM FAAD_Internal_Data
WHERE fed_fund_amount!=0 /*don't output $0 records*/
	AND fiscal_qtr='#attributes.fiscal_qtr#'
ORDER BY #attributes.sort_order#
</cfquery>