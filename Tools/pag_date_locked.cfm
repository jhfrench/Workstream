
<!--Tools/pag_date_locked.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the change date locked screen.

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 21:01:33  daugherty
	Initial revision

	Revision 1.3  2001-11-13 15:30:10-05  french
	Added second condition so that warning message won't display when the user first accesses date locked page.

	Revision 1.2  2001-11-13 15:05:07-05  french
	Improving aesthetics; adding display of last time date was locked.

	Revision 1.0  2001-10-11 10:54:18-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfoutput>
</cfsilent>
<table align="center" cellpadding="3" cellspacing="0" border="0" width="50%">
<cfif isdefined("attributes.company_id") AND len(attributes.company_id)>
<!--- IF PAGE HAS BEEN SUBMITTED AND NECESARY VARIABLES ARE PRESENT --->
	<cfinclude template="act_update_date_locked.cfm">
</cfif>
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText#session.workstream_text_size#White" section_color="772862" section_title="Change Date Locked" gutter="0" align="center" colspan="5">
	<cfinclude template="qry_get_date_locked.cfm">
	<cfinclude template="dsp_date_locked.cfm">
<cfif NOT isdefined("attributes.company_id") AND isdefined("attributes.date_locked")>
<!--- IF PAGE HAS BEEN SUBMITTED AND NECESARY VARIABLES ARE NOT PRESENT --->
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="Note#session.workstream_text_size#" section_color="ffffff" section_title="You must select a company to update." gutter="0" align="center" colspan="5">
</cfif>
</table>
</cfoutput>

