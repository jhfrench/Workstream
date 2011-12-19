<!-- common_files/qry_get_fuseactions.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_fuseactions.cfm">
	<responsibilities>
		I retrieve fuseaction from REF_Screen table for a specified screen.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="get_fuseactions" datasource="#application.datasources.main#">
SELECT REF_Screen.screen_id, REF_Screen.fuseaction, REF_Screen.module_id,
	REF_Screen.business_function_id, NVL(REF_Module.description,'Unknown')||' > '||NVL(REF_Business_Function.description,'Unknown')||' ('||REF_Screen.fuseaction||')' AS display
FROM REF_Screen
	LEFT OUTER JOIN REF_Module ON REF_Screen.module_id=REF_Module.module_id
	LEFT OUTER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
WHERE <cfif attributes.screen_id NEQ 0>REF_Screen.screen_id=#attributes.screen_id#<cfelse>REF_Screen.active_ind=1</cfif>
ORDER BY NVL(REF_Module.sort_order,999999), NVL(REF_Business_Function.sort_order,999999), REF_Screen.fuseaction
</cfquery>
<cfset caller.get_fuseactions=get_fuseactions>
