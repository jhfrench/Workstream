<!-- common_files/qry_insert_link_user_account_status.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_user_account_status.cfm">
	<responsibilities>
		I deactivate a user's old account status record.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/26/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.account_status_id" default="2">
<cfparam name="attributes.created_by" default="1">

<cfquery name="insert_link_user_account_status" datasource="#application.datasources.main#">
INSERT INTO Link_User_Account_Status (user_account_id, account_status_id, created_by)
VALUES (#attributes.user_account_id#, #attributes.account_status_id#, #attributes.created_by#)
</cfquery>
