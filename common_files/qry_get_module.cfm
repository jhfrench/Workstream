<!-- common_files/qry_get_module.cfm
	Author: Jeromy French-->
<!--- -->

<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_module.cfm">
	<responsibilities>
			I retrieve module data from REF_Module table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/15/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 6/27/07) Moved to common_files
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

<cfparam name="attributes.module_id" default="0">
<cfparam name="attributes.lockable_module_ind" default="">
<cfquery name="get_module" datasource="#application.datasources.main#">
SELECT REF_Module.module_id, REF_Module.description, REF_Module.sort_order,
	REF_Module.assign_hier_privileges_ind, Lock_Module.comments, Lock_Module.active_ind AS locked_ind
FROM REF_Module
	LEFT OUTER JOIN Lock_Module ON REF_Module.module_id=Lock_Module.module_id
		AND Lock_Module.active_ind=1
WHERE REF_Module.<cfif attributes.module_id NEQ 0>module_id=#attributes.module_id#<cfelse>active_ind=1</cfif>
<!--- if the page we are working on is lock module page --->
<cfif attributes.lockable_module_ind EQ 1>AND REF_Module.lockable_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_module=get_module>