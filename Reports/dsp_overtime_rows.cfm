
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
   <tr class="SubHeadText#session.workstream_text_size#">
      <td>
      Code:
      </td>
      <td class="RegText#session.workstream_text_size#">
      #description#
      </td>
      <td class="RegText#session.workstream_text_size#">
		#decimalformat(hours)# <cfset Total_hours = total_hours+hours>  </cfoutput> 
      </td>
   </tr>
   