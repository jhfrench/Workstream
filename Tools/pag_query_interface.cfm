
<!--Tools/pag_query_interface.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I run all of the automatic daily processes for NGuage.
	||
	Name: Jeromy French
	||
	--->
</cfsilent>
<cfparam name="attributes.query_text" default="">
<cfif len(attributes.query_text)>
	<cfinclude template="qry_execute_query_text.cfm">
	<cfinclude template="dsp_execute_query_text_results.cfm">
</cfif>
<cfoutput>

<cfform name="query_interface" action="index.cfm?fuseaction=Tools.query_interface" method="POST">
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			<textarea name="query_text" cols="180" rows="30">#attributes.query_text#</textarea>
		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="submit">
		</td>
	</tr>
</table>
</cfform>
</cfoutput>