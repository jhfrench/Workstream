<!-- Administration/qry_update_email_blacklist.cfm
	Author: Stephen Liu-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_update_email_blacklist.cfm">
	<responsibilities>
		I update installation.
	</responsibilities>
	<properties>
		<history email="csliu@nasa.gov" author="Stephen Liu" type="create" date="8/3/2009" role="FuseCoder" comments="Created File">
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
<cfquery name="update_email_blacklist" datasource="#application.datasources.main#">
UPDATE Email_Blacklist
SET active_ind=0
WHERE email_blacklist_id IN (#attributes.email_blacklist_id#)
</cfquery>
