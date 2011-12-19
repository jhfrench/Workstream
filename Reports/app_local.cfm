
<!--Reports/app_local.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities:  I set any variables that are particular to the Reports module of workstream.

	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.fuseaction" default="report">
<cfset request.dir_level="../">
<cfset request.navigation="../Reports/dsp_navigation.cfm">
<cfset attributes.module_id=6>
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>