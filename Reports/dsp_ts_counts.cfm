
<!--Reports/dsp_ts_counts.cfm
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
	Revision 1.1  2005/03/09 18:09:39  stetzer
	<>

	Revision 1.0  2002-01-07 10:37:34-05  french
	Creating tech support report.

	||
	END FUSEDOC --->
</cfsilent>
<tr>
	<td>
		<cfinclude template="dsp_ts_client_count.cfm">
	</td>
	<td>
		<cfinclude template="dsp_ts_product_count.cfm">
	</td>
</tr>
