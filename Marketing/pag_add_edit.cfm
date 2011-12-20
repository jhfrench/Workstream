
<!--Marketing/pag_add_edit.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the marketing contact  add and edit.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfif NOT compare(fuseaction, "add")>
	<table width="100%" border="0" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText" section_color="ffffff" section_title="Add a New Contact" colspan="3" gutter="false" align="center">
	<cfinclude template="dsp_add_contact_grid.cfm">
	</table>
<cfelse>
	<cfparam name="flag" default="0">
	<cfif compare(attributes.cfgridkey, "")>
		<cfif compare(flag, 1)>
					
					<cfinclude template="qry_get_contact_name.cfm">
					<table border="0" cellpadding="3" cellspacing="0" align="center">
					<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText" section_color="ffffff" section_title="Marketing Grid" colspan="3" gutter="false" align="center">
					<cfinclude template="dsp_add_edit.cfm">
					</table>
		<cfelse>
			<cfif CompareNoCase(select, "d")>
					<cfinclude template="qry_get_marketing_contact_info.cfm">
					<table width="100%" border="0" align="center">
					<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText" section_color="ffffff" section_title="Edit Current Contact" colspan="3" gutter="false" align="center">
					<cfinclude template="dsp_person_grid.cfm">
					</table>
			<cfelse>
					<cfinclude template="qry_del_marketing_contact.cfm">
					<cflocation addtoken="No" url="index.cfm?fuseaction=marketing"> 
			</cfif>
		</cfif>
	<cfelse>
	<div align="center" class="Note">To edit a contact select the contact's name, to add a contact, click "add"</div>		
	</cfif>
</cfif>
			