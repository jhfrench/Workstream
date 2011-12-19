<!-- Administration/qry_deactivate_ref_ccr_certfication_type.cfm
	Author: Ping Liang -->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_ccr_certfication_type.cfm">
	<responsibilities>
		Query to deactivate a record in REF_certification_type table before a new insert.
	</responsibilities>
	<properties>
		<history email="pliang@hq.nasa.gov" author="Ping Liang" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_ccr_certification_type" datasource="#application.datasources.main#">
UPDATE REF_CCR_Certification_Type
SET active_ind=0
WHERE active_ind=1
	AND ccr_certification_type_id=#attributes.ccr_certification_type_id#
</cfquery>
