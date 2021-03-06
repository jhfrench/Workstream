
<!--Reports/dsp_force_hidden_link.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I hold a hidden form that allows a supervisor to drill down on tasks to the employee force report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<script language="JavaScript" type="text/javascript">
<!--<cfoutput>
function sup_to_emp(fldValue) { 
	document.sup_to_emp.reset();
	document.sup_to_emp.user_account_id.value = fldValue;
	document.sup_to_emp.submit();
}
function bc_tasks(fldValue) { 
	document.bc_tasks.reset();
	document.bc_tasks.user_account_id.value = fldValue;
	document.bc_tasks.submit();
}
function nc_tasks(fldValue) { 
	document.nc_tasks.reset();
	document.nc_tasks.user_account_id.value = fldValue;
	document.nc_tasks.submit();
}
function bn_tasks(fldValue) { 
	document.bn_tasks.reset();
	document.bn_tasks.user_account_id.value = fldValue;
	document.bn_tasks.submit();
}
</cfoutput>//-->
</script>
<cfoutput>
<form name="sup_to_emp" action="index.cfm?fuseaction=Reports.employee_force" method="post">
	<input type="hidden" name="from_date" value="#attributes.from_date#">
	<input type="hidden" name="through_date" value="#attributes.through_date#">
	<input type="hidden" name="user_account_id" value="#variables.user_identification#">
</form>
<form name="bc_tasks" action="index.cfm?fuseaction=Reports.employee_force" method="post">
	<input type="hidden" name="from_date" value="#attributes.from_date#">
	<input type="hidden" name="through_date" value="#attributes.through_date#">
	<input type="hidden" name="user_account_id" value="#variables.user_identification#">
	<input type="hidden" name="show_budgeted_ind" value="1">
	<input type="hidden" name="show_completed" value="1">
</form>
<form name="nc_tasks" action="index.cfm?fuseaction=Reports.employee_force" method="post">
	<input type="hidden" name="from_date" value="#attributes.from_date#">
	<input type="hidden" name="through_date" value="#attributes.through_date#">
	<input type="hidden" name="user_account_id" value="#variables.user_identification#">
	<input type="hidden" name="show_completed" value="1">
</form>
<form name="bn_tasks" action="index.cfm?fuseaction=Reports.employee_force" method="post">
	<input type="hidden" name="from_date" value="#attributes.from_date#">
	<input type="hidden" name="through_date" value="#attributes.through_date#">
	<input type="hidden" name="user_account_id" value="#variables.user_identification#">
	<input type="hidden" name="show_budgeted_ind" value="1">
</form>
</cfoutput>

