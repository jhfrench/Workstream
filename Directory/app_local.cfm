
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
Revision 1.0  2005/02/15 20:46:29  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:14-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.fuseaction" default="home">
<cfset request.dir_level="../">
<cfset attributes.module_id=3>
<cfset request.navigation="../Directory/dsp_navigation.cfm">
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>

