<!-- Administration/qry_get_user_account.cfm
	Author: Jeromy French -->
<!--- -->

<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_account.cfm">
	<responsibilities>
		I get the query for user account.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/9/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.user_account_id" default="0">
<cfquery name="get_user_account" datasource="#application.datasources.main#">
SELECT user_account_id, user_name
FROM User_Account<cfif attributes.user_account_id NEQ 0>
WHERE user_account_id=#attributes.user_account_id#</cfif>
ORDER BY user_name
</cfquery>
<cfset caller.get_user_account=get_user_account>