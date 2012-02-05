<!-- Reports/qry_get_month_posted.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_month_posted.cfm">
	<responsibilities>
		I retrieve the avaiable records for the month/year criteria.
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
<cfquery name="get_month_posted" datasource="#application.datasources.main#">
SELECT action_date, CAST(RIGHT(LEFT(action_date,6),2) AS CHAR(2))+'/'+CAST(LEFT(action_date,4) AS CHAR(4)) AS date_posted
FROM (
	SELECT LEFT(action_date,6) AS action_date
	FROM FAAD_Internal_Data
	WHERE action_date!=0
	GROUP BY LEFT(action_date,6)
) year_month_combinations
ORDER BY action_date DESC
</cfquery>