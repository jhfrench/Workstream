
<!--Reports/pag_new_engage_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the input page that lets a user choose a set of customers to retrieve new engagement histories.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_new_engage_input.cfm">
<cfform action="index.cfm?fuseaction=Reports.new_engagement_output" name="new_engagement" method="POST">
<table align="center" border="0" cellpadding="1" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="3" gutter="0" section_color="008080" section_title="New Project Report" title_class="HeadTextWhite">
	<cfinclude template="dsp_new_engage_input.cfm">
<cfoutput>
	<tr>
		<td align="center" colspan="1" class="RegText">
			<input type="submit" value="Look Up Projects" class="RegText">
		</td>
	</tr>
</cfoutput>
</table>
</cfform>

