<!-- common_files/qry_get_screen_id_from_referrer.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_screen_id_from_referrer.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_screen_id_from_referrer" datasource="#application.datasources.main#">
SELECT screen_id
FROM REF_Screen
WHERE fuseaction='#listlast(cgi.http_referer,"=")#'
</cfquery>