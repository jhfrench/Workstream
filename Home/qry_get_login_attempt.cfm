<!-- Home/qry_get_login_attempt.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_login_attempt.cfm">
	<responsibilities>
		I get the number of invalid login attempts since last valid login for a given username.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/11/2007" role="FuseCoder" comments="Created File">
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

<!--- get number of invalid login attempts since last valid login for given username --->
<cfquery name="get_login_attempt" datasource="#application.datasources.main#">
SELECT *
FROM Login_Attempt
WHERE success_ind=0 /*only count invalid attempts since last valid login*/
	AND login_attempt_id > (
		/*get primary key of last time user was able to get in the system*/
		SELECT NVL(MAX(login_attempt_id),1) AS last_successful_login_id
		FROM Login_Attempt
		WHERE success_ind=1
			AND user_name=<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(attributes.user_name)#">)
	AND user_name=<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(attributes.user_name)#">
</cfquery>
