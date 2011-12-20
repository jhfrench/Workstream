
<!--Reports/dsp_overtime_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows of the overtime report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput query="indiv_codes">
   <tr class="SubHeadText">
      <td>
      Code:
      </td>
      <td class="RegText">
      #description#
      </td>
      <td class="RegText">
		#decimalformat(hours)# <cfset Total_hours = total_hours+hours>  </cfoutput> 
      </td>
   </tr>
   