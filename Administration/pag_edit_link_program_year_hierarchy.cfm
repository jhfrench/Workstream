<!-- Administration/pag_edit_link_program_year_hierarchy.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_link_program_year_hierarchy.cfm">
	<responsibilities>
		I display the form for editing link program year hierarchy and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="7/6/2007" role="FuseCoder" comments="Created File">
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

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_link_program_year_hierarchy.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_link_program_year_hierarchy.cfm">
</cfif>

<cfparam name="attributes.l_p_y_h_id" default="0">
<cfparam name="attributes.hierarchy_level_id" default="0">

<cfinclude template="../common_files/qry_get_ref_hierarchy_level.cfm">
<cfmodule template="../common_files/qry_get_program_year.cfm" exclude_future_years_ind="0">
<cfinclude template="qry_get_link_program_year_hierarchy.cfm">

<cfif get_ref_hierarchy_level.recordcount>
	<cfset attributes.hierarchy_level_id=get_ref_hierarchy_level.hierarchy_level_id>
</cfif>

<cfif get_program_year.recordcount>
	<cfset attributes.program_year_id=get_program_year.program_year_id>
</cfif>

<cfinclude template="dsp_edit_link_program_year_hierarchy.cfm">