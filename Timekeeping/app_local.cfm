
<!--Timekeeping/app_local.cfm
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
	Revision 1.1  2005/03/09 18:20:34  stetzer
	<>

	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.fuseaction" default="home">
	<cfset request.dir_level="../">
	<cfset request.navigation="../Timekeeping/dsp_navigation.cfm">
	<cfset attributes.module_id=8>
	<cfset attributes.module_text="Timekeeping">
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>
