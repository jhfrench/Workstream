<!-- common_files/qry_get_user_access.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_access.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/24/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(8/8/7 | nf)
			rewrote query to identified modules that are locked
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
<cfquery name="get_user_access" datasource="#application.datasources.main#">
SELECT *
FROM Get_User_Access(<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />, 1)
</cfquery>
<cfset caller.get_user_access=get_user_access>