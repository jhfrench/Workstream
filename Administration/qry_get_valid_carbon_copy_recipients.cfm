<!-- Administration/qry_get_valid_carbon_copy_recipients.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_valid_carbon_copy_recipients.cfm">
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
<cfquery name="get_valid_carbon_copy_recipients" datasource="#application.datasources.main#">
SELECT Proposed_Carbons.email_address
FROM (
	SELECT '' AS email_address
	FROM Dual
	WHERE 1=0<cfloop list="#variables.carbon_copy_to#" index="variables.email_address_ii">
	UNION ALL
	SELECT '#variables.email_address_ii#' AS email_address
	FROM Dual</cfloop>
	) Proposed_Carbons
WHERE Proposed_Carbons.email_address NOT IN (
	/* do not send to emails listed in "Email_Blacklist" table */
	SELECT Email_Blacklist.email_address
	FROM Email_Blacklist
	WHERE Email_Blacklist.active_ind=1)
GROUP BY Proposed_Carbons.email_address
</cfquery>