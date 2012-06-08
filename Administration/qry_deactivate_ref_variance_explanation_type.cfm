<!-- Administration/qry_deactivate_ref_variance_explanation_type.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_variance_explanation_type.cfm">
	<responsibilities>
		Query to diactivate a record in REF_Variance_Explanation_Type table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/27/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_variance_explanation_type" datasource="#application.datasources.main#">
UPDATE REF_Variance_Explanation_Type
SET active_ind=0
WHERE active_ind=1
	AND variance_explanation_type_id=#attributes.variance_explanation_type_id#
</cfquery>
