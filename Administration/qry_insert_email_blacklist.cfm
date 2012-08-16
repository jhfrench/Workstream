<!-- Administration/qry_insert_email_blacklist.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_email_blacklist.cfm">
	<responsibilities>
		crete query to insert email adress into table email_blacklist.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/27/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_email_blacklist" datasource="#application.datasources.main#">
INSERT INTO Email_Blacklist (email_address, created_by)
VALUES ('#attributes.email_address#', <cfif isdefined("session.user_account_id")>#session.user_account_id#<cfelse>NULL</cfif>)
</cfquery>
