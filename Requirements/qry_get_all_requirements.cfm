<!-- Requirements/qry_get_all_requirements.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_all_requirements.cfm">
	<responsibilities>
		Query to get all requirements for the application.
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

<cfquery name="get_all_requirements" datasource="#application.datasources.main#">
SELECT Requirement.requirement_id, Requirement.requirement_number, Requirement.description AS requirement,
	Requirement.active_ind, REF_Module.description AS module, REF_Business_Function.description AS business_function,
	REF_Requirement_Type.description AS requirement_type, Link_Screen_Requirement.l_s_r_id, Link_Screen_Requirement.requirement_coded_ind,
	Link_Screen_Requirement.sort_order, REF_Business_Function.acronym
FROM Link_Screen_Requirement
	INNER JOIN REF_Screen ON Link_Screen_Requirement.screen_id=REF_Screen.screen_id
	INNER JOIN REF_Module ON REF_Screen.module_id=REF_Module.module_id
	INNER JOIN Requirement ON Link_Screen_Requirement.requirement_id=Requirement.requirement_id
	INNER JOIN REF_Requirement_Type ON Requirement.requirement_type_id=REF_Requirement_Type.requirement_type_id
	INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
WHERE Link_Screen_Requirement.active_ind=1
	AND REF_Screen.active_ind=1
	AND REF_Module.active_ind=1
	AND Requirement.active_ind=1
	AND REF_Requirement_Type.active_ind=1
	AND REF_Business_Function.active_ind=1
ORDER BY REF_Module.sort_order, REF_Business_Function.sort_order, REF_Requirement_Type.sort_order,
	Link_Screen_Requirement.sort_order, Requirement.requirement_number
</cfquery>