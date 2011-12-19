<!-- Administration/pag_manage_system_access.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_system_access.cfm">
	<responsibilities>
	</responsibilities>
		Page to help administrator to manage system access.
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/30/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.module_id" default="0">
<cfparam name="attributes.method" default="">
<cfparam name="attributes.module_id_list" default="">
<cfparam name="variables.display_message" default="">

<cfif NOT comparenocase(attributes.method, "Submit")>
<!--- deactivate all locked modules --->
	<cfinclude template="qry_deactivate_module.cfm">
	<cfif attributes.module_id NEQ 0>
		<cfloop list="#attributes.module_id#" index="module_id_ii">
			<cfset variables.module_comments=evaluate("comments_#module_id_ii#")>
			<cfinclude template="qry_insert_lock_module.cfm">
		</cfloop>
		<cfset variables.display_message="<ul><li>Your changes have been applied</li></ul>">
	</cfif>
</cfif>

<cfmodule template="../common_files/qry_get_ref_module.cfm" lockable_module_ind="1">
<cfset variables.all_module_id=valuelist(get_ref_module.module_id)>

<cfoutput><span style="font-size:14px;">#variables.display_message# </span></cfoutput>
<cfinclude template="dsp_manage_system_access.cfm">
