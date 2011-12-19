<!--marketing/dsp_marketing_form.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the display for the marketing module for workstream, I allow display and entry of marketing information.

	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->

 
	<tr>
		<td>
<CFFORM name="myform" action="index.cfm?fuseaction=Marketing.Submit_Marketing" method="POST"> 

<cfgrid name="marketing" width="900" query="marketing" insert="no" sort="Yes" bold="No" italic="No" appendkey="Yes" highlighthref="Yes"  griddataalign="LEFT" gridlines="Yes" rowheaders="No" rowheaderalign="LEFT" rowheaderitalic="No" rowheaderbold="No" colheaders="Yes" colheaderalign="LEFT" colheaderitalic="No" colheaderbold="Yes" selectmode="edit" picturebar="No">

<cfgridcolumn name="project_code" header="Project" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" 
display="Yes" headerbold="No" headeritalic="No" > 

 <cfgridcolumn name="description" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="yes" 
display="Yes" headerbold="No" headeritalic="No" width="130">

 <cfgridcolumn name="Prospecting_Begin" header="Prospecting Begin" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="no" display="Yes" headerbold="No" headeritalic="No" width="65"> 

<cfgridcolumn name="Prospecting_End"  header="Prospecting End" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="NO" display="Yes" headerbold="No" headeritalic="No" width="65">  

<cfgridcolumn name="Qualifying_Begin" header="Qualifying Begin" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">

<cfgridcolumn name="Qualifying_End" header="Qualifying End" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">

<cfgridcolumn name="Proposing_Begin" header="Proposing Begin" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">

<cfgridcolumn name="Proposing_End" header="Proposing End" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">

<cfgridcolumn name="Closing_Begin" header="Closing Begin" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">

<cfgridcolumn name="Closing_End" header="Closing End" headeralign="LEFT" dataalign="LEFT" bold="No" italic="No" select="Yes" display="Yes" headerbold="No" headeritalic="No" width="65">

</cfgrid>
</cfform>
		</td>
	</tr>
