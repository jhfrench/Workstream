<!-- Administration/qry_get_email_recipients.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_email_recipients.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/23/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="get_email_recipients" datasource="#application.datasources.main#">
SELECT Proposed_Recipients.email_address
FROM (
	SELECT '' AS email_address
	FROM Dual
	WHERE 1=0<cfif isdefined("attributes.email_recipients_demographics_id")>
	UNION ALL
	SELECT LOWER(email_address) AS email_address
	FROM Demographics
	WHERE demographics_id IN (#attributes.email_recipients_demographics_id#)</cfif><cfloop list="#variables.carbon_copy_to#" index="variables.email_address_ii">
	UNION ALL
	SELECT LOWER('#variables.email_address_ii#') AS email_address
	FROM Dual</cfloop>
	) Proposed_Recipients
WHERE Proposed_Recipients.email_address NOT IN (
	/* do not send to emails listed in "Email_Blacklist" table */
	SELECT LOWER(Email_Blacklist.email_address) AS email_address
	FROM Email_Blacklist
	WHERE Email_Blacklist.active_ind=1)
GROUP BY Proposed_Recipients.email_address
</cfquery>