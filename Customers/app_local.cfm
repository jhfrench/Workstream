
<!--Customers/app_local.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:45:35  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:38-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfparam name="attributes.fuseaction" default="customers">
<cfset request.dir_level="../">
<cfset attributes.module_id=2>
<cfset request.navigation="../Customers/dsp_navigation.cfm">
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>

