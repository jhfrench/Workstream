<!-- Administration/qry_deactivate_ref_account_status.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_account_status.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Account_Status table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/22/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_account_status" datasource="#application.datasources.main#">
UPDATE REF_Account_Status
SET active_ind=0
WHERE active_ind=1
	AND account_status_id=#attributes.account_status_id#
</cfquery>
