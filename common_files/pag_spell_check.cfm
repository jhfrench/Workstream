
<!--common_files/pag_spell_check.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display a page that checks the spelling of the text passed to me.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:40  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:44-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfset bgcolor="##78A0EB">
<cfset colspan=3>
</cfsilent>
<table cellspacing="0" cellpadding="0" width="100%" border="1" align="center" class="SelectText<cfoutput>#session.workstream_text_size#</cfoutput>">
<cfif isdefined("message") AND len(message)><cfinclude template="act_spell_check_process.cfm">
<form action="index.cfm?fuseaction=spell_check" method="post">
	<cfinclude template="dsp_spell_entry_header.cfm">
	<cfinclude template="dsp_spell_check_form.cfm">
</form>
	<cfinclude template="dsp_spell_check_add.cfm">
<cfelse>
	<tr>
		<td align="center" colspan="4" class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;There was no text to spell-check.
		</td>
	</tr>
</cfif>
<cfif isdefined("attributes.suggested_word")>
	<cfinclude template="act_spell_add.cfm">
	<cfinclude template="dsp_spell_add.cfm">
</cfif>
</table>