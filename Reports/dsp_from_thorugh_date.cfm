
<!--Reports/dsp_from_thorugh_date.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the fuse that is used in the reports module to submit to reports.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:06:44  stetzer
	<>

	Revision 1.2  2001-12-06 13:54:33-05  french
	Applying style sheet correctly for the Reports module.

	Revision 1.1  2001-10-11 11:04:42-04  long
	added $log $ for edits.  To all CFM files that have fusedocs.
	||
	--> attributes.report_name: this is the name of the report that the form is submitting to.
	--> attributes.required: this is wether or not the form fields will be required. 
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	||
	END FUSEDOC --->
<cfparam name="attributes.action" default="index.cfm">
<cfparam name="attributes.report_name" default="">
<cfparam name="attributes.required" default="No">
</cfsilent>
<cfoutput>
<cfform name="report" action="index.cfm?fuseaction=#attributes.action#"> 
<table align="center" border="0" cellpadding="2" cellspacing="0" width="40%">
	<tr bgcolor="##008080">
		<td colspan="2" class="HeadText#session.workstream_text_size#White">#attributes.report_name#</td>
	</tr>
	<tr bgcolor="##5F5F5F">
		<td colspan="2" class="RegText#session.workstream_text_size#White">Enter Dates (mm/dd/yyyy)</td>
	</tr>
	<tr>	
		<td class="RegText#session.workstream_text_size#">From: <cfinput type="Text" name="From_date" required="#attributes.required#" size="9" validate="date" message="You must enter a valid from date" class="RegText#session.workstream_text_size#"></td>
		<td class="RegText#session.workstream_text_size#">To: <cfinput type="Text" name="through_date" required="#attributes.required#" size="9" validate="date" message="You must enter a valid through date" class="RegText#session.workstream_text_size#"></td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="Submit" value="Enter Dates" class="RegText#session.workstream_text_size#"></td>
	</tr>	
</table>
</cfform>
</cfoutput>

