
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
	Revision 1.6  2005/06/15 21:09:04  stetzer
	<>

	Revision 1.5  2005-06-15 16:59:02-04  stetzer
	<>

	Revision 1.4  2005-06-15 16:57:17-04  stetzer
	<>

	Revision 1.3  2005-06-15 10:51:01-04  stetzer
	<>

	Revision 1.1  2005-06-15 10:45:16-04  stetzer
	<>

	Revision 1.0  2005-02-15 16:01:17-05  daugherty
	Initial revision

	Revision 1.1  2001-10-11 13:15:33-04  long
	Added FuseDoc

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
<cfform action="index.cfm?fuseaction=invoice_list" name="invoice_list" method="POST">
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
		<input type="Submit" value="Get Invoice List" class="RegText#session.workstream_text_size#">
<cfif #authuser# contains 'stetzer'>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<font color=White>Post Invoices</font><input type="checkbox" value="1" name="run_post">
</cfif>
	</td>
</tr>
</cfoutput>
</cfform>

