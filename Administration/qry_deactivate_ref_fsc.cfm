<!--- Administration/qry_deactivate_ref_fsc.cfm
	Author: Ping Liang--->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_fsc.cfm">
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

<cfquery name="deactivate_ref_fsc" datasource="#application.datasources.main#">
UPDATE REF_fsc
SET active_ind=0
WHERE active_ind=1
	AND fsc_id=#attributes.fsc_id#
</cfquery>
