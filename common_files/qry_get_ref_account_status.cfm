<!-- common_files/qry_get_ref_account_status.cfm
	Author: Jeromy French -->
<!--- -->

<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_account_status.cfm">
	<responsibilities>
		I get user account status from REF_Account_Status table.
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

<cfparam name="attributes.account_status_id" default="0">

<cfquery name="get_ref_account_status" datasource="#application.datasources.main#">
SELECT account_status_id, description, sort_order
FROM REF_Account_Status
WHERE <cfif attributes.account_status_id NEQ 0>account_status_id=#attributes.account_status_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_account_status=get_ref_account_status>
