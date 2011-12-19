
<!--Tools/app_local.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain all the variables that are specifically for the tools module.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="attributes.fuseaction" default="customers">
<cfset request.dir_level="../">
<cfset request.navigation="../Tools/dsp_navigation.cfm">
<cfset attributes.module_id=9>
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>
