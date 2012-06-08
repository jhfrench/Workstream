<!-- Administration/qry_get_ref_screen.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_screen.cfm">
	<responsibilities>
		Query to get screen.
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

<cfparam name="attributes.screen_id" default="0">
<cfparam name="attributes.show_all_ind" default="0">

<cfquery name="get_ref_screen_count" datasource="#application.datasources.main#">
SELECT COUNT(*) AS count1
FROM REF_Screen
WHERE active_ind=1
</cfquery>
<cfset caller.get_ref_screen_count=get_ref_screen_count>
	
<cfquery name="get_ref_screen" datasource="#application.datasources.main#">
SELECT screen_id, active_ind, body_onload,
	business_function_id, check_variable, fuseaction,
	module_id, relocate, sort_order,
	starting_point_ind
FROM REF_Screen
WHERE 1=1<cfif attributes.show_all_ind EQ 0>
	AND <cfif attributes.screen_id NEQ 0>screen_id=#attributes.screen_id#<cfelse>active_ind=1</cfif></cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_screen=get_ref_screen>