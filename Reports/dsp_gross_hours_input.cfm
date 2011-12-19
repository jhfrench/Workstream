
<!--Report/dsp_Gross_hours_Input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:06:50  stetzer
	<>

	Revision 1.2  2001-12-02 17:58:12-05  french
	Formatting changes.

	Revision 1.1  2001-10-11 11:04:42-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr class="SubHeadText#session.workstream_text_size#">
		<td>
			Select Month:
			<select name="month" size="1" class="RegText#session.workstream_text_size#">
				<cfloop from="1" to="12" index="month_ii">
					<option <cfif month(dateadd('M',-1, Now())) EQ month_ii>selected 				</cfif>value="#month_ii#">#MonthAsString(month_ii)#</option>
				</cfloop>
			</select>
		</td>
		<td>
			Select Year:
			<select name="year" size="1" class="RegText#session.workstream_text_size#">
				<cfloop from="2000" to="#year(now())#" index="year_num">
					<option value="#year_num#"<cfif year_num EQ year(now())> selected</cfif>>#year_num#</option>
				</cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="submit" name="Enter_Date" value="Report on these dates" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfoutput>

