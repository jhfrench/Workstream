<!-- Administration/qry_get_link_user_account_status.cfm
	Author: Jeromy French -->
<!--- -->

<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_link_user_account_status.cfm">
	<responsibilities>
		Query to get link user account status.
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

<cfparam name="attributes.l_u_a_s_id" default="0">

<cfquery name="get_link_user_account_status" datasource="#application.datasources.main#">
SELECT l_u_a_s_id, user_account_id, account_status_id
FROM Link_User_Account_Status
WHERE <cfif attributes.l_u_a_s_id NEQ 0>l_u_a_s_id=#attributes.l_u_a_s_id#<cfelse>active_ind=1</cfif>
ORDER BY l_u_a_s_id
</cfquery>
<cfset caller.get_link_user_account_status=get_link_user_account_status>

