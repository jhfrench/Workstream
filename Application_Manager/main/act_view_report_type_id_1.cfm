<!-- Application_Manager/main/act_view_report_type_id_1.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="act_view_report_type_id_1.cfm" Specification="2.0">
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

<cfquery name="qry_get_report_output" datasource="#application.datasources.main#">
SELECT Date_Period.date_period<cfif listfind(attributes.metric_id, 1)>, COALESCE(LOG_Page_Request.page_count,0) AS page_count</cfif><cfif listfind(attributes.metric_id, 2)>, COALESCE(Error_LOG.error_count,0) AS error_count</cfif><cfif listfind(attributes.metric_id, 3)>, COALESCE(Error_LOG.error_count,0)/COALESCE(LOG_Page_Request.page_count,COALESCE(Error_LOG.error_count,1))*1000 AS error_rate</cfif>
FROM (
		SELECT TO_CHAR(created_date, 'yyyy mm') AS date_period
		FROM (
			SELECT created_date
			FROM LOG_Page_Request<cfif attributes.installation_id NEQ 0>
			WHERE installation_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#application.installation_id#"></cfif>
			UNION
			SELECT error_sql_datetime
			FROM Error_LOG<cfif attributes.installation_id NEQ 0>
			WHERE installation_id=#attributes.installation_id#</cfif>
		) Dates
		WHERE created_date BETWEEN #createodbcdate(attributes.date_start)# AND #createodbcdate(attributes.date_end)#+1
		GROUP BY TO_CHAR(created_date, 'yyyy mm')
	) Date_Period
	LEFT OUTER JOIN (
		SELECT TO_CHAR(created_date, 'yyyy mm') AS date_period, COUNT(*) AS page_count
		FROM LOG_Page_Request
		WHERE 1=1<cfif attributes.installation_id NEQ 0>
			AND installation_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#application.installation_id#"></cfif>
			AND created_date BETWEEN #createodbcdate(attributes.date_start)# AND #createodbcdate(attributes.date_end)#+1
		GROUP BY TO_CHAR(created_date, 'yyyy mm')
	) LOG_Page_Request ON Date_Period.date_period=LOG_Page_Request.date_period
	LEFT OUTER JOIN (
		SELECT TO_CHAR(error_sql_datetime, 'yyyy mm') AS date_period, COUNT(*) AS error_count
		FROM Error_LOG
		WHERE 1=1<cfif attributes.installation_id NEQ 0>
			AND installation_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#application.installation_id#"></cfif>
			AND error_sql_datetime BETWEEN #createodbcdate(attributes.date_start)# AND #createodbcdate(attributes.date_end)#+1
		GROUP BY TO_CHAR(error_sql_datetime, 'yyyy mm')
	) Error_LOG ON Date_Period.date_period=Error_LOG.date_period
ORDER BY Date_Period.date_period
</cfquery>
<cfchart format="jpg"
	chartheight="400" chartwidth="950" databackgroundcolor="##ffffcc"
	showxgridlines="no" showygridlines="yes" showborder="yes"
	labelformat="number" sortxaxis="no"
	show3d="no" showlegend="yes"
	tipstyle="MouseOver" tipbgcolor="##ffff99"
	showmarkers="yes" markersize="5"><!--- 
	url="#variables.graph_url#" --->

	<cfif listfind(attributes.metric_id, 1)>
		<cfchartseries type="line" serieslabel="Page Count" paintstyle="plain" markerstyle="circle" query="qry_get_report_output" itemcolumn="date_period" valuecolumn="page_count">
		</cfchartseries>
	</cfif>
	<cfif listfind(attributes.metric_id, 2)>
		<cfchartseries type="line" serieslabel="Error Count" paintstyle="plain" markerstyle="circle" query="qry_get_report_output" itemcolumn="date_period" valuecolumn="error_count">
		</cfchartseries>
	</cfif>
	<cfif listfind(attributes.metric_id, 3)>
		<cfchartseries type="line" serieslabel="Error Rate" paintstyle="plain" markerstyle="circle" query="qry_get_report_output" itemcolumn="date_period" valuecolumn="error_rate">
		</cfchartseries>
	</cfif>
</cfchart>
<table border="1">
	<tr>
		<th scope="column">Date Period</th>
		<cfif listfind(attributes.metric_id, 1)><th scope="column" valign="bottom">Page Count</th></cfif>
		<cfif listfind(attributes.metric_id, 2)><th scope="column" valign="bottom">Error Count</th></cfif>
		<cfif listfind(attributes.metric_id, 3)><th scope="column" valign="bottom">Error Rate<br />(per 1k page loads)</th></cfif>
	</tr>
	<cfoutput query="qry_get_report_output">
	<tr>
		<td scope="row">#date_period#</td>
		<cfif listfind(attributes.metric_id, 1)><td align="right">#page_count#</td></cfif>
		<cfif listfind(attributes.metric_id, 2)><td align="right">#error_count#</td></cfif>
		<cfif listfind(attributes.metric_id, 3)><td align="right">#numberformat(error_rate, "9999.999")#</td></cfif>
	</tr>
	</cfoutput>
</table>
<hr />