
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
	<cfset variables.month_list="1,2,3,4,5,6,7,8,9,10,11,12">
<cfelse>
	<cfset variables.month_list="">
	<cfset variables.first_month=month(get_extreme_dates.min_date)>
	<cfset variables.last_month=month(get_extreme_dates.max_date)>
	<cfif variables.first_month GT variables.last_month>
		<cfloop from="#variables.first_month#" to="12" index="variables.month_ii">
			<cfset variables.month_list=listappend(variables.month_list, variables.month_ii)>
		</cfloop>
		<cfloop from="1" to="#variables.last_month#" index="variables.month_ii">
			<cfset variables.month_list=listappend(variables.month_list, variables.month_ii)>
		</cfloop>	
	<cfelse>
		<cfloop from="#variables.first_month#" to="#variables.last_month#" index="variables.month_ii">
			<cfset variables.month_list=listappend(variables.month_list, variables.month_ii)>
		</cfloop>
	</cfif>
</cfif>
<cfset variables.first_year=year(get_extreme_dates.min_date)>
<cfset variables.last_year=year(now())>
</cfsilent>
<cfform action="index.cfm?fuseaction=#attributes.fuseaction#" name="invoice_list" method="POST">
<cfoutput>
<tr align="center" bgcolor="##772862" class="SubHeadText">
	<td colspan="5" class="SubHeadTextWhite">
		Month: <select name="month" class="RegText">
		<cfloop list="#variables.month_list#" index="variables.month_ii">
			<option value="#variables.month_ii#"<cfif attributes.month EQ variables.month_ii> SELECTED</cfif>>#variables.month_ii#</option>
		</cfloop>
		</select>
		Year: <select name="year" class="RegText">
		<cfloop from="#first_year#" to="#last_year#" index="ii">
			<option value="#ii#"<cfif attributes.year EQ ii> selected</cfif>>#ii#</option>
		</cfloop>
		</select><br /><cfif isdefined("attributes.customer_id")>
		<input type="hidden" name="customer_id" value="#attributes.customer_id#" />
		</cfif>
		<input type="submit" value="Get Invoice List" class="RegText">
<cfif session.user_account_id EQ 1>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<font color=White>Post Invoices</font><input type="checkbox" value="1" name="run_post">
</cfif>
	</td>
</tr>
</cfoutput>
</cfform>

