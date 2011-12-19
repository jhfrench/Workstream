<!-- common_files/qry_get_nsm_hierarchy_level.cfm
	Author: Kelly Poon -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_nsm_hierarchy_level.cfm">
	<responsibilities>
		I return the hierarchy level based on an organization id.
	</responsibilities>
	<properties>
		<history email="kpoon@hq.nasa.gov" author="Kelly Poon" type="create" date="3/27/2008" role="FuseCoder" comments="Created File">
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

<cfquery name="get_nsm_hierarchy_level" datasource="#application.datasources.main#">
	select a.organization_id, a.description, a.organization_code, 
		d.hierarchy_level_id, d.description as hierarchy_level_description
	from ref_organization a, hierarchy_assignment b, link_program_year_hierarchy c, ref_hierarchy_level d
	where a.active_ind=1
		and a.organization_id=b.organization_id
		and b.active_ind=1
		and b.l_p_y_h_id=c.l_p_y_h_id
		and c.active_ind=1
		and c.program_year_id=#attributes.program_year_id#
		and d.active_ind=1
		and c.hierarchy_level_id=d.hierarchy_level_id
		and d.active_ind=1
		and a.organization_id=#attributes.organization_id#
</cfquery>

