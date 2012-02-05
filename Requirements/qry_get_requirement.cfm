<!-- Requirements/qry_get_requirement.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_requirement.cfm">
	<responsibilities>
		I retrieve data for the requirement selected.
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

<cfquery name="get_requirement" datasource="#application.datasources.main#">
SELECT Requirement.description AS requirement_description, Requirement.requirement_id, Requirement.requirement_type_id,
	Requirement.requirement_number, Requirement.priority_id AS priority_id, Requirement.active_ind,
	Link_Screen_Requirement.screen_id, Link_Screen_Requirement.sort_order, REF_Product_Version.product_version_id
FROM Link_Screen_Requirement
	INNER JOIN Requirement ON Link_Screen_Requirement.requirement_id=Requirement.requirement_id
	INNER JOIN REF_Product_Version ON Requirement.product_version_id=REF_Product_Version.product_version_id
WHERE Requirement.requirement_id=#attributes.requirement_id#
</cfquery>