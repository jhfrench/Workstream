
<!--Tools/pag_date_locked.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the change date locked screen.

	||
	Edits:
	$Log$
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

