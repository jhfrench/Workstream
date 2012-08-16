
<!--Reports/dsp_nuc_PTO_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfloop query="get_pto_year_summary">
<cfset variables.transaction_year=transaction_year>
<cfset variables.total_in=variables.total_in+hours_in>
<cfset variables.total_out=variables.total_out+hours_out>
<cfset variables.remain=variables.remain+hours_in-hours_out>
<cfset variables.menu_count=currentrow-1>
<cfset variables.year_sum=variables.year_sum+hours_in-hours_out>
<cfoutput>
	<tr>
		<td colspan="2" align="left" valign="top" width="30%">
			<a href="javascript:openMenu('#variables.menu_count#');" title="Click here for #transaction_year# PTO details."><img src="../images/sign_plus.gif" width="9" height="9" alt="" border="0">&nbsp;#variables.transaction_year# PTO Summary</a>
		</td>
		<td align="right">#decimalformat(hours_in)#</td>
		<td align="right">#decimalformat(hours_out)#</td>
		<td align="right">#decimalformat(variables.year_sum)#</td>
	</tr>
	<tr id="SubMenu"<cfif get_pto_year_summary.recordcount GT 1> style="display:none;"</cfif>>
		<td colspan="5">
			<table border="0" cellspacing="0" width="100%" bordercolorlight="gray" align="center">
				<tr bgcolor="e1e1e1">
					<td>&nbsp;</td>
					<td>Date</td>
					<td>Description</td>
					<td align="right">Credit</td>
					<td align="right">Debit</td>
					<td align="right">Balance</td>
				</tr>
</cfoutput>
<cfoutput query="get_pto_detail">
<cfif year(transaction_date) EQ variables.transaction_year>
				<tr>
					<td>&nbsp;</td>
					<td>
						#dateformat(transaction_date,'m/d/yyyy')#
					</td>
					<td>
						<cfif hours_out EQ 0>#comments#<cfelse><a href="javascript:time_edit('#time_entry_id#');"><cfif len(comments)>#comments#<cfelse>PTO Usage</cfif></a></cfif>
					</td>
					<td align="right">
						<cfif hours_in>#decimalformat(hours_in)#<cfelse>&nbsp;</cfif>
					</td>
					<td align="right">
						<cfif hours_out>#decimalformat(hours_out)#<cfelse>&nbsp;</cfif>
					</td><cfset variables.result=variables.result+hours_in-hours_out>
					<td align="right">
						#decimalformat(variables.result)#
					</td>
				</tr>
</cfif>
</cfoutput>
			</table>
		</td>
	</tr>
</cfloop>
<cfoutput>
	<tr> 
		<td>
		</td>
		<td align="center" class="RegTextBd">
			Totals:
		</td>
		<td align="right" class="RegTextBd">
			#decimalformat(total_in)#
		</td>
		<td align="right" class="RegTextBd">
			#decimalformat(total_out)#
		</td><cfset variables.remain_total=variables.total_in-variables.total_out>
		<td align="right" class="RegTextBd">
			#decimalformat(remain_total)#
		</td>
	</tr>
</cfoutput>

