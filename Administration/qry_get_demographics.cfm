<!-- Administration/qry_get_demographics.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_demographics.cfm">
	<responsibilities>
		I get demographics information.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<!--- get active demographics information --->
<cfquery name="get_demographics" datasource="#application.datasources.main#">
SELECT demographics_id, first_name, last_name
FROM Demographics
WHERE active_ind=1
ORDER BY last_name
</cfquery>