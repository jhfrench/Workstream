
<!-- Reports/dsp_manager_hours_total_hours.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the total hours for a report, I am used in the manager's
	hours report.

	||
	Edits: 
	$Log$
	Revision 1.1  2005/03/09 18:07:57  stetzer
	<>

	Revision 1.1  2002-03-07 10:30:31-05  long
	Formatted the file for easier reading

	Revision 1.0  2002-03-07 08:55:36-05  long
	Created new file, broken out from a previous file.  Changed the file structure to support a new and better query

	||
	Variables:
	
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr class="RegText#session.workstream_text_size#">
	   <td align="right" colspan="4">#dateformat(variables.compare_date, "mm/dd/yy")# Hours:</td>
	   <td>#decimalformat(variables.daily_total_hours)#</td>
	</tr>
	<cfset variables.compare_date=manager_hours_report_output.date>
	<cfset variables.daily_total_hours=0>
	<cfset variables.total_hours=variables.total_hours+1><!--- to account for the negative 1 --->
	<tr class="SubHeadText#session.workstream_text_size#">
	    <td align="right" colspan="4">Total Hours: </td>
	  	<td>#variables.total_hours#</td>
  	</tr> 
</cfoutput>