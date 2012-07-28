
<!--Reports/dsp_gross_hours_rows_ytd.cfm
	Author: Joshua Peters  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the gross hours YTD report.
	||
	Name: Joshua Peters
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>

<!--- Initialize grand total variables to 0 before iteration --->
<cfset billable_grand_tot = 0>
<cfset nonbillable_grand_tot = 0>
<cfset gross_grand_tot = 0>

<cfloop query="qry_get_ytd_gross_hours">
	<tr <cfif (currentrow MOD 2)> bgcolor="#E1E1E1"</cfif>>
		<cfoutput>
			<!--- Calculate totals and billable amount --->
			<!--- <cfset billable = Gross_Hours - non_billable> --->
			<cfset billable_grand_tot = billable_grand_tot + billable>
			<cfset nonbillable_grand_tot = nonbillable_grand_tot + non_billable>
			<cfset gross_grand_tot = Gross_Hours + gross_grand_tot>
		<td>
			#LName#, #Name# 
		</td>
		<td>
			#employee_classification# 
		</td>
		<td>
			#City#
		</td>

		<td>
			#decimalformat(non_billable)#
		</td>

		<td>
			#decimalformat(billable)#
		</td>

		<td>
			#decimalformat(Gross_Hours)#
		</td>
		</cfoutput>
	</tr>
</cfloop>
</table>
<hr>
<table cellpadding="3" cellspacing="0" border="0"bordercolor="##000000" align="center" width="100%">
	<cfoutput>
	<tr class="SubHeadText">
		<td class="SubHeadText">
			Totals
		</td>

		<td class="SubHeadText">
			#qry_get_ytd_gross_hours.recordcount# Record<cfif qry_get_ytd_gross_hours.recordcount GT 1>s</cfif><!--- Add s to make plural if more than 1 record found --->
		</td>

		<td class="SubHeadText">
			&nbsp;
		</td>

		<td class="SubHeadText">
			#decimalformat(nonbillable_grand_tot)#
		</td>

		<td class="SubHeadText">
			#decimalformat(billable_grand_tot)#
		</td>

		<td class="SubHeadText">
			#decimalformat(gross_grand_tot)#
		</td>
	</tr>
	</cfoutput>
