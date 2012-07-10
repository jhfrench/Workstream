
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
	 || 
	END FUSEDOC --->
</cfsilent>
<tr>
	<td>
		<cfinclude template="dsp_ts_completion_by_customer.cfm"><br /><br />&nbsp;
	</td>
	<td>
		<cfinclude template="dsp_ts_completion_by_product.cfm"><br /><br />&nbsp;
	</td>
</tr>
