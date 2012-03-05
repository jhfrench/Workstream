
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
</cfsilent>
<cfoutput>
<table align="center" cellpadding="3" cellspacing="0" border="0" width="50%">
<cfif isdefined("attributes.company_id") AND len(attributes.company_id)>
<!--- if page has been submitted and necesary variables are present --->
	<cfinclude template="act_update_date_locked.cfm">
</cfif>
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadTextWhite" section_color="772862" section_title="Change Date Locked" gutter="0" align="center" colspan="5">
	<cfinclude template="qry_get_date_locked.cfm">
	<cfinclude template="dsp_date_locked.cfm">
<cfif NOT isdefined("attributes.company_id") AND isdefined("attributes.date_locked")>
<!--- IF PAGE HAS BEEN SUBMITTED AND NECESARY VARIABLES ARE NOT PRESENT --->
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="Note" section_color="ffffff" section_title="You must select a company to update." gutter="0" align="center" colspan="5">
</cfif>
</table>
</cfoutput>

