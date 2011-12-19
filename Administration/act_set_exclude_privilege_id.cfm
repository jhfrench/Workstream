<!-- Administration/act_set_exclude_privilege_id.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_set_exclude_privilege_id.cfm">
	<responsibilities>
		I establish which priviliges do not apply at certain NSM heirarchy levels. Ideally this would be done through DB configuration, but it's too late in the game to do so now, so we're doing it through CF. Hopefully in the future it can be corrected.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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
<cfset variables.show_apply_to_children_ind=1>
<cfswitch expression="#attributes.module_id#">
	<!--- Variance --->
	<cfcase value="7">
		<cfswitch expression="#attributes.hierarchy_level#">
			<!--- mission --->
			<cfcase value="1">
				<cfset attributes.exclude_privilege_id="1">
			</cfcase>
			<!--- theme --->
			<cfcase value="2">
				<cfset attributes.exclude_privilege_id="1">
			</cfcase>
			<!--- program --->
			<cfcase value="3">
				<cfset attributes.exclude_privilege_id="1">
			</cfcase>
			<!--- everything else --->
			<cfdefaultcase>
				<cfset attributes.exclude_privilege_id="1">
			</cfdefaultcase>
		</cfswitch>
	</cfcase>
	<!--- Phasing Plan --->
	<cfcase value="10">
		<cfswitch expression="#attributes.hierarchy_level#">
			<!--- mission --->
			<cfcase value="1">
				<cfset attributes.exclude_privilege_id="1,2,3,4,8,9">
				<cfset variables.show_apply_to_children_ind=0>
			</cfcase>
			<!--- theme --->
			<cfcase value="2">
				<cfset attributes.exclude_privilege_id="1,2,3,4,9">
				<cfset variables.show_apply_to_children_ind=0>
			</cfcase>
			<!--- program --->
			<cfcase value="3">
				<cfset attributes.exclude_privilege_id="1,2,3,4,8">
				<cfset variables.show_apply_to_children_ind=0>
			</cfcase>
			<!--- project --->
			<cfcase value="4">
				<cfset attributes.exclude_privilege_id="1,8,9">
				<cfset variables.show_apply_to_children_ind=0>
			</cfcase>
			<!--- everything else --->
			<cfdefaultcase>
				<cfset attributes.exclude_privilege_id="1,4,8,9">
				<cfset variables.show_apply_to_children_ind=1>
			</cfdefaultcase>
		</cfswitch>
	</cfcase>
</cfswitch>