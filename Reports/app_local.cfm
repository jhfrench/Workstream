
<!--Reports/app_local.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities:  I set any variables that are particular to the Reports module of workstream.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:04:15  stetzer
<>

Revision 1.1  2001-10-11 11:04:52-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.fuseaction" default="report">
<cfset request.dir_level="../">
<cfset request.navigation="../Reports/dsp_navigation.cfm">
<cfset day="Never_Equal">
<cfset total_hours=0>
<cfparam name="Flag_Non_Billable" default="False">
<cfset temp_et="This_should_never_be_equal">
<cfset temp_cn="This_should_never_be_equal">
<cfset temp_cc="This_should_never_be_equal">
<cfset grand_total_hours=0>
<cfset Emp_type_hours=0>
<cfset attributes.module_id=6>
<cfinclude template="../common_files/qry_get_navigation.cfm">
</cfsilent>