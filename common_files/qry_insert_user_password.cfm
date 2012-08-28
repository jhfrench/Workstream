<!-- common_files/qry_insert_user_password.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_user_password.cfm">
	<responsibilities>
		I insert user password into user password table
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/31/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="variables.user_identification" default="1">
<cfquery name="insert_user_password" datasource="#application.datasources.main#">
INSERT INTO User_Password (user_account_id, password, created_by,
	active_ind)
VALUES (#attributes.user_account_id#, '#variables.encrypted_password#', #variables.user_identification#,
	1)
</cfquery>
