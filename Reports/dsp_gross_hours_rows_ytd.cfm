
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>

<!--- Initialize grand total variables to 0 before iteration --->
<cfset billable_grand_tot = 0>
<cfset nonbillable_grand_tot = 0>
<cfset gross_grand_tot = 0>
			
<cfloop query="qry_get_ytd_gross_hours">	
	<tr class="RegText" <cfif (currentrow MOD 2)> bgcolor="#E1E1E1"</cfif>>
		<cfoutput>
			<!--- Calculate totals and billable amount --->
			<!--- <cfset billable = Gross_Hours - non_billable> --->
			<cfset billable_grand_tot = billable_grand_tot + billable>
			<cfset nonbillable_grand_tot = nonbillable_grand_tot + non_billable>
			<cfset gross_grand_tot = Gross_Hours + gross_grand_tot>
		<td class="RegText">	
			#LName#, #Name# 
		</td>
		<td class="RegText">
			#employee_classification# 
		</td>
		<td class="RegText">
			#City#
		</td>	

		<td class="RegText">
			#decimalformat(non_billable)#
		</td>

		<td class="RegText">
			#decimalformat(billable)#
		</td>		

		<td class="RegText">
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
