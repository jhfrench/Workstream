
<!--Reports/dsp_manager_hours_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the manager hours report.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:07:51  stetzer
	<>

	Revision 1.2  2002-03-07 10:27:31-05  long
	Changed the file to work with a single query.
	
	Revision 1.1  2001-10-11 11:04:37-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfset variables.total_hours=variables.total_hours+hours>

<cfoutput>
<cfif variables.total_hours NEQ -1>

	<cfif NOT len(variables.compare_date)>
		<cfset variables.compare_date=manager_hours_report_output.date>
		
	</cfif>
	<cfif len(manager_hours_report_output.date)>
		<cfif datecompare(manager_hours_report_output.date, variables.compare_date) NEQ 0>
			<tr class="RegText#session.workstream_text_size#">
			   <td align="right" colspan="4">#dateformat(variables.compare_date, "mm/dd/yy")# Hours:</td>
			   <td>#decimalformat(variables.daily_total_hours)#</td>
			</tr>
			<cfset variables.compare_date=manager_hours_report_output.date>
			<cfset variables.daily_total_hours=0>
			<cfset variables.daily_total_hours=variables.daily_total_hours+hours>
		<cfelse>
			<cfset variables.daily_total_hours=variables.daily_total_hours+hours>
		</cfif>
	<cfelse>
		<cfset variables.daily_total_hours=variables.daily_total_hours+hours>
	</cfif>
	<tr class="RegText#session.workstream_text_size#">
	   <td bgcolor="##e1e1e1">#dateformat(date, "mm/dd/yy")#</td>
	   <td bgcolor="##e1e1e1">#display#</td>
	   <td bgcolor="##e1e1e1">#note#</td>
	   <td bgcolor="##e1e1e1">#decimalformat(hours)#</td>
	</tr>
  <cfelse>
	<tr>
		<td align="center" colspan="5" class="SubHeadText#session.workstream_text_size#">
	  		No timekeeping records match the criteria for this employee.
		</td>
	</tr>
 </cfif>
</cfoutput>
