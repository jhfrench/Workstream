
<!--Reports/dsp_monthly_grand_total.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the grand total of hours for the monthly billable and monthly Non-billable hours reports.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfif evaluate("#query#.CurrentRow") EQ evaluate("#query#.recordcount")><!-- I only want this after  the client code changes -->
				<cfinclude template="dsp_summary_hours.cfm"> 
				<cfinclude template="dsp_employee_classification_hours.cfm">
				<tr>
				<td colspan="3">
					&nbsp;&nbsp;
				</td>
			</tr>
			<tr class="subHeadText">
				<td  colspan="2" align="right">
					Grand Total Hours:
				</td>
				<td align="left">
					<cfoutput>#decimalformat(grand_total_hours)#</cfoutput>
				</td>
			</tr>
	</cfif>
