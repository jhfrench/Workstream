<!-- common_files/qry_get_email_recipients.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_email_recipients.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/23/2009" role="FuseCoder" comments="Created File">
			$Id:$
			(JF  | 8/31/10)
			Coding requirement to "Automatically copy the sender's email address on any emails sent through the NVDB email interface."
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
<cfscript>
	if (isdefined("session.email_address")) {
		variables.email_address=session.email_address;
	}
	else {
		variables.email_address="";
	}
</cfscript>
<cfquery name="get_email_recipients" datasource="#application.datasources.main#">
SELECT Proposed_Recipients.email_address
FROM (
	SELECT LOWER('#variables.email_address#') AS email_address
	FROM Dual<cfif isdefined("attributes.email_recipients_demographics_id")>
	UNION ALL
	SELECT LOWER(email_address) AS email_address
	FROM Demographics
	WHERE 1=0<cfloop from="1" to="#variables.loop_count#" index="variables.grouping_ii">
		OR demographics_id IN (#evaluate("variables.email_recipients_demographics_id_#variables.grouping_ii#")#)</cfloop></cfif><cfloop list="#variables.carbon_copy_to#" index="variables.email_address_ii">
	UNION ALL
	SELECT LOWER('#variables.email_address_ii#') AS email_address
	FROM Dual</cfloop>
	) Proposed_Recipients
WHERE Proposed_Recipients.email_address NOT IN (
	/* do not send to emails listed in "Email_Blacklist" table */
	SELECT LOWER(Email_Blacklist.email_address) AS email_address
	FROM Email_Blacklist
	WHERE Email_Blacklist.active_ind=1
		AND LOWER(Email_Blacklist.email_address)!=LOWER('#variables.email_address#'))
	AND Proposed_Recipients.email_address IS NOT NULL
GROUP BY Proposed_Recipients.email_address
</cfquery>