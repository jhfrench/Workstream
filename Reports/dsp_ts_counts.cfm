
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
