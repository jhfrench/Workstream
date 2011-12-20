<!-- common_files/qry_get_fuseactions.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_fuseactions.cfm">
	<responsibilities>
		I retrieve fuseaction from REF_Screen table for a specified screen.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.screen_id" default="0">
<cfquery name="get_ref_screen_count" datasource="#application.datasources.main#">
SELECT COUNT(*) AS count1
FROM REF_Screen
WHERE active_ind=1
</cfquery>

<cfparam name="screen_id" default="0">
<cfquery name="get_fuseactions" datasource="#application.datasources.main#">
SELECT screen_id, fuseaction, module_id,
	business_function_id
FROM REF_Screen
WHERE <cfif attributes.screen_id NEQ 0>screen_id=#attributes.screen_id#<cfelse>active_ind=1</cfif>
ORDER BY fuseaction
</cfquery>
<cfset caller.get_fuseactions=get_fuseactions>