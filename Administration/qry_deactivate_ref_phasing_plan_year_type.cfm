<!-- Administration/qry_deactivate_ref_phasing_plan_year_type.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_phasing_plan_year_type.cfm">
	<responsibilities>
		Query to deactivate a record in FEF_Phasing_Plan_year_Type table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/11/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_phasing_plan_year_type" datasource="#application.datasources.main#">
UPDATE REF_Phasing_Plan_Year_Type
SET active_ind=0
WHERE active_ind=1
	AND phasing_plan_year_type_id=#attributes.phasing_plan_year_type_id#
</cfquery>

