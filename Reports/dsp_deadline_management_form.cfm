
<!--Tools/dsp_deadline_management_form.cfm
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
<cfoutput>
<form name="deadline_management" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="well form-inline">
<fieldset>
	<legend>Deadline Management for </legend>
	<label for="admin_month">Month</label>: 
	<select name="admin_month" id="admin_month" class="span2">
	<cfloop list="#variables.month_list#" index="variables.month_ii">
		<option value="#variables.month_ii#"<cfif attributes.admin_month EQ variables.month_ii> selected="selected"</cfif>>#monthasstring(variables.month_ii)#</option>
	</cfloop>
	</select>
	<label for="admin_year">Year</label>: 
	<select name="admin_year" id="admin_year" class="span2">
	<cfloop from="#first_year#" to="#last_year#" index="ii">
		<option value="#ii#"<cfif attributes.admin_year EQ ii> selected="selected"</cfif>>#ii#</option>
	</cfloop>
	</select>
	<label for="hide_supervisor"><input type="checkbox" name="hide_supervisor" id="hide_supervisor" value="1"<cfif isdefined("attributes.hide_supervisor")> checked="checked"</cfif> /> Remove your data</label>
	<input type="submit" value="Update Report" class="btn btn-primary" />
</fieldset>
</form>
</cfoutput>