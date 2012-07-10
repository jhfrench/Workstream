
<!--Tools/dsp_customer_rate_grid.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the insert customer rate grid in teh tools module.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<tr>
	<td>
<cfform name="myform" action="index.cfm?fuseaction=Tools.insert_rate">
	<cfgrid name="customer_rate" width="600" query="new_rates" sort="Yes" bold="No" italic="No" appendkey="No" highlighthref="Yes"  griddataalign="LEFT" gridlines="Yes" rowheaders="No" rowheaderalign="LEFT" rowheaderitalic="No" rowheaderbold="No" colheaders="Yes" colheaderalign="LEFT" colheaderitalic="No" colheaderbold="Yes" selectmode="EDIT" picturebar="No">
	<cfgridcolumn name="description" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="No" display="Yes" headerbold="No" headeritalic="No"> 
	<cfgridcolumn name="LName" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="No" display="Yes" headerbold="No" headeritalic="No">
	<cfgridcolumn name="Name" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="No" display="Yes" headerbold="No" headeritalic="No">
	<cfgridcolumn name="Rate" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" display="Yes" headerbold="Yes" headeritalic="No">
	<cfgridcolumn name="rate_start_date" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" display="Yes" headerbold="Yes" headeritalic="No">
	<cfgridcolumn name="rate_end_date" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" display="Yes" headerbold="Yes" headeritalic="No">
	<cfgridcolumn name="billing_Rate_ID" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" display="no" headerbold="Yes" headeritalic="No">
</cfgrid>
	</td>
</tr>
<tr align="center">
      <td width="385" height="28" align="left" colspan="3"><div align="center"><center><p><input type="submit" value="Submit" name="Submit" /> </td>
   </tr>
</cfform>
