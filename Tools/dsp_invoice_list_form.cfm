
<!--Tools/dsp_invoice_list_form.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the column headers for the invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfif get_extreme_dates.difference GT 11>
	<cfset first_month=1>
	<cfset last_month=12>
<cfelse>
	<cfset first_month=Month(get_extreme_dates.min_date)>
	<cfset last_month=Month(get_extreme_dates.max_date)>
</cfif>
<cfset first_year=Year(get_extreme_dates.min_date)>
<cfset last_year=Year(now())>
</cfsilent>
<cfform action="index.cfm?fuseaction=Tools.invoice_list" name="invoice_list" method="POST">
<cfoutput>
<tr align="center" bgcolor="##772862" class="SubHeadText#session.workstream_text_size#">
	<td colspan="5" class="SubHeadText#session.workstream_text_size#White">
		Month: <select name="month" class="RegText#session.workstream_text_size#">
		<cfloop from="#first_month#" to="#last_month#" index="ii">
			<option value="#ii#"<cfif attributes.month EQ ii> selected</cfif>>#ii#</option>
		</cfloop>
		</select>
		Year: <select name="year" class="RegText#session.workstream_text_size#">
		<cfloop from="#first_year#" to="#last_year#" index="ii">
			<option value="#ii#"<cfif attributes.year EQ ii> selected</cfif>>#ii#</option>
		</cfloop>
		</select><br>
		<input type="submit" value="Get Invoice List" class="RegText#session.workstream_text_size#">
<cfif session.user_account_id EQ 1>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<font color=White>Post Invoices</font><input type="checkbox" value="1" name="run_post">
</cfif>
	</td>
</tr>
</cfoutput>
</cfform>

