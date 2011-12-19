<!-- Administration/qry_insert_access_user_account_grouper.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_access_user_account_grouper.cfm">
	<responsibilities>
		I assign NSM structure privileges.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/16/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_access_user_account_grouper" datasource="#application.datasources.main#">
INSERT INTO Access_User_Account_Grouper (program_year_id, module_id, user_account_id,
	organization_id, center_id, privilege_id,
	created_by)
#variables.sql_insert_access_user_account_grouper#
</cfquery>