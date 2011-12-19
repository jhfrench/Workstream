
<!--Tools/dsp_date_locked.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the form that allows an administrator to update the date locked of a company.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfform action="index.cfm?fuseaction=Tools.date_locked" method="POST">
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td class="SubHeadText#session.workstream_text_size#">Company, Previous Date Locked</td>
		<td class="SubHeadText#session.workstream_text_size#">New Date Locked</td>
	</tr>
	<tr>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			<select name="company_id" size="#min(get_date_locked.recordcount, 10)#" multiple  class="RegText#session.workstream_text_size#"></cfoutput>
				<cfoutput query="get_date_locked">
				<cfif len(date_locked)>
					<option value="#company_id#"<cfif listlast(session.workstream_company_id) EQ company_id> selected</cfif>>#company#, #dateformat(date_locked, "mm/dd/yy")#</option>
				<cfelse>
					<option value="#company_id#"<cfif listlast(session.workstream_company_id) EQ company_id> selected</cfif>>#company#, NO DATE SPECIFIED</option>
				</cfif>
				</cfoutput><cfoutput>
			</select>
		</td>
		<td valign="top" class="RegText#session.workstream_text_size#">
			Date Locked: <cfinput type="Text" name="date_locked"  message="Please specify a valid date to apply." validate="date" required="Yes" size="8" class="RegText#session.workstream_text_size#">		
		</td>	
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" name="submit" value="Update Date Locked" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfoutput>
</cfform>

