
<!--timekeeping/app_local.cfm
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
Revision 1.1  2006/09/15 22:24:47  csy
<>

Revision 1.0  2006-08-16 09:31:58-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:21-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:39-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.fuseaction" default="home">
<cfset request.dir_level="../">
<cfset attributes.module_id=1>
<cfset request.navigation="../Admin/dsp_navigation.cfm">
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>