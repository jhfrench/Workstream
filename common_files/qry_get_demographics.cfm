<!-- Administration/qry_get_demographics.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_demographics.cfm">
	<responsibilities>
		I get demographics information.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<!--- get active demographics information --->
<cfparam name="attributes.user_account_id" default="0">
<cfquery name="get_demographics" datasource="#application.datasources.main#">
SELECT *
FROM Demographics<cfif attributes.user_account_id>
WHERE active_ind=1
	AND user_account_id=#attributes.user_account_id#</cfif>
ORDER BY last_name
</cfquery>