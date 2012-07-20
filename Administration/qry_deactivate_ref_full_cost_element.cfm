<!-- Administration/qry_deactivate_ref_full_cost_element.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_full_cost_element.cfm">
	<responsibilities>
		I deactivate a record in REF_Full_Cost_Element table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/21/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_full_cost_element" datasource="#application.datasources.main#">
UPDATE REF_Full_Cost_Element
SET active_ind=0
WHERE active_ind=1
	AND full_cost_element_id=#attributes.full_cost_element_id#
</cfquery>
