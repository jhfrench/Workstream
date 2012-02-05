<!-- Administration/qry_update_link_screen_requirement.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_update_link_screen_requirement.cfm">
	<responsibilities>
		I update Link_Screen_Requirement.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="8/30/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="update_link_screen_requirement" datasource="#application.datasources.main#">
UPDATE Link_Screen_Requirement
SET screen_id=#attributes.screen_id#
WHERE screen_id IN (
	SELECT REF_Screen.screen_id
	FROM Link_Screen_Requirement
		INNER JOIN REF_Screen ON Link_Screen_Requirement.screen_id=REF_Screen.screen_id
	WHERE Link_Screen_Requirement.active_ind=1
		AND REF_Screen.active_ind=0)
</cfquery>