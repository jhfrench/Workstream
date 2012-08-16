
<!-- repotrs/dsp_lost_time_rows.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the lost time report.

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->


<!--- Initialize grand total variables to 0 before iteration --->
<!--- <cfset Authorized_Leave_tot = 0> --->
<!--- <cfset bereavement_tot = 0> --->
<cfset holiday_tot = 0>
<cfset jury_duty_tot = 0>
<!--- <cfset sick_tot = 0> --->
<cfset std_ltd_tot = 0>
<cfset Unpaid_tot = 0>
<!--- <cfset Vacation_tot = 0> --->
<cfset pto_tot = 0>
<cfset bereavement_tot = 0>
<cfset gross_grand_tot = 0>
</cfsilent>
<cfloop query="lost_time">
	<tr <cfif (currentrow MOD 2)> bgcolor="#E1E1E1"</cfif>>
		<cfoutput>
			<!--- Calculate totals --->
			<cfset gross_grand_tot = gross_grand_tot + total>
			<!--- <cfset Authorized_Leave_tot = Authorized_Leave_tot + Authorized_Leave> --->
			<cfset bereavement_tot = bereavement_tot + bereavement>
			<cfset holiday_tot = holiday_tot + holiday>
			<cfset jury_duty_tot = jury_duty_tot + jury_duty>
			<!--- <cfset sick_tot = sick_tot + sick> --->
			<cfset std_ltd_tot = std_ltd_tot + std_ltd>
			<cfset Unpaid_tot = Unpaid_tot + Unpaid>
			<!--- <cfset Vacation_tot = Vacation_tot + Vacation> --->
			<cfset  pto_tot =  pto_tot + pto>
		<td>
			#full_name# 
		</td>
		<!--- <td>
			#Authorized_Leave#
		</td> --->
		<td>
			#Bereavement# 
		</td>
		<td>
			#Holiday#
		</td>
		<td>
			#Jury_Duty#
		</td>
		<!--- <td>
			#Sick#
		</td>		 --->
		<td>
			#STD_LTD#
		</td>
		<td>
			#Unpaid#
		</td>
		<!--- <td>
			#Vacation#
		</td> --->
		<td>
			#PTO#
		</td>
		<td>
			#total#
		</td>
		</cfoutput>
	</tr>
</cfloop>
<tr>
	<td colspan="11"><hr></td>
</tr>


	<cfoutput>
	<tr class="SubHeadText">
		<td class="SubHeadText">
			Totals
		</td>
		<!--- <td class="SubHeadText">
			#decimalformat(Authorized_Leave_tot)#
		</td> --->
		<td class="SubHeadText">
			#decimalformat(bereavement_tot)#
		</td>
		<td class="SubHeadText">
			#decimalformat(holiday_tot)#
		</td>
		<td class="SubHeadText">
			#decimalformat(jury_duty_tot)#
		</td>
		<!--- <td class="SubHeadText">
			#decimalformat(sick_tot)#
		</td> --->
		<td class="SubHeadText">
			#decimalformat(std_ltd_tot)#
		</td>
		<td class="SubHeadText">
			#decimalformat(Unpaid_tot)#
		</td>
		<!--- <td class="SubHeadText">
			#decimalformat(Vacation_tot)#
		</td>	 --->
		<td class="SubHeadText">
			#decimalformat(pto_tot)#
		</td>
		<td class="SubHeadText">
			#decimalformat(gross_grand_tot)#
		</td>
	</tr>
	<tr class="SubHeadText">
	<td class="SubHeadText" colspan="11">
			#lost_time.recordcount# Record<cfif lost_time.recordcount GT 1>s</cfif><!--- Add s to make plural if more than 1 record found --->
		</td>
	</tr>
	</cfoutput>
	</table>
