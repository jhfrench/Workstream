<!--- Administration/qry_deactivate_ref_state_province.cfm
	Author: Ping Liang--->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_state_province.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="PLiang@hq.nasa.gov" author="Ping Liang" type="create" date="7/7/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_state_province" datasource="#application.datasources.main#">
UPDATE REF_state_province
SET active_ind=0
WHERE active_ind=1
	AND state_province_id=#attributes.state_province_id#
</cfquery>
