<!-- common_files/qry_get_ref_module.cfm
	Author: Jeromy French-->
<!--- -->

<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_module.cfm">
	<responsibilities>
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

<cfparam name="attributes.show_viewable_only_ind" default="1">
<cfparam name="attributes.lockable_module_ind" default="0">
<cfparam name="attributes.module_id" default="0">

<cfquery name="get_ref_module" datasource="#application.datasources.main#">
SELECT REF_Module.module_id, REF_Module.description, REF_Module.required_ind,
	REF_Module.assign_hier_privileges_ind, REF_Module.sort_order, Lock_Module.comments,
	Lock_Module.active_ind AS locked_ind
FROM REF_Module
	LEFT OUTER JOIN Lock_Module ON REF_Module.module_id=Lock_Module.module_id
		AND Lock_Module.active_ind=1
WHERE <cfif attributes.module_id NEQ 0>REF_Module.module_id=#attributes.module_id#<cfelse>REF_Module.active_ind=1<cfif attributes.show_viewable_only_ind>
	AND REF_Module.viewable_ind=1</cfif></cfif><cfif attributes.lockable_module_ind EQ 1>
	<!--- if the page we are working on is lock module page --->
	AND REF_Module.lockable_ind=1</cfif>
ORDER BY REF_Module.sort_order
</cfquery>
<cfset caller.get_ref_module=get_ref_module>