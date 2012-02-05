<!-- Home/qry_insert_login_attempt.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_login_attempt.cfm">
	<responsibilities>
		Insert a new record into Login_Attempt table after unsuccessful login.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/11/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(12/3/2008 | JF)
			Correcting production error 424.
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
<!--- always insert the encrypted password, never clear text --->
<cfquery name="get_login_information" datasource="#application.datasources.main#">
INSERT INTO Login_Attempt (user_name, password, success_ind)
VALUES (ISNULL('#attributes.user_name#','UNSPECIFIED'), ISNULL('#attributes.password#','UNSPECIFIED'), #attributes.success_ind#)
</cfquery>