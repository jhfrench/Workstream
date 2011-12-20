<!--- Administration/qry_deactivate_ref_naics.cfm
	Author: Ping Liang--->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_naics.cfm">
	<responsibilities>
		Query to deactivate a record in REF_naics table before a new insert.
	</responsibilities>
	<properties>
		<history email="PLiang@nasa.gov" author="Ping Liang" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_naics" datasource="#application.datasources.main#">
UPDATE REF_Naics
SET active_ind=0
WHERE active_ind=1
	AND naics_id=#attributes.naics_id#
</cfquery>