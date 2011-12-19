
<!--common_files/pag_spell_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the spell check entry form. The textarea for the form may or may not be loaded with text depending upon if any was passed from the calling form.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfset onload="ReturnForm();">
<cfset bgcolor="##78A0EB">
</cfsilent>
<cfinclude template="act_spell_check_original_entry.cfm">
<cflock name="spell" timeout="100">
	<cfx_spell action="LANGUAGES" name="Lang">
</cflock>
<cfform action="index.cfm?fuseaction=common_files.spell_check&formname=#formname#" name="spell" method="POST">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%" class="SelectText<cfoutput>#session.workstream_text_size#</cfoutput>">
	<cfinclude template="dsp_spell_entry_header.cfm">
	<cfinclude template="dsp_spell_entry_form.cfm">
</table>
</cfform>

