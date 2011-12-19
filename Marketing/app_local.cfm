
<!--Marketing/app_local.cfm
	Author: Jeromy F  -->
<cfsilent>	
	<!--- FUSEDOC
	||
	Responsibilities: I set any variables that are particular to the Marketing module of workstream.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:50:45  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:02-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.fuseaction" default="Marketing">
<cfset request.navigation="../marketing/dsp_navigation.cfm">
<cfparam name="SortBy1" default="none">
<cfparam name="SortBy2" default="none">
<cfparam name="SortBy3" default="none">
<cfset request.dir_level="../">
<cfset attributes.module_id=5>
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>

