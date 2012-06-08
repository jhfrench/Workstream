<!-- Administration/qry_deactivate_ref_hierarchy_level.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_hierarchy_level.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Hierarchy_level table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_hierarchy_level" datasource="#application.datasources.main#">
UPDATE REF_Hierarchy_Level
SET active_ind=0
WHERE active_ind=1
	AND hierarchy_level_id=#attributes.hierarchy_level_id#
</cfquery>