<!-- Requirements/qry_get_screen_requirements.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_screen_requirements.cfm">
	<responsibilities>
		I retrieve requirements for the page the user is viewing.
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

<cfparam name="session.hide_general_requirements" default="1">
<cfparam name="session.hide_module_all" default="1">
<cfparam name="session.hide_coded_requirements" default="0">
<cfquery name="get_screen_requirements" datasource="#application.datasources.main#">
SELECT Requirement.requirement_id, Requirement.requirement_number, Requirement.description AS requirement,
	Requirement.active_ind, REF_Business_Function.description AS business_function, REF_Requirement_Type.description AS requirement_type,
	Link_Screen_Requirement.l_s_r_id, Link_Screen_Requirement.requirement_coded_ind, REF_Product_Version.description AS product_version,
	CASE
		WHEN fuseaction='#attributes.fuseaction#' THEN 'screen-specific'
		WHEN fuseaction LIKE '#listfirst(attributes.fuseaction,".")#.%' THEN 'general&nbsp;module'
		ELSE 'All&nbsp;screens'
	END AS requirement_level
FROM Link_Screen_Requirement
	INNER JOIN REF_Screen ON Link_Screen_Requirement.screen_id=REF_Screen.screen_id
	INNER JOIN Requirement ON Link_Screen_Requirement.requirement_id=Requirement.requirement_id
	INNER JOIN REF_Requirement_Type ON Requirement.requirement_type_id=REF_Requirement_Type.requirement_type_id
	INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
	INNER JOIN REF_Product_Version ON Requirement.product_version_id=REF_Product_Version.product_version_id
WHERE Link_Screen_Requirement.active_ind=1
	AND REF_Screen.active_ind=1
	AND Requirement.active_ind=1
	AND REF_Requirement_Type.active_ind=1
	AND REF_Business_Function.active_ind=1
	AND (1=0 /*this is here just for SQL syntax purposes*/<cfif NOT session.hide_general_requirements>
		/*get requirements that apply to all screens, regardless of module*/
		OR fuseaction LIKE 'All.%'</cfif><cfif NOT session.hide_module_all>
		/*get requirements that apply to all screens for a specific module*/
		OR fuseaction='#listfirst(attributes.fuseaction,".")#.all'</cfif>
		/*get requirements that apply to the specifc screen*/
		OR fuseaction='#attributes.fuseaction#')<cfif session.hide_coded_requirements>
	AND Link_Screen_Requirement.requirement_coded_ind=0</cfif>
ORDER BY REF_Product_Version.sort_order, requirement_level, REF_Business_Function.sort_order, REF_Requirement_Type.sort_order,
	Link_Screen_Requirement.sort_order, Requirement.requirement_number
</cfquery>