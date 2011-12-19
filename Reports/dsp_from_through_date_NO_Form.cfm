
<!--Reports/dsp_from_through_date_NO_Form.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the fuse that is used in the reports module to submit to reports.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:06:47  stetzer
<>

Revision 1.1  2001-10-11 11:04:42-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> attributes.report_name: this is the name of the report that the form is submitting to.
	--> attributes.required:this is wether or not the form fields will be required. 
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	||
	END FUSEDOC --->
<cfparam name="attributes.form_name" default="form[0]">
<cfparam name="attributes.action" default="index.cfm">
<cfparam name="attributes.report_name" default="">
<cfparam name="attributes.required" default="No">
</cfsilent>
<cfinclude template="../common_files/dsp_pop_calendar.cfm">
<cfmodule template="../common_files/act_calendar.cfm" form_name="#attributes.form_name#" field_name="from_date,through_date">
<cfoutput>
<table border="0" cellpadding="1" cellspacing="0" width="90%" align="center">
	<tr bgcolor="##008080" class="HeadText#session.workstream_text_size#White">
		<td colspan="2">#attributes.report_name#</td>
	</tr>
	<tr bgcolor="##5F5F5F" class="HeadTextSmWhite">
		<td colspan="2">Enter Dates (mm/dd/yyyy)</td>
	</tr>
	<tr>	
		<td class="RegText#session.workstream_text_size#">From: <cfinput type="Text" name="from_date" required="#attributes.required#" validate="date" size="11" message="You must enter a valid from date" class="RegText#session.workstream_text_size#" onClick="ShowDate(1)"></td>
		<td class="RegText#session.workstream_text_size#">To: <cfinput type="Text" name="through_date" required="#attributes.required#" validate="date" size="11" message="You must enter a valid through date" class="RegText#session.workstream_text_size#" onClick="ShowDate(2)"></td>
	</tr>
</table>
</cfoutput>

