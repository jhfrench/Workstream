<!-- Home/qry_insert_opt-out.cfm
	Author: Ping Liang-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_opt-out.cfm">
	<responsibilities>
		crete query to insert email adress into table email_blacklist.
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
<cfquery name="get_user_account_id" datasource="#application.datasources.main#">
SELECT user_account_id, email_address
FROM Demographics
WHERE active_ind=1
	AND UPPER(email_address)=UPPER('#attributes.email_address#')
</cfquery>
