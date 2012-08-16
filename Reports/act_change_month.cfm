
<!--Reports/act_change_month.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Monthly Revenue Report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<script language="JavaScript" type="text/javascript">
<!--
function change_month(time_month, time_year) { 
	document.drill_down.reset();
	document.drill_down.admin_month.value = time_month;
	document.drill_down.admin_year.value = time_year;
	document.drill_down.submit();
}
//-->
</script>
