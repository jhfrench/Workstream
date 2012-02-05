<!-- Requirements/qry_get_priority.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_priority.cfm">
	<responsibilities>
		I retrieve all priorities from REF_Priority table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_priority" datasource="#application.datasources.main#">
SELECT priority_id, description
FROM REF_Priority
ORDER BY sort_order
</cfquery>