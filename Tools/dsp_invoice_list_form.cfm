
<!--Tools/dsp_invoice_list_form.cfm
	Author: Jeromy F -->
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
<cfif datediff("m", get_extreme_dates.min_date, get_extreme_dates.max_date) GT 11>
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
<cfset variables.last_year=year(get_extreme_dates.max_date)>
</cfsilent>
<cfform action="index.cfm?fuseaction=#attributes.fuseaction#" name="invoice_list" method="POST">
<cfoutput>
<div class="row-fluid">
	<div class="span8 well form-inline">
		<label for="year">Month</label>: <select name="month" id="month" class="span2">
		<cfloop list="#variables.month_list#" index="variables.month_ii">
			<option value="#variables.month_ii#"<cfif attributes.month EQ variables.month_ii> selected="selected"</cfif>>#variables.month_ii#</option>
		</cfloop>
		</select>
		<label for="year">Year</label>: <select name="year" id="year" class="span2">
		<cfloop from="#first_year#" to="#last_year#" index="ii">
			<option value="#ii#"<cfif attributes.year EQ ii> selected="selected"</cfif>>#ii#</option>
		</cfloop>
		</select><cfif isdefined("attributes.customer_id")>
		<input type="hidden" name="customer_id" value="#attributes.customer_id#" />
		</cfif>
		<input type="submit" value="Get Invoice List" class="btn btn-primary" />
<cfif variables.user_identification EQ 1>
&nbsp;&nbsp;<input type="checkbox" name="run_post" id="run_post" value="1" />&nbsp;<label for="run_post">Post Invoices</label>
</cfif>
</div>
</cfoutput>
</cfform>

