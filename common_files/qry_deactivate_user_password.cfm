<!-- common_files/qry_deactivate_user_password.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_user_password.cfm">
	<responsibilities>
		I deactivate the active User_Password record for a specific user account.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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

<!--- deactivate old user_password record --->
<cfquery name="deactivate_user_password" datasource="#application.datasources.main#">
UPDATE User_Password
SET active_ind=0
WHERE active_ind=1
	AND user_account_id=#attributes.user_account_id#
</cfquery>