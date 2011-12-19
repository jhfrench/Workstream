
<!--Customers/dsp_add_contact_grid.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I let people add marketing contacts.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:50:47  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:01-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfform name="person" action="index.cfm?fuseaction=edit">

<tr>
<td align="center">
<cfgrid query="get_people_by_project_id" name="person_grid" width="800" insert="yes" sort="no" bold="No" italic="No" appendkey="Yes" highlighthref="Yes"  griddataalign="LEFT" gridlines="Yes" rowheaders="No" rowheaderalign="LEFT" rowheaderitalic="No" rowheaderbold="No" colheaders="Yes" colheaderalign="LEFT" colheaderitalic="No" colheaderbold="Yes" selectmode="edit" picturebar="No">

<cfgridcolumn name="Project_Code"  header ="Project Code" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="description"  header ="Project Name" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="name"  header ="Name" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No">
 
<cfgridcolumn name="lname"  header ="Last Name" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No">
 
<cfgridcolumn name="email"  header ="Email" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No">
 
<cfgridcolumn name="phone_number"  header ="Phone Number" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" display="Yes" headerbold="No" headeritalic="No">
 
<cfgridcolumn name="extension"  header ="Extention" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No">

<cfgridcolumn name="address1"  header ="Address 1" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No">
 
<cfgridcolumn name="address2"  header ="Address 2" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No">
 
<cfgridcolumn name="city"  header ="City" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No">
  
<cfgridcolumn name="state"  header ="State" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No">
 
<cfgridcolumn name="zip"  header ="Zip" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No">
  
<cfgridcolumn name="emp_id"   headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" 
display="no" headerbold="No" headeritalic="No">
  
 
 
</cfgrid>
</td>
</tr>
<tr>
	<td align="center"><input type="Hidden" name="project_id" value="<cfoutput>#attributes.cfgridkey#</cfoutput>">
<input type="Submit" value="Submit"  class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"></td>
</tr>

</cfform>
