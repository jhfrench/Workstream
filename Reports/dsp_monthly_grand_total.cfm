
<!--Reports/dsp_monthly_grand_total.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the grand total of hours for the monthly billable and monthly Non-billable hours reports.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:07:59  stetzer
<>

Revision 1.1  2001-10-11 11:04:36-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
</cfsilent>
<cfif evaluate("#query#.CurrentRow") EQ evaluate("#query#.recordcount")><!-- I only want this after  the client code changes -->
				<cfinclude template="dsp_summary_hours.cfm"> 
				<cfinclude template="Dsp_employee_classification_hours.cfm">
				<tr>
				<td colspan="3">
					&nbsp;&nbsp;
				</td>
			</tr>
			<tr class="subheadText<cfoutput>#session.workstream_text_size#</cfoutput>">
				<td  colspan="2" align="right">
					Grand Total Hours:
				</td>
				<td align="left">
					<cfoutput>#DecimalFormat(grand_total_hours)#</cfoutput>
				</td>
			</tr>
	</cfif>
