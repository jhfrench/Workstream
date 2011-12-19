
<!--Reports/dsp_pto_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:08:55  stetzer
	<>

	Revision 1.3  2001-10-16 12:14:32-04  french
	Minor formatting changes for display or readability.

	Revision 1.2  2001-10-16 08:45:56-04  long
	made the report compliant with the other PTO hours report.
	
	Revision 1.1  2001-10-11 11:04:30-04  long
	Added $log $ for edits to all CFM files that have fusedocs.

	||
	END FUSEDOC --->
	<cfparam name="form_pin" default="">
</cfsilent>
<table border="0" cellpadding="4" cellspacing="0" align="center" width="95%">
	<tr align="center">
		<td class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<cfif ListContains(form_pin,'all')>Manager</cfif> Personal Time Off Report
		</td>
	</tr>
</table>

