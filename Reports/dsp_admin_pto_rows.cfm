
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
	<tr>
		<td class="RegText number">
			#Emp_ID# 
		</td>
		<td class="RegText">
			#lname#, #name#
		</td>
		<td class="RegText number">
			<a href="javascript:pto('#emp_id#')" class="RegText">#decimalformat(pto_hours_used)#</a>
			<cfset used=pto_hours_used>
		</td>
		<td class="RegText number">
			#decimalformat(pto_hours_earned)#
		</td>
		<cfset variables.remain=pto_hours_earned-used>
		<td class="RegText<cfif variables.remain LT 0>Red</cfif> number">
			#decimalformat(variables.remain)#
		</td> 
	</tr>
</cfoutput> 
