<!-- Requirements/qry_get_fuseactions.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_fuseactions.cfm">
	<responsibilities>
		I retrieve all fuseactions from REF_Screen table.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_fuseactions" datasource="#application.datasources.main#">
SELECT screen_id, fuseaction
FROM REF_Screen
WHERE active_ind=1
GROUP BY screen_id, fuseaction
ORDER BY fuseaction
</cfquery>