<!-- Requirements/qry_get_requirement_type.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_requirement_type.cfm">
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

<cfquery name="get_requirement_type" datasource="#application.datasources.main#">
SELECT requirement_type_id, description,sort_order
FROM REF_Requirement_Type
<cfif attributes.requirement_type_id NEQ 0>WHERE requirement_type_id=#attributes.requirement_type_id#</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_requirement_type=get_requirement_type>