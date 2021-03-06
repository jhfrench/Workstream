<!-- Administration/qry_deactivate_ref_priority.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactive_ref_ccr_business_type.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Priority table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_ccr_business_type" datasource="#application.datasources.main#">
UPDATE REF_ccr_business_type
SET active_ind=0
WHERE active_ind=1
	AND contact_type_id=#attributes.ccr_business_type_id#
</cfquery>
