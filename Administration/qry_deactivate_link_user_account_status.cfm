<!-- Administration/qry_deactivate_link_user_account_status.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_link_user_account_status.cfm">
	<responsibilities>
		Query to deactivate a record in Link_User_Account_Status table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/10/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_link_user_account_status" datasource="#application.datasources.main#">
UPDATE Link_User_Account_Status
SET active_ind=0
WHERE active_ind=1
	AND l_u_a_s_id=#attributes.l_u_a_s_id#
</cfquery>
