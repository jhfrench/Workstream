<!-- common_files/act_hierarchy_breadcrumbs.cfm
	Author: Jeromy French -->
<cfsilent>
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_hierarchy_breadcrumbs.cfm">
	<responsibilities>
		I display the breadcrumbs for a given organization; you supply the organization, and I'll tell you the parents.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
			attributes.organization_id: id of the last organization the user clicked on
			attributes.program_year_id: id of the program year the user is working with
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->
<cfparam name="attributes.function_name" default="breadcrumb_link">
<cfparam name="attributes.use_link_ind" default="1">
<cfparam name="attributes.field_name" default="nsm_drilldown_organizations">
<cfparam name="attributes.module_id" default="0">
<cfparam name="attributes.user_account_id" default="0">
<cfparam name="variables.fund_control_breadcrumbs_ind" default="0">
</cfsilent>

<cfquery name="get_hierarchy_breadcrumbs" datasource="#application.datasources.main#">
SELECT Breadcrumb_Hierarchy.organization_id, Breadcrumb_Hierarchy.description, Breadcrumb_Hierarchy.l_p_y_h_id,
	Breadcrumb_Hierarchy.hierarchy_level_id, MIN(Child_Hierarchy_Level.l_p_y_h_id) AS next_l_p_y_h_id
FROM (
		SELECT REF_Organization.organization_id, REF_Organization.description, Link_Program_Year_Hierarchy.l_p_y_h_id,
			REF_Hierarchy_Level.hierarchy_level_id, rownum AS sort_order
		FROM Hierarchy_Assignment
			INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id
			INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
			INNER JOIN REF_Hierarchy_Level ON REF_Hierarchy_Level.hierarchy_level_id=Link_Program_Year_Hierarchy.hierarchy_level_id
				AND Hierarchy_Assignment.active_ind=1
				AND REF_Organization.active_ind=1
				AND Link_Program_Year_Hierarchy.active_ind=1
				AND Link_Program_Year_Hierarchy.program_year_id=<cfqueryparam value="#attributes.program_year_id#" cfsqltype="cf_sql_integer">
		START WITH Hierarchy_Assignment.organization_id=<cfqueryparam value="#listfirst(attributes.organization_id)#" cfsqltype="cf_sql_integer">
		CONNECT BY PRIOR Hierarchy_Assignment.parent_organization_id=Hierarchy_Assignment.organization_id
	) Breadcrumb_Hierarchy
	INNER JOIN Link_Program_Year_Hierarchy Child_Hierarchy_Level ON Breadcrumb_Hierarchy.hierarchy_level_id=Child_Hierarchy_Level.parent_hierarchy_level_id
WHERE Child_Hierarchy_Level.active_ind=1
	AND Child_Hierarchy_Level.program_year_id=<cfqueryparam value="#attributes.program_year_id#" cfsqltype="cf_sql_integer">
GROUP BY Breadcrumb_Hierarchy.organization_id, Breadcrumb_Hierarchy.description, Breadcrumb_Hierarchy.l_p_y_h_id,
	Breadcrumb_Hierarchy.hierarchy_level_id, Breadcrumb_Hierarchy.sort_order
ORDER BY Breadcrumb_Hierarchy.sort_order DESC
</cfquery>

<cfif variables.fund_control_breadcrumbs_ind EQ 0>
	<cfmodule template="act_drilldown_form.cfm" function_name="breadcrumb_link" fuseaction="#attributes.fuseaction#" processform="1" field_name="#attributes.field_name#" field2_name="l_p_y_h_id" field2_variable_ind="1" program_year_id="#attributes.program_year_id#" user_account_id="#attributes.user_account_id#" module_id="#attributes.module_id#" breadcrumb_ind="1">
	<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table contains navigation breadcrumbs">
		<tr>
			<th align="left">
			<h2 style="margin:0px">
			<cfif attributes.use_link_ind EQ 1>
				<cfoutput query="get_hierarchy_breadcrumbs">
					<cfif recordcount NEQ currentrow><a href="javascript:#attributes.function_name#(#get_hierarchy_breadcrumbs.organization_id#,#get_hierarchy_breadcrumbs.next_l_p_y_h_id#);">#description#</a> &gt; <cfelse>#description#</cfif>
				</cfoutput>
			<cfelse>
				<cfoutput query="get_hierarchy_breadcrumbs">
				#description#<cfif recordcount NEQ currentrow> &gt; </cfif>
				</cfoutput>
			</cfif>
			</h2>
			</th>
		</tr>
	</table>
<!--- THIS breadcrumb applies only to fund control --->
<cfelse>
	<cfmodule template="act_drilldown_form.cfm" function_name="breadcrumb_link" fuseaction="#attributes.fuseaction#" processform="1" field_name="#attributes.field_name#" field2_name="hierarchy_level_id" field2_variable_ind="1" program_year_id="#attributes.program_year_id#" user_account_id="#attributes.user_account_id#" fund_id="#attributes.fund_id#">
	<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="Table contains fund control breadcrumbs">
		<tr>
			<th align="left">
			<!--- if the breadcrumb is used in funds control --->
			<cfif comparenocase(variables.fund_control_breadcrumbs_ind,0)>
			<cfoutput>
			<h2 style="margin:0px">
				<cfmodule template="act_drilldown_form.cfm" function_name="output_mission_level" fuseaction="#attributes.fuseaction#" field_name="fund_id" field_value="" processform="1" program_year_id="#attributes.program_year_id#">
				<a href="index.cfm?fuseaction=Administration.fund_control_welcome">Fund Control</a> &gt; 
				<cfif isdefined("attributes.next_hierarchy_level_id") OR isdefined("attributes.l_p_y_h_id")>
					<a href="javascript:output_mission_level(#attributes.fund_id#);">Mission Level</a> &gt;<br />
				<cfelseif isdefined("get_fund_for_organization_id.fund_label")>
					#get_fund_for_organization_id.fund_label#
				</cfif>
			</h2>
			</cfoutput>
			</cfif>
			<!--- end --->
			<!--- check if there is record --->
		<cfif get_hierarchy_breadcrumbs.recordcount GT 0>
			<cfif attributes.use_link_ind EQ 1>
				<!--- get the lowest hierarchy level the system is in --->
				<cfset variables.hierarchy_level=valuelist(get_hierarchy_breadcrumbs.hierarchy_level_id)>
				<cfset variables.lowest_level=listlast(variables.hierarchy_level)>
				<cfswitch expression="#variables.lowest_level#">
					<cfcase value="1">
						<cfset variables.breadcrumb_startrow=(get_hierarchy_breadcrumbs.recordcount - 1 + 1)>
					</cfcase>
					<cfcase value="2">
						<cfset variables.breadcrumb_startrow=(get_hierarchy_breadcrumbs.recordcount - 2 + 1)>
					</cfcase>
					<cfcase value="3">
						<cfset variables.breadcrumb_startrow=(get_hierarchy_breadcrumbs.recordcount - 3 + 1)>
					</cfcase>
					<cfcase value="4">
						<cfset variables.breadcrumb_startrow=(get_hierarchy_breadcrumbs.recordcount - 4 + 1)>
					</cfcase>
					<cfcase value="5">
						<cfset variables.breadcrumb_startrow=(get_hierarchy_breadcrumbs.recordcount - 5 + 1)>
					</cfcase>
					<cfcase value="6">
						<cfset variables.breadcrumb_startrow=(get_hierarchy_breadcrumbs.recordcount - 6 + 1)>
					</cfcase>
				</cfswitch>
		
				<cfoutput query="get_hierarchy_breadcrumbs" startrow="#variables.breadcrumb_startrow#" maxrows="#get_hierarchy_breadcrumbs.recordcount#">
					<cfif recordcount NEQ currentrow>
						<a href="javascript:breadcrumb_link(#organization_id#,#hierarchy_level_id + 1#);">#description#</a> &gt; 
					<cfelse>
						#description#
					</cfif>
				</cfoutput>
			<cfelse>
				<cfoutput query="get_hierarchy_breadcrumbs">
				#description#<cfif recordcount NEQ currentrow> &gt; </cfif>
				</cfoutput>
			</cfif>
		</cfif>
			</th>
		</tr>
	</table>
</cfif>
