
<!--Report/dsp_Gross_hours_Input.cfm
	Author: Jeromy F  -->
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
<cfoutput>
	<tr class="SubHeadText">
		<td>
			Select Month:
			<select name="month" size="1" class="RegText">
				<cfloop from="1" to="12" index="month_ii">
					<option <cfif month(dateadd('M',-1, Now())) EQ month_ii>selected 				</cfif>value="#month_ii#">#MonthAsString(month_ii)#</option>
				</cfloop>
			</select>
		</td>
		<td>
			Select Year:
			<select name="year" size="1" class="RegText">
				<cfloop from="2000" to="#year(now())#" index="year_num">
					<option value="#year_num#"<cfif year_num EQ year(now())> selected</cfif>>#year_num#</option>
				</cfloop>
			</select>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="submit" name="Enter_Date" value="Report on these dates" class="RegText">
		</td>
	</tr>
</cfoutput>

