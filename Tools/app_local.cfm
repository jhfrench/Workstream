
<!--Tools/app_local.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain all the variables that are specifically for the tools module.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 21:00:59  daugherty
Initial revision

Revision 1.1  2001-10-11 10:54:27-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfparam name="attributes.fuseaction" default="customers">
<cfset request.dir_level="../">
<cfset request.navigation="../Tools/dsp_navigation.cfm">
<cfset attributes.module_id=9>
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>
