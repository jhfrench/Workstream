
<!--Customers/app_local.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="attributes.fuseaction" default="customers">
<cfset request.dir_level="../">
<cfset attributes.module_id=2>
<cfset request.navigation="../Customers/dsp_navigation.cfm">
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>

