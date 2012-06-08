<!-- Administration/qry_deactivate_ref_center.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_center.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Center table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/16/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_center" datasource="#application.datasources.main#">
UPDATE REF_Center
SET active_ind=0
WHERE active_ind=1
	AND center_id=#attributes.center_id#
</cfquery>