<!-- Administration/qry_get_email_blacklist.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_email_blacklist.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/3/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.lookup_email_address" default="">
<cfquery name="get_email_blacklist" datasource="#application.datasources.main#">
SELECT Email_Blacklist.email_blacklist_id, Email_Blacklist.email_address, Email_Blacklist.created_date,
	Demographics.first_name||' '||Demographics.last_name AS created_by
FROM Email_Blacklist
	LEFT OUTER JOIN Demographics ON Email_Blacklist.created_by=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Email_Blacklist.active_ind=1<cfif len(attributes.lookup_email_address)>
	AND UPPER(Email_Blacklist.email_address)=UPPER('#attributes.lookup_email_address#')</cfif>
</cfquery>