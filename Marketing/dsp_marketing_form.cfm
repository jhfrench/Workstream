<!--marketing/dsp_marketing_form.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the display for the marketing module for workstream, I allow display and entry of marketing information.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:50:49  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:00-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	Variables:
	END FUSEDOC --->

 
	<tr>
		<td>
<CFFORM name="myform" Action="index.cfm?fuseaction=Submit_Marketing" method="POST"> 

<cfgrid name="marketing" width="900" query="marketing" insert="no" sort="Yes" bold="No" italic="No" appendkey="Yes" highlighthref="Yes"  griddataalign="LEFT" gridlines="Yes" rowheaders="No" rowheaderalign="LEFT" rowheaderitalic="No" rowheaderbold="No" colheaders="Yes" colheaderalign="LEFT" colheaderitalic="No" colheaderbold="Yes" selectmode="edit" picturebar="No">

<cfgridcolumn name="Project_Code" header="Engagement" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" 
display="Yes" headerbold="No" headeritalic="No" > 

<!---  <cfgridcolumn name="Project_ID" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="NO" 
display="Yes" headerbold="No" headeritalic="No" >   --->

 <cfgridcolumn name="description" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No" width="130">

<!---  <cfgridcolumn name="active_id"  header ="Active ID" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No" > --->

 <cfgridcolumn name="Prospecting_Begin" header="Prospecting Begin" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" display="Yes" headerbold="No" headeritalic="No" width="65"> 

<cfgridcolumn name="Prospecting_End"  header="Prospecting End" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="NO" display="Yes" headerbold="No" headeritalic="No" width="65">  

<cfgridcolumn name="Qualifying_Begin" header="Qualifying Begin" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">

<cfgridcolumn name="Qualifying_End" header="Qualifying End" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">

<cfgridcolumn name="Proposing_Begin" header="Proposing Begin" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">

<cfgridcolumn name="Proposing_End" header="Proposing End" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">

<cfgridcolumn name="Closing_Begin" header="Closing Begin" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">

<cfgridcolumn name="Closing_End" header="Closing End" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">


<!--- 
<cfgridcolumn name="Overview" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" display="Yes" headerbold="no" headeritalic="No" width="80">

<cfgridcolumn name="Company_Size" header="Co Size" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="LName1" header="Last Name1" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" href="index.cfm?fuseaction=add_edit" hrefkey="emp_id1">

<cfgridcolumn name="Name1" header="First Name1" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" href="index.cfm?fuseaction=add_edit" hrefkey="emp_id1">

<cfgridcolumn name="Phone1" header="Phone1" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="extension1" header="Extention1" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="Email1" header="Email1" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="pAddress1" header="Primary Address 1" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="sAddress1" header="Secondary Address 1" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="City1" header="City 1" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="State1" header="State 1 " headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="Zip1" header="Zip1 " headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="LName2" header="Last Name 2" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" href="index.cfm?fuseaction=add_edit" hrefkey="emp_id2">

<cfgridcolumn name="Name2" header="First Name2" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" href="index.cfm?fuseaction=add_edit" hrefkey="emp_id2">

<cfgridcolumn name="Phone2" header="Phone2" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="extension2" header="Extention2" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="Email2" header="Email2" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="pAddress2" header="Primary Address 2" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="sAddress2" header="Secondary Address 2" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="City2" header="City 2" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="State2" header="State 2 " headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="Zip2" header="Zip 2" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="LName3" header="Last Name 3" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No"  href="index.cfm?fuseaction=add_edit" hrefkey="emp_id3">

<cfgridcolumn name="Name3" header="First Name3" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" href="index.cfm?fuseaction=add_edit" hrefkey="emp_id3">

<cfgridcolumn name="Phone3" header="Phone3" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="extension3" header="Extention3" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="Email3" header="Email3" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="pAddress3" header="Primary Address 3" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="sAddress3" header="Secondary Address 3" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="City3" header="City 3" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="State3" header="State 3 " headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="Zip3" header="Zip 3" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No">


<cfgridcolumn name="Projected_Revenue"  header="Projected Revenue" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" display="yes" headerbold="Yes" headeritalic="No">

<cfgridcolumn name="Source" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" display="yes" headerbold="Yes" headeritalic="No">

<cfgridcolumn name="Probability" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" display="yes" headerbold="Yes" headeritalic="No">

<cfgridcolumn name="marketing_id" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" display="no" headerbold="Yes" headeritalic="No">

<cfgridcolumn name="ADD" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" display="yes" headerbold="Yes" headeritalic="No" href="index.cfm?fuseaction=add" hrefkey="Project_ID">

<cfgridcolumn name="emp_id1" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" display="no" headerbold="Yes" headeritalic="No">
<cfgridcolumn name="emp_id2" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" display="no" headerbold="Yes" headeritalic="No">
<cfgridcolumn name="emp_id3" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" display="no" headerbold="Yes" headeritalic="No"> --->

</cfgrid>
<!--- <tr align="center"><td>
<input type="Submit" value="Submit Changes" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
</td></tr> --->
</cfform>
		</td>
	</tr>
