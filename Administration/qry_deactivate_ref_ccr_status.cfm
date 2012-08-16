<!--- Administration/qry_deactivate_ref_ccr_status.cfm
	Author: Jeromy French--->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_ccr_status.cfm">
	<responsibilities>
		Query to deactivate a record in REF_ccr_status table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_ccr_status" datasource="#application.datasources.main#">
UPDATE REF_CCR_Status
SET active_ind=0
WHERE active_ind=1
	AND ccr_status_id=#attributes.ccr_status_id#
</cfquery>
