
<!--Reports/dsp_pto_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
	<cfparam name="form_pin" default="">
</cfsilent>
<table border="0" cellpadding="4" cellspacing="0" align="center" width="95%">
	<tr align="center">
		<td class="HeadText">
			<cfif ListContains(form_pin,'all')>Manager</cfif> Personal Time Off Report
		</td>
	</tr>
</table>

