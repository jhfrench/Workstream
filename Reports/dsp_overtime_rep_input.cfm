
<!--Reports/dsp_overtime_rep_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the code for the overtime report input screen.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:08:25  stetzer
<>

Revision 1.1  2001-10-11 11:04:33-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfloop from="1" to="7" index="ii">
	<cfset temp_date=dateadd("d", -ii, now())>
	<cfif DayOfWeek(temp_date) EQ 1>
		<cfset start_date=DateFormat(temp_date, "mm/dd/yy")>
	<cfelseif DayOfWeek(temp_date) EQ 7>
		<cfset end_date=DateFormat(dateadd("d", 7, temp_date), "mm/dd/yy")>
	</cfif>
</cfloop>
<table border="0" cellpadding="4" cellspacing="0" align="center" width="25%">
	<tr bgcolor="##0000ff" class="headText<cfoutput>#session.workstream_text_size#</cfoutput>White">
		<td  align ="center" colspan="2"></td>
			Overtime Report
		</td>
</tr>
<tr>
<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>" colspan ="2">
Select a Week:
</td>
</tr>
<tr class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
<td>
	Name:
</td>
</tr>
<tr>
<td>
			
			<cfselect name="pin" size="5" message="Please don't leave blank" required="Yes" multiple="Yes" class="RegText#session.workstream_text_size#">
				<OPTION VALUE="ALL" selected>
					ALL
					<cfoutput query="get_overtime_employees">
				<option value="#emp_id#">
					#lname#, # name#
				</cfoutput></cfselect>
</td>	
</tr>
<tr>
<td align="center">			
	<input type="submit" value="Submit" align="middle">
	</td>
	 <input type ="hidden" value ="true" name="flag">
</tr>
</cfform>
</table>

