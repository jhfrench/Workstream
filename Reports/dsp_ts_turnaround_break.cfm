
<!--Reports/dsp_ts_turnaround_break.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I show the average time used to complete a TS task by customer and product.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:09:45  stetzer
	<>

	Revision 1.0  2002-01-07 10:37:37-05  french
	Creating tech support report.

	||
	END FUSEDOC --->
</cfsilent>
<tr>
	<td>
		<cfinclude template="dsp_ts_completion_by_customer.cfm"><br><br>&nbsp;
	</td>
	<td>
		<cfinclude template="dsp_ts_completion_by_product.cfm"><BR><br>&nbsp;
	</td>
</tr>
