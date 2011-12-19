
<!--common_files/pag_big_project_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the big team list page that lets the user see more employees at one time (easier scrolling).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2006/08/11 11:01:59  french
Adding defaults.

Revision 1.0  2005-02-15 15:41:38-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:45-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfset bgcolor="##78A0EB">
<cfset variables.company_id=0>
<cfparam name="attributes.project_id" default="0">
</cfsilent>
<cfif attributes.project_id NEQ 0>
	<cfinclude template="qry_get_selected_project_data.cfm">
	<cfset attributes.default1=get_selected_project_data.customers_id>
	<cfset attributes.default2=get_selected_project_data.project_id>
</cfif>
<cfinclude template="act_okbutton.cfm">
<cfinclude template="qry_get_valid_projects.cfm">
<cfform action="index.cfm?fuseaction=spell_check&formname=#formname#" name="big_list" method="POST">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%" class="SelectText<cfoutput>#session.workstream_text_size#</cfoutput>">
	<cfinclude template="dsp_big_project_list_header.cfm">
	<cfinclude template="dsp_big_project_list.cfm">
	<cfinclude template="dsp_big_list_submit.cfm">
</table>
</cfform>

