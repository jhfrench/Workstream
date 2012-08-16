
<!--Reports/act_force_hidden_links.cfm
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
<cf_htmlhead>
<script language="JavaScript" type="text/javascript">
<!--<cfoutput>
function sup_to_emp(fldValue) { 
	document.sup_to_emp.reset();
	document.sup_to_emp.emp_id.value = fldValue;
	document.sup_to_emp.submit();
}
</cfoutput>//-->
</script>
</cf_htmlhead>
<cfoutput>
<form name="sup_to_emp" action="#request.dir_level#index.cfm?fuseaction=Reports.employee_force" method="post">
	<input type="hidden" name="from_date" value="#attributes.from_date#">
	<input type="hidden" name="to_date" value="#attributes.to_date#">
	<input type="hidden" name="emp_id" value="#session.user_account_id#">
</form>
</cfoutput>

