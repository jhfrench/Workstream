<!-- common_files/qry_get_secured_screens.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_secured_screens.cfm">
	<responsibilities>
		I look up active screens that are marked as requiring a login to access
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/29/2013" role="FuseCoder" comments="Created File">
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

<cfquery name="get_secured_screens" datasource="#application.datasources.main#">
SELECT REF_Screen.fuseaction
FROM REF_Screen
	INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
WHERE REF_Screen.active_ind=1
	AND REF_Business_Function.active_ind=1
	AND REF_Business_Function.require_login_ind=1
GROUP BY REF_Screen.fuseaction
ORDER BY REF_Screen.fuseaction
</cfquery>
<cfset application.private_fuseactions=valuelist(get_secured_screens.fuseaction)>