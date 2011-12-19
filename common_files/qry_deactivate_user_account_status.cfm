<!-- common_files/qry_deactivate_user_account_status.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_user_account_status.cfm">
	<responsibilities>
		I deactivate a user's old account status record.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/26/2007" role="FuseCoder" comments="Created File">
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
	AND user_account_id=#attributes.user_account_id#
</cfquery>

