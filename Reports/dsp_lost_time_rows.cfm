
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
<cfset pto_tot =  0>
<cfset bereavement_tot = 0>
<cfset gross_grand_tot = 0>
</cfsilent>
<cfloop query="lost_time">	
	<tr class="RegText#session.workstream_text_size#" <cfif (currentrow MOD 2)> bgcolor="#E1E1E1"</cfif>>
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
			<cfset  pto_tot =  pto_tot +  pto>
		<td class="RegText#session.workstream_text_size#">	
			#full_name# 
		</td>
		<!--- <td class="RegText#session.workstream_text_size#">
			#Authorized_Leave#
		</td> --->
		<td class="RegText#session.workstream_text_size#">
			#Bereavement# 
		</td>
		<td class="RegText#session.workstream_text_size#">
			#Holiday#
		</td>	
		<td class="RegText#session.workstream_text_size#">
			#Jury_Duty#
		</td>
		<!--- <td class="RegText#session.workstream_text_size#">
			#Sick#
		</td>		 --->
		<td class="RegText#session.workstream_text_size#">
			#STD_LTD#
		</td>
		<td class="RegText#session.workstream_text_size#">
			#Unpaid#
		</td>
		<!--- <td class="RegText#session.workstream_text_size#">
			#Vacation#
		</td> --->
		<td class="RegText#session.workstream_text_size#">
			#PTO#
		</td>
		<td class="RegText#session.workstream_text_size#">
			#total#
		</td>
		</cfoutput>
	</tr>
</cfloop>
<tr>
	<td colspan="11"><hr></td>
</tr>


	<cfoutput>
	<tr class="SubHeadText#session.workstream_text_size#">
		<td class="SubHeadText#session.workstream_text_size#">	
			Totals
		</td>
		<!--- <td class="SubHeadText#session.workstream_text_size#">
			#decimalformat(Authorized_Leave_tot)#
		</td> --->
		<td class="SubHeadText#session.workstream_text_size#">
			#decimalformat(bereavement_tot)#
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			#decimalformat(holiday_tot)#
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			#decimalformat(jury_duty_tot)#
		</td>
		<!--- <td class="SubHeadText#session.workstream_text_size#">
			#decimalformat(sick_tot)#
		</td> --->
		<td class="SubHeadText#session.workstream_text_size#">
			#decimalformat(std_ltd_tot)#
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			#decimalformat(Unpaid_tot)#
		</td>	
		<!--- <td class="SubHeadText#session.workstream_text_size#">
			#decimalformat(Vacation_tot)#
		</td>	 --->
		<td class="SubHeadText#session.workstream_text_size#">
			#decimalformat(pto_tot)#
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			#decimalformat(gross_grand_tot)#
		</td>
	</tr>
	<tr class="SubHeadText#session.workstream_text_size#">
	<td class="SubHeadText#session.workstream_text_size#" colspan="11">
			#lost_time.recordcount# Record<cfif lost_time.recordcount GT 1>s</cfif><!--- Add s to make plural if more than 1 record found --->
		</td>	
	</tr>
	</cfoutput>
	</table>
