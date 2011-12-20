
<!--Reports/dsp_admin_pto_rows.cfm
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
	<cfset appos="&rsquo;">
</cfsilent>
<cfoutput query="PTO_hours"> 
	<tr<cfif NOT (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td align="center" class="RegText">
			#Emp_ID# 
		</td>
		<td align="center" class="RegText">
			#lname#, #name#
		</td>
		<td align="center" class="RegText">
			<a href="javascript:pto('#Emp_id#')"onmouseover="MM_displayStatusMsg('View a detailed report on #jsstringformat("#name# #lname#")#&rsquo;s PTO hours.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#decimalformat(pto_hours_used)#</a>
			<cfset used=pto_hours_used>
		</td>
		<td align="center" class="RegText">
			#decimalformat(PTO_hours_earned)# <cfset earned=pto_hours_earned>
			<cfset Remain=earned-used>
		</td>
		<td align="center" class="RegText<cfif remain LT 0>Red</cfif>">
			#decimalformat(remain)#<cfset remain = 0>
		</td> 
	</tr>
</cfoutput> 
