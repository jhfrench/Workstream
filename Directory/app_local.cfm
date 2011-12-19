
<!--Directory/app_local.cfm
	Author: Jeromy F -->
<cfsilent>	
	<!--- FUSEDOC
	||
	Responsibilities: I set any variables that are particular to the Timekeeping module of workstream.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.fuseaction" default="home">
<cfset request.dir_level="../">
<cfset attributes.module_id=3>
<cfset request.navigation="../Directory/dsp_navigation.cfm">
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>

