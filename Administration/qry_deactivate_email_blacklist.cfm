<!-- Administration/qry_deactivate_email_blacklist.cfm
	Author: Ping Liang-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_email_blacklist.cfm">
	<responsibilities>
		create query to deactivate email adress in table email_blacklist.
	</responsibilities>
	<properties>
		<history email="pliang@hq.nasa.gov" author="Ping Liang" type="create" date="7/27/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_email_blacklist" datasource="#application.datasources.main#">
UPDATE Email_Blacklist
SET active_ind=0
WHERE active_ind=1
	AND UPPER(email_address)=UPPER('#attributes.email_address#')
</cfquery>
