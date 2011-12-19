<!--- Administration/qry_deactivate_ref_ref_geographic_area.cfm
	Author: Ping Liang--->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_geographic_area.cfm">
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

<cfquery name="deactivate_ref_geographic_area" datasource="#application.datasources.main#">
UPDATE REF_geographic_area
SET active_ind=0
WHERE active_ind=1
	AND geographic_area_id=#attributes.geographic_area_id#
</cfquery>
