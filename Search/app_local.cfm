
<!--Search/app_local.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I don't know what the fu*k I do. But Jeromy says that I set the variables for this particular module of workstream, which happens to be Search.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:58:16  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:29-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	Variables:
	END FUSEDOC --->
<cfset request.dir_level="../">
<cfparam name="attributes.fuseaction" default="search">
<cfset request.navigation="../Search/dsp_navigation.cfm">
<cfset attributes.module_id=7>
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>

