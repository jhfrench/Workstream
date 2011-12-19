<!-- Application_Manager/main/act_view_report_type_id_2.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="act_view_report_type_id_2.cfm" Specification="2.0">
	<responsibilities>
		I provide an interface for entering data about a new support contact.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/25/2008" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_get_report_output" datasource="#application.datasources.application_manager#">
SELECT product_name, Data.page_count, Data.error_count, 
	CASE
		WHEN NVL(Data.page_count,0)=0 THEN Data.error_count
		ELSE Data.error_count/Data.page_count
	END*1000 AS error_rate
FROM (
	SELECT Product.product_name, SUM(NVL(LOG_Page_Request.page_count,0)) AS page_count, SUM(NVL(Error_LOG.error_count,0)) AS error_count
	FROM Product
		INNER JOIN Installation ON Installation.product_id=Product.product_id
		LEFT OUTER JOIN (
			SELECT installation_id, COUNT(*) AS page_count
			FROM LOG_Page_Request
			WHERE 1=1
				AND created_date BETWEEN #createodbcdate(attributes.date_start)# AND #createodbcdate(attributes.date_end)#+1
			GROUP BY installation_id
		) LOG_Page_Request ON Installation.installation_id=LOG_Page_Request.installation_id
		LEFT OUTER JOIN (
			SELECT installation_id, COUNT(*) AS error_count
			FROM Error_LOG
			WHERE 1=1
				AND error_sql_datetime BETWEEN #createodbcdate(attributes.date_start)# AND #createodbcdate(attributes.date_end)#+1
			GROUP BY installation_id
		) Error_LOG ON Installation.installation_id=Error_LOG.installation_id
	GROUP BY Product.product_name
	) Data
ORDER BY product_name
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
		<cfchartseries type="bar" serieslabel="Page Count" paintstyle="plain" markerstyle="circle" query="qry_get_report_output" itemcolumn="product_name" valuecolumn="page_count">
		</cfchartseries>
	</cfif>
	<cfif listfind(attributes.metric_id, 2)>
		<cfchartseries type="bar" serieslabel="Error Count" paintstyle="plain" markerstyle="circle" query="qry_get_report_output" itemcolumn="product_name" valuecolumn="error_count">
		</cfchartseries>
	</cfif>
	<cfif listfind(attributes.metric_id, 3)>
		<cfchartseries type="bar" serieslabel="Error Rate" paintstyle="plain" markerstyle="circle" query="qry_get_report_output" itemcolumn="product_name" valuecolumn="error_rate">
		</cfchartseries>
	</cfif>
</cfchart>
<table border="1">
	<tr>
		<th scope="column">Product</th>
		<cfif listfind(attributes.metric_id, 1)><th scope="column" valign="bottom">Page Count</th></cfif>
		<cfif listfind(attributes.metric_id, 2)><th scope="column" valign="bottom">Error Count</th></cfif>
		<cfif listfind(attributes.metric_id, 3)><th scope="column" valign="bottom">Error Rate<br />(per 1k page loads)</th></cfif>
	</tr>
	<cfoutput query="qry_get_report_output">
	<tr>
		<td scope="row">#product_name#</td>
		<cfif listfind(attributes.metric_id, 1)><td align="right">#page_count#</td></cfif>
		<cfif listfind(attributes.metric_id, 2)><td align="right">#error_count#</td></cfif>
		<cfif listfind(attributes.metric_id, 3)><td align="right">#numberformat(error_rate, "9999.999")#</td></cfif>
	</tr>
	</cfoutput>
</table>
<hr />