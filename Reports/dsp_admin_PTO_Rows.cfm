
<!--Reports/dsp_admin_pto_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:04:41  stetzer
	<>

	Revision 1.5  2002-01-22 13:52:01-05  long
	Added Jsstringformat around the link to keep it from erroring.

	Revision 1.4  2001-12-31 09:52:36-05  long
	changed the number format to decimal format to keep the output from rounding the numbers.

	Revision 1.3  2001-10-16 12:14:31-04  french
	Minor formatting changes for display or readability.

	Revision 1.2  2001-10-16 08:41:40-04  long
	Added status bar text on mouseover for drilldown, and made the report compliant with the other PTO hours report.
	
	Revision 1.1  2001-10-11 11:04:51-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
	<cfset appos="&rsquo;">
</cfsilent>
<cfoutput query="PTO_hours"> 
	<tr<cfif NOT (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td align="center" class="RegText#session.workstream_text_size#">
			#Emp_ID# 
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			#lname#, #name#
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			<a href="javascript:pto('#Emp_id#')"onmouseover="MM_displayStatusMsg('View a detailed report on #jsstringformat("#name# #lname#")#&rsquo;s PTO hours.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#decimalformat(pto_hours_used)#</a>
			<cfset used=pto_hours_used>
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			#decimalformat(PTO_hours_earned)# <cfset earned=pto_hours_earned>
			<cfset Remain=earned-used>
		</td>
		<td align="center" class="RegText#session.workstream_text_size#<cfif remain LT 0>Red</cfif>">
			#decimalformat(remain)#<cfset remain = 0>
		</td> 
	</tr>
</cfoutput> 
