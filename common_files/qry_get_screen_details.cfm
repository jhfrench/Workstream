<!-- common_files/qry_get_screen_details.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_screen_details.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/24/2007" role="FuseCoder" comments="Created File">
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

<cfset variables.allowed_business_function_id=0>
<cfif isdefined("get_user_access") AND get_user_access.recordcount>
	<cfset variables.allowed_business_function_id=listappend(variables.allowed_business_function_id,valuelist(get_user_access.business_function_id))>
</cfif>
<cfquery name="get_screen_details" datasource="#application.datasources.main#">
SELECT REF_Screen.screen_id, REF_Screen.business_function_id, REF_Screen.module_id,
	REF_Screen.body_onload, REF_Screen.check_variable, REF_Screen.relocate,
	CASE
		WHEN REF_Screen.business_function_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#variables.allowed_business_function_id#">) THEN 1
		ELSE 0
	END AS screen_access_ind,
	CASE
		WHEN Lock_Module.module_id IS NULL THEN 0
		ELSE 1
	END AS locked_ind, Lock_Module.comments AS lock_module_comment
FROM REF_Screen
	LEFT OUTER JOIN Lock_Module ON REF_Screen.module_id=Lock_Module.module_id
		AND Lock_Module.active_ind=1
WHERE REF_Screen.active_ind=1
	AND REF_Screen.fuseaction=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#attributes.fuseaction#">
</cfquery>