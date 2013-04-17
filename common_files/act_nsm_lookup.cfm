<!-- common_files/act_nsm_lookup.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_nsm_lookup.cfm">
	<responsibilities>
		I process NSM lookup.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/2/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.module_id" default="10">
<cfparam name="attributes.key_query" default="get_workstream_levels">
<cfparam name="attributes.show_required_only_ind" default="1">
<cfparam name="attributes.parent_privilege_inheritance_ind" default="0"><!--- some business functions say that permissions for children are implied by having permissions for any ancestor of that organization; we're calling this "parent privilege inheritance" --->

<!--- get grouper meta data to set up next query --->
<cfset attributes.use_fuseaction_ind=1>
<cfinclude template="qry_get_business_function_hierarchy.cfm">
<cfswitch expression="#attributes.key_query#">
	<!--- used to show un-related select boxes associated with a business function --->
	<cfcase value="get_business_function_hierarchy">
		<cfloop query="get_business_function_hierarchy">
			<cfif currentrow EQ recordcount>
				<cfset variables.limit_options_ind=1>
			<cfelse>
				<cfset variables.limit_options_ind=0>
			</cfif>
			<cfinclude template="qry_get_level_hierarchy_level_id_organization_id.cfm">
		</cfloop>
	</cfcase>

	<!--- used to show required, un-related, select boxes --->
	<cfcase value="get_level_hierarchy_level_id_organization_id">
		<cfinclude template="qry_get_last_required_level.cfm">
		<cfinclude template="qry_get_terminal_workstream_levels.cfm">
		<cfinclude template="qry_get_workstream_levels.cfm">

		<cfloop query="get_workstream_levels">
			<cfif currentrow EQ recordcount>
				<cfset variables.limit_options_ind=1>
			<cfelse>
				<cfset variables.limit_options_ind=0>
			</cfif>
			<cfinclude template="qry_get_level_hierarchy_level_id_organization_id.cfm">
		</cfloop>
	</cfcase>

	<!--- used to show required related selects --->
	<cfdefaultcase>
		<cfinclude template="qry_get_last_required_level.cfm">
		<cfinclude template="qry_get_terminal_workstream_levels.cfm">
		<cfinclude template="qry_get_workstream_levels.cfm">
		<cfinclude template="qry_get_workstream_level_options.cfm">
	</cfdefaultcase>
</cfswitch>