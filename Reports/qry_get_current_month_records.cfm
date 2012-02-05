<!-- Reports/qry_get_current_month_records.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_current_month_records.cfm">
	<responsibilities>
		I display the my ICET page to the user
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="3/15/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="get_current_month_records" datasource="#application.datasources.main#">
SELECT contract_num, mod_num, recip_name,
	action_date, CASE WHEN fed_fund_sign ='-' THEN '-' ELSE '&nbsp;' END AS fed_fund_sign, ABS(fed_fund_amount) AS fed_fund_amount, faad_internal_data_id
FROM FAAD_Internal_Data
WHERE fed_fund_amount!=0 /*don't output $0 records*/
	AND upload_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.upload_id#" />
ORDER BY #attributes.sort_order#, faad_internal_data_id
</cfquery>