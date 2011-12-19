<!-- Administration/qry_deactivate_ref_phasing_plan_status.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_phasing_plan_status.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Phasing_Plan_Status table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/26/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_phasing_plan_status" datasource="#application.datasources.main#">
UPDATE REF_Phasing_Plan_Status
SET active_ind=0
WHERE active_ind=1
	AND phasing_plan_status_id=#attributes.phasing_plan_status_id#
</cfquery>
